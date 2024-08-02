{:toc}

{: #QICore-Patterns}

The patterns described here have been developed through usage of QI-Core profiles in the development of
CQL-based quality measures and decision support. CMS program measures can be accessed at [HealthIT.gov](https://ecqi.healthit.gov/). Multiple repositories of draft FHIR-based measures have been developed and are indexed in the [eCQM Content Index](https://github.com/cqframework/ecqm-content) repository.

> NOTE: The examples in this section follow recommended best-practices as of the time of publication. However, these practices are constantly being revised based on implementer and community feedback. For a complete discussion of authoring patterns, see the [Authoring Patterns](https://github.com/cqframework/CQL-Formatting-and-Usage-Wiki/wiki/Authoring-Patterns) topic in the CQL Formatting and Usage Wiki.


#### Primitives

The QI-Core model info represents FHIR primitive elements using the system types directly, so when using QI-Core, no `.value` accessor is required.

To facilitate implementation in FHIR, references to primitive elements are translated to the FHIR representation using the same `FHIRHelpers` library used for pure-FHIR artifacts, so this library is still required as a runtime, rather than a compile-time dependency for profile-informed authoring models.

In profile-informed authoring, the primitive type is mapped to the CQL type and represented with the CQL type in the model. So a `FHIR.string` element is modeled as a `System.String`, and the translator maps that to the `FHIR.string` value using the `FHIRHelpers` library.

```cql
include FHIRHelpers version '4.0.1'
```

Note that the FHIRHelpers version must be consistent with the FHIR version being used.

#### Extensions

Extensions in FHIR provide a standard mechanism to describe additional content that is not part of the base
FHIR resources. By defining extensions in a uniform way as part of the base specification, FHIR enables extension-based functionality to be introduced through the use of profiles and implementation guidance. QI-Core includes several extensions related to quality improvement applications.

With profile-informed authoring in QI-Core, extensions and slices defined in profiles are represented directly as elements in the types. For example:

```cql
define TestSlices:
  [USCoreBloodPressure] BP
    where BP.systolic.value < 140 'mm[Hg]'
      and BP.diastolic.value < 90 'mm[Hg]'

define TestSimpleExtensions:
  Patient P
    where P.birthsex = 'M'

define TestComplexExtensions:
  Patient P
    where P.race.ombCategory contains "American Indian or Alaska Native"
      and P.race.detailed contains "Alaska Native"
```

#### Choice Types

FHIR includes the notion of Choice Types, or elements that can be of any of a number of types. For example,
the `Patient.deceased` element can be specified as a `Boolean` or as a `DateTime`. Since CQL also supports choice types, these are manifest directly as Choice Types within the Model Info.

Where appropriate, QI-Core profiles restrict choice types to those that are appropriate for the quality improvement use case. For example, The `QICoreConditionProblemsHealthConcerns` profile removes `String` as a possible type for the `onset` element, to communicate the expectation that a computable representation of onset is required for quality improvement applications.

Quality improvement logic must be prepared to deal with choice elements of any of the available types because systems may communicate instances with values of any of these types. To support the most common usages of choice types (for timing elements), the following functions have been defined:

```cql
define fluent function toInterval(choice Choice<DateTime, Quantity, Interval<DateTime>, Interval<Quantity>>):
  case
	  when choice is DateTime then
    	Interval[choice as DateTime, choice as DateTime]
		when choice is Interval<DateTime> then
  		choice as Interval<DateTime>
		when choice is Quantity then
		  Interval[Patient.birthDate + (choice as Quantity),
			  Patient.birthDate + (choice as Quantity) + 1 year)
		when choice is Interval<Quantity> then
		  Interval[Patient.birthDate + (choice.low as Quantity),
			  Patient.birthDate + (choice.high as Quantity) + 1 year)
		else
			null as Interval<DateTime>
	end

define fluent function abatementInterval(condition Condition):
	if condition.abatement is DateTime then
	  Interval[condition.abatement as DateTime, condition.abatement as DateTime]
	else if condition.abatement is Quantity then
		Interval[Patient.birthDate + (condition.abatement as Quantity),
			Patient.birthDate + (condition.abatement as Quantity) + 1 year)
	else if condition.abatement is Interval<Quantity> then
	  Interval[Patient.birthDate + (condition.abatement.low as Quantity),
		  Patient.birthDate + (condition.abatement.high as Quantity) + 1 year)
	else if condition.abatement is Interval<DateTime> then
	  Interval[condition.abatement.low, condition.abatement.high)
	else null as Interval<DateTime>

define fluent function prevalenceInterval(condition Condition):
if condition.clinicalStatus ~ "active"
  or condition.clinicalStatus ~ "recurrence"
  or condition.clinicalStatus ~ "relapse" then
  Interval[start of ToInterval(condition.onset), end of ToAbatementInterval(condition)]
else
  Interval[start of ToInterval(condition.onset), end of ToAbatementInterval(condition))

define fluent function latest(choice Choice<DateTime, Quantity, Interval<DateTime>, Interval<Quantity>> ):
  (choice.toInterval()) period
    return
      if period.hasEnd() then end of period
      else start of period

define fluent function earliest(choice Choice<DateTime, Quantity, Interval<DateTime>, Interval<Quantity>> ):
  (choice.toInterval()) period
    return
      if period.hasStart() then start of period
      else end of period
```

Note that these functions make use of the FHIRHelpers library to ensure correct processing.

> NOTE: The examples throughout this topic have been simplified to illustrate specific usage. Refer to the originating context for complete expressions.
