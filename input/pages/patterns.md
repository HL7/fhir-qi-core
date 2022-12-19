{:toc}

{: #QICore-Patterns}

The patterns described here have been developed through usage of QI-Core profiles in the development of
CQL-based quality measures and decision support.

### FHIR and CQL

Clinical Quality Language ([CQL](http://cql.hl7.org)) is a high-level, domain-specific language focused on clinical quality and targeted at clinical knowledge artifact authors such as quality measure and decision support artifact developers. In addition, the CQL specification provides a machine-readable canonical representation called Expression Logical Model ([ELM](https://cql.hl7.org/04-logicalspecification.html)) targeted at implementations and designed to enable automated sharing of clinical knowledge.

To use CQL with FHIR, [model information](https://cql.hl7.org/07-physicalrepresentation.html#data-model-references) must be provided to the implementation environment. The [CQF Common](http://fhir.org/guides/cqf/common) IG provides a FHIR-ModelInfo library that provides this information for the base FHIR specification, as well as FHIRHelpers and FHIRCommon libraries that provide commonly used functions and declarations for clinical knowledge artifact development. To use FHIR directly, follow the documentation provided in that implementation guide.

However, this implementation guide includes a [QICore-ModelInfo](Library-QICore-ModelInfo.html) library that provides model information for the profiles and extensions defined in QI-Core. To use this model, include a [using declaration](https://cql.hl7.org/02-authorsguide.html#data-models) as shown in the example below:

```cql
using QICore version '4.2.0'
```

Although not required by CQL, current best-practice is to include the version of the QICore model. For more information about how this library is constructed, refer to the [ModelInfo](modelinfo.html) topic.

#### Primitives

Primitive elements in FHIR, such as String, Integer, DateTime, and so on, may have extensions, and so have more complex structure than primitive elements typically have in other models. This means that when accessing a FHIR primitive element directly, a `.value` accessor must be used to get at the CQL primitive value:

```cql
define "Completed Encounter":
  ["Encounter"] E
    where E.status.value = 'finished'
```

To avoid this need, a `FHIRHelpers` library has been defined (and is included by default in the CQL-to-ELM translator). To
use this library, add the following include:

```cql
include FHIRHelpers version '4.0.1'
```

Note that the FHIRHelpers version must match the FHIR version being used.

With this include, the above simplifies to:

```cql
define "Completed Encounter":
  ["Encounter"] E
    where E.status = 'finished'
```

Note that the additional `.value` is no longer required. In addition, the QICore model info represents FHIR primitive elements using the system types directly, so when using QICore, no `.value` accessor is required.

#### Extensions

Extensions in FHIR provide a standard mechanism to describe additional content that is not part of the base
FHIR resources. By defining extensions in a uniform way as part of the base specification, FHIR enables extension-based functionality to be introduced through the use of profiles and implementation guidance. QI-Core includes several extensions related to quality improvement applications.

When using FHIR directly, these extensions must be accessed explicitly, using functions such as the following:

```cql
define function "Extensions"(domainResource DomainResource, url String):
  domainResource.extension E
	  where E.url = ('http://hl7.org/fhir/us/qicore/StructureDefinition/' + url)
		return E

define function "Extension"(domainResource DomainResource, url String):
  singleton from "Extensions"(domainResource, url)

define function "Extensions"(element Element, url String):
  element.extension E
	  where E.url = url
		return E

define function "Extension"(element Element, url String):
  singleton from "Extensions"(element, url)
```

However, when using QICore, extensions and slices defined in profiles are represented directly as elements in the types. For example:

```cql
define TestSlices:
  ["observation-bp"] BP
    where BP.SystolicBP.value < 140 'mm[Hg]'
      and BP.DiastolicBP.value < 90 'mm[Hg]'

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

Where appropriate, the QICoreProfiles restrict choice types to those that are appropriate for the quality improvement use case. For example, The `QICoreCondition` profile removes `String` as a possible type for the `onset` element, to communicate the expectation that a computable representation of onset is required for quality improvement applications.

However, because systems may communicate instances contain any of these types, quality improvement logic must be prepared to deal with choice elements of any of the available types. To support the most common usages of choice types (for timing elements), the following functions have been defined:

```cql
define function "Normalize Onset"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then
      Interval[FHIRHelpers.ToDateTime(onset as FHIR.dateTime), FHIRHelpers.ToDateTime(onset as FHIR.dateTime)]
  else if onset is FHIR.Period then
    FHIRHelpers.ToInterval(onset as FHIR.Period)
  else if onset is FHIR.string then
    Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
  else if onset is FHIR.Age then
    Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age),
      FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age) + 1 year)
  else if onset is FHIR.Range then
    Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((onset as FHIR.Range).low),
      FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((onset as FHIR.Range).high) + 1 year)
  else
    null

define function "Normalize Abatement"(condition Condition):
  if condition.abatement is FHIR.dateTime then
    Interval[FHIRHelpers.ToDateTime(condition.abatement as FHIR.dateTime), FHIRHelpers.ToDateTime(condition.abatement as FHIR.dateTime)]
  else if condition.abatement is FHIR.Period then
    FHIRHelpers.ToInterval(condition.abatement as FHIR.Period)
  else if condition.abatement is FHIR.string then
    Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
  else if condition.abatement is FHIR.Age then
    Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(condition.abatement as FHIR.Age),
      FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(condition.abatement as FHIR.Age) + 1 year)
  else if condition.abatement is FHIR.Range then
    Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((condition.abatement as FHIR.Range).low),
      FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((condition.abatement as FHIR.Range).high) + 1 year)
  else if condition.abatement is FHIR.boolean then
    Interval[end of "Normalize Onset"(condition.onset), condition.recordedDate)
  else
    null

