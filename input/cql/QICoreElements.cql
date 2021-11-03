/*
@author: Bryn Rhodes
@description: This library defines functions to expose extensions defined
in QICore as fluent functions in CQL.
*/
library QICoreElements version '4.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

context Patient

/* Candidates for FHIRCommon */

/*
@description: Returns true if the given MedicationRequest has a category of Community
*/
define fluent function isCommunity(medicationRequest MedicationRequest):
  exists (medicationRequest.category C
    where C ~ FC.Community
  )

/*
@description: Returns true if the given MedicationRequest has a category of Discharge
*/
define fluent function isDischarge(medicationRequest MedicationRequest):
  exists (medicationRequest.category C
    where C ~ FC.Discharge
  )

/*
@description: Normalizes a value that is a choice of timing-valued types to an equivalent interval
@comment: Normalizes a choice type of FHIR.dateTime, FHIR.Period, FHIR.Timing, FHIR.instance, FHIR.string, FHIR.Age, or FHIR.Range types
to an equivalent interval. This selection of choice types is a superset of the majority of choice types that are used as possible
representations for timing-valued elements in FHIR, allowing this function to be used across any resource. NOTE: Due to the
complexity of determining a single interval from a Timing or String type, this function will throw a run-time exception if it is used
with a Timing or String.
*/
define fluent function toInterval(choice Choice<FHIR.dateTime, FHIR.Period, FHIR.Timing, FHIR.instant, FHIR.string, FHIR.Age, FHIR.Range>):
  FC.ToInterval(choice)

/*
@description: Returns an interval representing the normalized Abatement of a given Condition resource.
@comment: NOTE: Due to the complexity of determining an interval from a String, this function will throw
a run-time exception if used with a Condition instance that has a String as the abatement value.
*/
define fluent function abatementInterval(condition Condition):
  FC.ToAbatementInterval(condition)

/*
@description: Returns an interval representing the normalized prevalence period of a given Condition resource.
@comment: Uses the ToInterval and ToAbatementInterval functions to determine the widest potential interval from
onset to abatement as specified in the given Condition.
*/
define fluent function prevalenceInterval(condition Condition):
  FC.ToPrevalenceInterval(condition)

/*
@description: Given an interval, return true if the interval has a starting boundary specified (i.e. the start of the interval is not null and not the minimum DateTime value)
*/
define fluent function hasStart(period Interval<DateTime>):
  period.low is not null

/*
@description: Given an interval, return true if the interval has an ending boundary specified (i.e. the end of the interval is not null and not the maximum DateTime value)
*/
define fluent function hasEnd(period Interval<DateTime>):
  period.high is not null

/*
@description: Given an interval, return the ending point if the interval has an ending boundary specified, otherwise, return the starting point
*/
define fluent function latest(choice Choice<FHIR.dateTime, FHIR.Period, FHIR.Timing, FHIR.instant, FHIR.string, FHIR.Age, FHIR.Range>):
  (choice.toInterval()) period
    return
      if period.hasEnd() then
        end of period
      else
        start of period

/*
@description: Given an interval, return the starting point if the interval has a starting boundary specified, otherwise, return the ending point
*/
define fluent function earliest(choice Choice<FHIR.dateTime, FHIR.Period, FHIR.Timing, FHIR.instant, FHIR.string, FHIR.Age, FHIR.Range>):
  (choice.toInterval()) period
    return
      if period.hasStart() then
        start of period
      else
        end of period

/* FHIR Extensions */

/*
@description: Surfaces the [resolutionAge](http://hl7.org/fhir/StructureDefinition/allergyintolerance-resolutionAge)
extension defined in FHIR.
@comment: This function returns the value of the extension as an Age.
@extension: http://hl7.org/fhir/StructureDefinition/allergyintolerance-resolutionAge
*/
define fluent function resolutionAge(allergyIntolerance AllergyIntolerance):
  FC.Extension(allergyIntolerance, 'http://hl7.org/fhir/StructureDefinition/allergyintolerance-resolutionAge').value as Age

