/*
@description: Common terminologies and functions used in QICore-based CQL artifacts
@comment: Beginning with QICore STU7, the modelinfo included with the published IG 
is using [derived modelinfo](https://hl7.org/fhir/uv/cql/using-modelinfo.html#derived-modelinfo)
to enable reuse of data elements and libraries defined in the [US Core](https://hl7.org/fhir/us/core) 
and [US CQL](https://hl7.org/fhir/us/cql) Common IGs. Most of the functionality defined in
previous versions of this library are now either in [FHIRCommon](https://hl7.org/fhir/uv/cql/Library-FHIRCommon.html)
or [USCoreCommon](https://hl7.org/fhir/us/cql/Library-USCoreCommon.html).

NOTE: This library is not published in this IG, it is included here for convenience. The source of truth for
this library will be the MADiE environment once it fully supports use of QICore STU7.
*/
library QICoreCommon version '5.0.0'

using QICore version '7.0.2'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1'
include hl7.fhir.uv.cql.FHIRCommon version '2.0.0'

codesystem "TaskCodeSystem": 'http://hl7.org/fhir/CodeSystem/task-code' 

//Task codes
code "Fulfill": 'fulfill' from "TaskCodeSystem" display 'Fulfill'

context Patient

/*
@description: Creates a list of integers from 1 to how many days are in the interval. Note, this wont create an index for
the final day if it is less than 24 hours. This also includes the first 24 hour period.
*/
define fluent function toDayNumbers(Period Interval<DateTime>):
  ( expand { Interval[1, duration in days between start of Period and end of Period]} ) DayNumber
    return end of DayNumber

/*
@description: Creates a list of 24 hour long intervals in an interval paired with the index (1 indexed) to which 24 hour interval it is.
Note that the result will include intervals that are closed at the beginning and open at the end
*/
define fluent function daysInPeriod(Period Interval<DateTime>):
  ( Period.toDayNumbers()) DayIndex
    let startPeriod: start of Period + (24 hours * (DayIndex - 1)),
    endPeriod: if (hours between startPeriod and end of Period < 24) then startPeriod
      else start of Period + (24 hours * DayIndex)
    return Tuple {
      dayIndex: DayIndex,
      dayPeriod: Interval[startPeriod, endPeriod)
    }