define function "Prevalence Period"(condition Condition):
  Interval[start of "Normalize Onset"(condition.onset), end of "Normalize Abatement"(condition))

define function "Normalize Interval"(choice Choice<FHIR.dateTime, FHIR.Period, FHIR.Timing, FHIR.instant, FHIR.string, FHIR.Age, FHIR.Range>):
  case
    when choice is FHIR.dateTime then
      Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
    when choice is FHIR.Period then
      FHIRHelpers.ToInterval(choice as FHIR.Period)
    when choice is FHIR.instant then
      Interval[FHIRHelpers.ToDateTime(choice as FHIR.instant), FHIRHelpers.ToDateTime(choice as FHIR.instant)]
    when choice is FHIR.Age then
      Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age),
        FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age) + 1 year )
    when choice is FHIR.Range then
      Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).low),
        FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).high) + 1 year )
    when choice is FHIR.Timing then
      Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute a single interval from a Timing type')
    when choice is FHIR.string then
      Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
    else
      null as Interval<DateTime>
  end
```

Note that these functions make use of the FHIRHelpers library to ensure correct processing.

> NOTE: The examples throughout this topic have been simplified to illustrate specific usage. Refer to the originating context for complete expressions.

<div class="new-content" markdown="1">
### Observations
{: #Observation_Examples}

For observations that have established profiles in US-Core, QI-Core uses those profiles:

- [US Core Pediatric Head Occipital-frontal Circumference Percentile Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html)
- [US Core Blood Pressure Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html)
- [US Core BMI Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html)
- [US Core Body Height Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html)
- [US Core Body Temperature Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html)
- [US Core Body Weight Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html)
- [US Core Head Circumference Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html)
- [US Core Heart Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html)
- [US Core Pediatric BMI for Age Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html)
- [US Core Pediatric Weight for Height Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html)
- [US Core Pulse Oximetry Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html)
- [US Core Respiratory Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html)
- [US Core Laboratory Result Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-lab.html)
- [US Core Smoking Status Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html)
- [US Core Observation Sexual Orientation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html)
- [US Core Observation Social History Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-social-history.html)
- [US Core Observation SDOH Assessment Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sdoh-assessment.html)
- [QICore Observation Clinical Test Result](StructureDefinition-qicore-observation-clinical-test.html)
- [QICore Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html)
- [QICore Observation Imaging Result](StructureDefinition-qicore-observation-imaging.html)
- [QICore Observation Survey](StructureDefinition-qicore-observation-survey.html)


For all other observations, use the [QICore-Observation](StructureDefinition-qicore-observation.html) profile.

For any observations _not_ done, including the observations identified in the profiles above, use the [Observation Not Done Profile](StructureDefinition-qicore-observationcancelled.html).

#### Observation Vital Signs - Blood Pressure Example

Example Source: EXM22

```cql
code "Blood pressure panel with all children optional": '85354-9' from "LOINC" display 'Blood pressure panel with all children optional'
code "Diastolic blood pressure": '8462-4' from "LOINC" display 'Diastolic blood pressure'
code "Systolic blood pressure": '8480-6' from "LOINC" display 'Systolic blood pressure'

