library UsagePatterns version '0.1.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0'

context Patient

define function "Normalize Interval"(choice Choice<FHIR.dateTime, FHIR.Period>):
  if choice is FHIR.dateTime then
	  Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
	else
	  FHIRHelpers.ToInterval(choice as FHIR.Period)

define function "Normalize Onset"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then
	  Interval[FHIRHelpers.ToDateTime(onset as FHIR.dateTime), FHIRHelpers.ToDateTime(onset as FHIR.dateTime)]
	else if onset is FHIR.Period then
	  FHIRHelpers.ToInterval(onset as FHIR.Period)
	else if onset is FHIR.Age then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age) + 1 year)
	else null

define function "Normalize Abatement"(condition Condition):
	if condition.abatement is FHIR.dateTime then
	  Interval[FHIRHelpers.ToDateTime(condition.abatement as FHIR.dateTime), FHIRHelpers.ToDateTime(condition.abatement as FHIR.dateTime)]
	else if condition.abatement is FHIR.Period then
	  FHIRHelpers.ToInterval(condition.abatement as FHIR.Period)
	else if condition.abatement is FHIR.Age then
		Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(condition.abatement as FHIR.Age),
			FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(condition.abatement as FHIR.Age) + 1 year)
	else if condition.abatement is FHIR.boolean then
	  Interval[end of "Normalize Onset"(condition.onset), condition.recordedDate)
	else null

define function "Get Prevalence Period"(condition Condition):
  Interval[start of "Normalize Onset"(condition.onset), end of "Normalize Abatement"(condition))