/*
@description: Surfaces the [reasonRefuted](http://hl7.org/fhir/StructureDefinition/allergyintolerance-reasonRefuted)
extension defined in FHIR.
@comment: This function returns the value of the extension as a CodeableConcept.
@extension: http://hl7.org/fhir/StructureDefinition/allergyintolerance-reasonRefuted
*/
define fluent function reasonRefuted(allergyIntolerance AllergyIntolerance):
  FC.Extension(allergyIntolerance, 'http://hl7.org/fhir/StructureDefinition/allergyintolerance-reasonRefuted').value as CodeableConcept

/*
@description: Surfaces the [duration](http://hl7.org/fhir/StructureDefinition/allergyintolerance-duration)
extension defined in FHIR.
@comment: This function returns the value of the extension as a Duration.
@extension: http://hl7.org/fhir/StructureDefinition/allergyintolerance-duration
*/
define fluent function duration(allergyIntolerance BackboneElement):
  FC.Extension(allergyIntolerance, 'http://hl7.org/fhir/StructureDefinition/allergyintolerance-duration').value as Duration

/*
@description: Surfaces the [dueTo](http://hl7.org/fhir/StructureDefinition/condition-dueTo)
extension defined in FHIR.
@comment: This function returns the value of the extension as a choice of CodeableConcept or Reference.
@extension: http://hl7.org/fhir/StructureDefinition/condition-dueTo
*/
define fluent function dueTo(condition Condition):
  FC.Extension(condition, 'http://hl7.org/fhir/StructureDefinition/condition-dueTo').value as Choice<CodeableConcept, Reference>

/*
@description: Surfaces the [occurredFollowing](http://hl7.org/fhir/StructureDefinition/condition-occurredFollowing)
extension defined in FHIR.
@comment: This function returns the value of the extension as a choice of CodeableConcept or Reference
@extension: http://hl7.org/fhir/StructureDefinition/condition-occurredFollowing
*/
define fluent function occurredFollowing(condition Condition):
  FC.Extension(condition, 'http://hl7.org/fhir/StructureDefinition/condition-occurredFollowing').value as Choice<CodeableConcept, Reference>

/*
@description: Surfaces the [doNotPerform](http://hl7.org/fhir/StructureDefinition/request-doNotPerform)
modifier extension defined in FHIR.
@comment: This function returns the value of the modifier extension as a boolean
@extension: http://hl7.org/fhir/StructureDefinition/request-doNotPerform
*/
define fluent function doNotPerform(requestResource DomainResource):
  FC.ModifierExtension(requestResource, 'http://hl7.org/fhir/StructureDefinition/request-doNotPerform').value as boolean

/*
@description: Surfaces the [statusReason](http://hl7.org/fhir/StructureDefinition/request-statusReason)
extension defined in FHIR.
@comment: This function returns the value of the extension as a CodeableConcept
@extension: http://hl7.org/fhir/StructureDefinition/request-statusReason
*/
define fluent function statusReason(requestResource DomainResource):
  FC.Extension(requestResource, 'http://hl7.org/fhir/StructureDefinition/request-statusReason').value as CodeableConcept

/*
@description: Surfaces the [locationPerformed](http://hl7.org/fhir/StructureDefinition/diagnosticReport-locationPerformed)
extension defined in FHIR.
@comment: This function returns the value of the extension as a Reference
@extension: http://hl7.org/fhir/StructureDefinition/diagnosticReport-locationPerformed
*/
define fluent function locationPerformed(diagnosticReport DiagnosticReport):
  FC.Extension(diagnosticReport, 'http://hl7.org/fhir/StructureDefinition/diagnosticReport-locationPerformed').value as Reference

/*
@description: Surfaces the [abatement](http://hl7.org/fhir/StructureDefinition/familymemberhistory-abatement)
extension defined in FHIR.
@comment: This function returns the value of the extension as a choice of date, Age, or boolean
@extension: http://hl7.org/fhir/StructureDefinition/familymemberhistory-abatement
*/
define fluent function abatement(familyMemberHistory FamilyMemberHistory):
  FC.Extension(familyMemberHistory, 'http://hl7.org/fhir/StructureDefinition/familymemberhistory-abatement').value as Choice<date, Age, boolean>