define "Qualifying Diastolic Blood Pressure Reading":
    ["observation-bp"] BloodPressure
                                  where BloodPressure.status.value in {'final', 'amended'}
                                  and Global."Normalize Interval"(BloodPressure.effective) during "Measurement Period"
    and not ((GetEncounter(BloodPressure.encounter)).class.code.value in {'emergency', 'inpatient encounter', 'inpatient acute', 'inpatient non-acute', 'pre-admission', 'short stay'})
                                  and exists (BloodPressure.component DiastolicBP
                                  where FHIRHelpers.ToConcept(DiastolicBP.code) ~ "Diastolic blood pressure"
                                  and DiastolicBP.value.unit = 'mm[Hg]')

define "Qualifying Systolic Blood Pressure Reading":
   ["observation-bp"] BloodPressure
                                    where BloodPressure.status.value in {'final', 'amended'}
                                    and Global."Normalize Interval"(BloodPressure.effective) during "Measurement Period"
    and not (GetEncounter(BloodPressure.encounter).class.code.value in {'emergency', 'inpatient encounter', 'inpatient acute', 'inpatient non-acute', 'pre-admission', 'short stay'})
                                    and exists (BloodPressure.component SystolicBP
                                    where FHIRHelpers.ToConcept(SystolicBP.code) ~ "Systolic blood pressure"
                                    and SystolicBP.value.unit = 'mm[Hg]')

define function "GetEncounter"(ref Reference):
  singleton from (AdultOutpatientEncounters."Qualifying Encounters" x where x.id = Global."GetId"(ref.reference))
```
</div>

### Encounter Examples

#### Inpatient Encounter Example

Example source: MATGlobalCommonFunctions

```cql
define "Inpatient Encounter":
  [Encounter: "Encounter Inpatient"] EncounterInpatient
    where EncounterInpatient.status = 'finished'
      and "LengthInDays"(EncounterInpatient.period) <= 120
      and EncounterInpatient.period ends during "Measurement Period"
```

#### Inpatient Encounter with Principal Diagnosis

Example source: EXM105

```cql
define "Inpatient Encounter with Principal Diagnosis of Ischemic Stroke":
  "Inpatient Encounter" Encounter
    let PrincipalDiagnosis:
      (singleton from (Encounter.diagnosis D where D.use ~ ToConcept("Billing") and D.rank = 1)) PD
        return singleton from ([Condition: id in Last(Split(PD.condition.reference, '/'))])
    where PrincipalDiagnosis.code in "Ischemic Stroke"
```
Note that the FHIRHelpers.ToConcept usage is intended to be implicit and will be unnecessary once QUICK is fully supported.

#### Inpatient Encounter with Principal Procedure

Example source: VTE-1

```cql
define "Inpatient Encounter With Principal Procedure of SCIP VTE Selected Surgery":
  "Inpatient Encounter" Encounter
	  let PrincipalProcedure:
		  singleton from (
			  Encounter.extension E
				  where E.url = 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter-procedure'
					  and exists (E.extension I where I.url = 'type' and I.value ~ "Primary procedure")
					return singleton from (
							E.extension I where I.url = 'procedure' return GetProcedure(I.value)
						)
			)
		where PrincipalProcedure.code in "SCIP VTE Selected Surgery"

define function GetProcedure(reference Reference):
  singleton from ["Procedure": id in GetId(reference.reference))]

define function GetId(uri String):
  Last(Split(uri, '/'))
```

### Diagnosis Examples

Example source: EXM72_FHIR-8.1.0_TJC.cql

```cql
define "Condition of Intravenous or Intra arterial Thrombolytic (tPA) Therapy Prior to Arrival":
  Condition: "Intravenous or Intra arterial Thrombolytic (tPA) Therapy Prior to Arrival"] PriorTPA
    where clinicalStatus in { 'active', 'recurrence', 'relapse' }