/*
@description: Surfaces the [severity](http://hl7.org/fhir/StructureDefinition/familymemberhistory-severity)
extension defined in FHIR.
@comment: This function returns the value of the extension as a CodeableConcept
@extension: http://hl7.org/fhir/StructureDefinition/familymemberhistory-severity
*/
define fluent function severity(familyMemberHistory FamilyMemberHistory):
  FC.Extension(familyMemberHistory, 'http://hl7.org/fhir/StructureDefinition/familymemberhistory-severity').value as CodeableConcept

/*
@description: Surfaces the [reasonRejected](http://hl7.org/fhir/StructureDefinition/goal-reasonRejected)
extension defined in FHIR.
@comment: This function returns the value of the extension as a CodeableConcept
@extension: http://hl7.org/fhir/StructureDefinition/goal-reasonRejected
*/
define fluent function reasonRejected(goal Goal):
  FC.Extension(goal, 'http://hl7.org/fhir/StructureDefinition/goal-reasonRejected').value as CodeableConcept

/*
@description: Surfaces the [bodyPosition](http://hl7.org/fhir/StructureDefinition/observation-bodyPosition)
extension defined in FHIR.
@comment: This function returns the value of the extension as a CodeableConcept
@extension: http://hl7.org/fhir/StructureDefinition/observation-bodyPosition
*/
define fluent function bodyPosition(observation Observation):
  FC.Extension(observation, 'http://hl7.org/fhir/StructureDefinition/observation-bodyPosition').value as CodeableConcept

/*
@description: Surfaces the [delta](http://hl7.org/fhir/StructureDefinition/observation-delta)
extension defined in FHIR.
@comment: This function returns the value of the extension as a CodeableConcept
@extension: http://hl7.org/fhir/StructureDefinition/observation-delta
*/
define fluent function delta(observation Observation):
  FC.Extension(observation, 'http://hl7.org/fhir/StructureDefinition/observation-delta').value as CodeableConcept

/*
@description: Surfaces the [preferred](http://hl7.org/fhir/StructureDefinition/iso21090-preferred) extension defined in USCore.
@comment: This function returns the value of the direct extension as a boolean
@extension: http://hl7.org/fhir/StructureDefinition/iso21090-preferred
*/
define fluent function preferred(contactPoint ContactPoint):
  FC.Extension(contactPoint, 'http://hl7.org/fhir/StructureDefinition/iso21090-preferred').value as boolean

/*
@description: Surfaces the [approachBodyStructure](http://hl7.org/fhir/StructureDefinition/procedure-approachBodyStructure)
extension defined in FHIR.
@comment: This function returns the value of the extension as a Reference
@extension: http://hl7.org/fhir/StructureDefinition/procedure-approachBodyStructure
*/
define fluent function approachBodyStructure(procedure Procedure):
  FC.Extension(procedure, 'http://hl7.org/fhir/StructureDefinition/procedure-approachBodyStructure').value as Reference

/*
@description: Surfaces the [incisionDateTime](http://hl7.org/fhir/StructureDefinition/procedure-incisionDateTime)
extension defined in FHIR.
@comment: This function returns the value of the extension as a dateTime
@extension: http://hl7.org/fhir/StructureDefinition/procedure-incisionDateTime
*/
define fluent function incisionDateTime(procedure Procedure):
  FC.Extension(procedure, 'http://hl7.org/fhir/StructureDefinition/procedure-incisionDateTime').value as dateTime