```

Note that verificationStatus is not being checked due to feedback received that it may be difficult for implementers to retrieve the element.

### Medications

Example source: EXM108_FHIR

```cql
define "VTE Prophylaxis by Medication Administered":
  ["MedicationAdministration": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] VTEMedication
    where VTEMedication.status = 'completed'
      and VTEMedication.dosage.route in "Subcutaneous route"
```

#### Medications at discharge

Example source: EXM104_FHIR-8.1.000_TJC.cql

```cql
define "Antithrombotic Therapy at Discharge":
  ["MedicationRequest": "Antithrombotic Therapy"] Antithrombotic
    where exists (Antithrombotic.category C where FHIRHelpers.ToConcept(C) ~ "Discharge")
      and Antithrombotic.intent = 'order'
```

Note that the FHIRHelpers.ToConcept usage is intended to be implicit and will be unnecessary once QUICK is fully supported.

#### Medication not discharged

```cql
define "Antithrombotic Not Given at Discharge":
  ["MedicationRequest": "Antithrombotic Therapy"] NoAntithromboticDischarge
    where NoAntithromboticDischarge.doNotPerform is true
      and (singleton from NoAntithromboticDischarge.reasonCode in "Medical Reason"
        or singleton from NoAntithromboticDischarge.reasonCode in "Patient Refusal")
```

#### Medication not administered

Example source: EXM108_FHIR

```cql
define "No VTE Prophylaxis Medication Administered":
  ["MedicationAdministration": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] MedicationAdm
    where MedicationAdm.status = 'not-done'
```

#### Medication not ordered

Example source: EXM108_FHIR

```cql
define "No VTE Prophylaxis Medication Ordered":
  ["MedicationRequest": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] MedicationOrder
    where MedicationOrder.intent = 'order'
      and MedicationOrder.doNotPerform is true
```

Ballot-note: Note that the MedicationRequest status element is not being checked here. What is the status element expected to be for a MedicationRequest with doNotPerform set to true?

### Procedures/Interventions

Example source: EXM108_FHIR

```cql
define "Intervention Comfort Measures":
  (["ServiceRequest": "Comfort Measures"] P
    where P.intent = 'order'
  )
    union (["Procedure": "Comfort Measures"] InterventionPerformed
      where InterventionPerformed.status in {'completed', 'in-progress'}
    )
```

#### Device Use

Example source: EXM108_FHIR

```cql
define "VTE Prophylaxis by Device Applied":
  ["Procedure": "Device Application"] DeviceApplied
    where DeviceApplied.status = 'complete'
      and (DeviceApplied.usedCode in "Intermittent pneumatic compression devices (IPC)"
        or DeviceApplied.usedCode in"Venous foot pumps (VFP)"
        or DeviceApplied.usedCode in "Graduated compression stockings (GCS)"
)
 ```

#### Device Not Used

Example source: EXM108_FHIR

```cql
define "No VTE Prophylaxis Device Applied":
  ["Procedure": "Device Application"] DeviceApplied
    let DeviceNotDoneTiming: Global.GetExtension(DeviceApplied, 'qicore-recorded').value
    where (DeviceApplied.usedCode in "Intermittent pneumatic compression devices (IPC)"
      or DeviceApplied.usedCode in "Venous foot pumps (VFP)"
      or DeviceApplied.usedCode in "Graduated compression stockings (GCS)"
    )
      and  DeviceApplied.status = 'not-done'
    return {id: DeviceApplied.id, requestStatusReason: DeviceApplied.statusReason, authoredOn: DeviceNotDoneTiming}
```

#### Device Not Ordered

Example source: EXM108_FHIR

```cql
define "No VTE Prophylaxis Device Order":
  (["ServiceRequest": "Venous foot pumps (VFP)"]
    union ["ServiceRequest": "Intermittent pneumatic compression devices (IPC)"]
    union ["ServiceRequest": "Graduated compression stockings (GCS)"]
  ) DeviceOrder
    where DeviceOrder.status = 'completed'
      and DeviceOrder.doNotPerform is true
```