/* USCore Extensions */
/*
@description: Surfaces the [ethnicity](http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity)
extension defined in USCore.
@comment: This function returns a tuple with elements for each subextension (ombCategory, detailed, and text).
@extension: http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity
*/
define fluent function ethnicity(patient Patient):
  patient P
    let ethnicityEx: FC.Extension(P, 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity')
    return
      {
        ombCategory: FC.Extension(ethnicityEx, 'ombCategory').value as Coding,
        detailed:
          (FC.Extensions(ethnicityEx, 'detailed')) E
            return E.value as Coding,
        text: FC.Extension(ethnicityEx, 'text').value as string
      }

/*
@description: Surfaces the [race](http://hl7.org/fhir/us/core/StructureDefinition/us-core-race) extension defined in USCore.
@comment: This function returns a tuple with elements for each subextension (ombCategory, detailed, and text).
@extension: http://hl7.org/fhir/us/core/StructureDefinition/us-core-race
*/
define fluent function race(patient Patient):
  patient P
    let raceEx: FC.Extension(P, 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race')
    return
      {
        ombCategory:
          (FC.Extensions(raceEx, 'ombCategory')) E
            return E.value as Coding,
        detailed:
          (FC.Extensions(raceEx, 'detailed')) E
            return E.value as Coding,
        text: FC.Extension(raceEx, 'text').value as string
      }

/*
@description: Surfaces the [birthsex](http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex) extension defined in USCore.
@comment: This function returns the value of the birthsex extension as a code
@extension: http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex
*/
define fluent function birthsex(patient Patient):
  FC.Extension(patient, 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex').value as code

/*
@description: Surfaces the [direct](http://hl7.org/fhir/us/core/StructureDefinition/us-core-direct) extension defined in USCore.
@comment: This function returns the value of the direct extension as a boolean
@extension: http://hl7.org/fhir/us/core/StructureDefinition/us-core-direct
*/
define fluent function direct(contactPoint ContactPoint):
  FC.Extension(contactPoint, 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-direct').value as boolean

/* QICore Extensions */

/*
@description: Surfaces the [isElective](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-isElective)
modifier extension defined in QICore.
@comment: This function returns the value of the isElective modifier extension as a boolean.
@extension: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-isElective
*/
define fluent function isElective(serviceRequest ServiceRequest):
  FC.ModifierExtension(serviceRequest, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-isElective').value as boolean

/*
@description: Surfaces the [procedure](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter-procedure)
extension defined in QICore.
@comment: This function returns a tuple with elements for each subextension (type, rank, and procedure).
@extension: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter-procedure
*/
define fluent function procedure(encounter Encounter):
  (FC.Extensions(encounter, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter-procedure')) E
    return {
      type: FC.Extension(E, 'type').value as CodeableConcept,
      rank: FC.Extension(E, 'rank').value as positiveInt,
      procedure: FC.Extension(E, 'procedure').value as Reference
    }

/*
@description: Surfaces the [doNotPerform](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-doNotPerformReason)
extension defined in QICore.
@comment: This function returns the value of the extension as a CodeableConcept
@extension: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-doNotPerformReason
*/
define fluent function doNotPerformReason(requestResource DomainResource):
  FC.Extension(requestResource, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-doNotPerformReason').value as CodeableConcept

/*
@description: Surfaces the [recorded](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-recorded)
extension defined in QICore.
@comment: This function returns the value of the extension as a dateTime
@extension: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-recorded
*/
define fluent function recorded(domainResource DomainResource):
  FC.Extension(domainResource, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-recorded').value as dateTime

/*
@description: Surfaces the [notDone](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDone)
modifier extension defined in QICore.
@comment: This function returns the value of the modifier extension as a boolean
@extension: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDone
*/
define fluent function notDone(eventResource DomainResource):
  FC.ModifierExtension(eventResource, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDone').value as boolean

/*
@description: Surfaces the [notDoneReason](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneReason)
extension defined in QICore.
@comment: This function returns the value of the extension as a CodeableConcept
@extension: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneReason
*/
define fluent function notDoneReason(eventResource DomainResource):
  FC.Extension(eventResource, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneReason').value as CodeableConcept

/*
@description: Surfaces the [notDoneValueSet](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneValueSet)
extension defined in QICore.
@comment: This function returns the value of the extension as a canonical
@extension: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneValueSet
*/
define fluent function notDoneValueSet(concept CodeableConcept):
  FC.Extension(concept, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneValueSet').value as canonical

/*
@description: Surfaces the [presentOnAdmission](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter-diagnosisPresentOnAdmission)
extension defined in QICore.
@comment: This function returns the value of the extension as a CodeableConcept
@extension: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter-diagnosisPresentOnAdmission
*/
define fluent function presentOnAdmission(element Element):
  FC.Extension(element, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter-diagnosisPresentOnAdmission').value as CodeableConcept
