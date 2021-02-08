---
layout: default
title: Patterns
topofpage: true
---

---

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## 3 QI-Core Patterns
{: #QICore-Patterns}

The patterns described here have been developed through usage of QI-Core profiles in the development of
CQL-based quality measures and decision support.

### 3.1 FHIR and CQL

Although the QI-Core profiles define additional constraints and extensions for use in clinical quality improvement
applications, the CQL written for those applications is currently written against FHIR structures. The QUICK Logical
Model and the QUICK Author-Focused View provided in this implementation guide are intended to support CQL written
directly against the QUICK model, but until tooling is completed to support that, the following patterns have emerged to
facilitate the use of FHIR with CQL.

#### ModelInfo

To support the use of FHIR, the CQL-to-ELM translator is packaged with a ModelInfo for each version of FHIR.
As new versions of FHIR are released, the translator is updated with new versions. The examples in this section
are using the `4.0.0` version of FHIR, the original R4 release version. Consult the CQL-to-ELM translator documentation
for the availability of newer versions of FHIR model info.

#### Primitives

Primitive elements in FHIR, such as String, Integer, DateTime, and so on, may have extensions, and so have more complex
structure than primitive elements typically have in other models. This means that when accessing a FHIR primitive element
 directly, a `.value` accessor must be used to get at the CQL primitive value:

```sql
define "Completed Encounter":
  ["Encounter"] E
    where E.status.value = 'finished'
```

To avoid this need, a `FHIRHelpers` library has been defined (and is included by default in the CQL-to-ELM translator). To
use this library, add the following include:

```sql
include FHIRHelpers version '4.0.0'
```

Note that the FHIRHelpers version must match the FHIR version being used.

With this include, the above simplifies to:

```sql
define "Completed Encounter":
  ["Encounter"] E
    where E.status = 'finished'
```

Note that the additional `.value` is no longer required.

#### Extensions

Extensions in FHIR provide a standard mechanism to describe additional content that is not part of the base
FHIR resources. By defining extensions in a uniform way as part of the base specification, FHIR enables extension-based
functionality to be introduced through the use of profiles and implementation guidance. QI-Core, for example, includes
several extensions related to quality improvement applications.

The QUICK Logical Model and the QUICK Author-focused View are intended to provide first-class access to extensions defined
in the QI-Core profiles, but until these mechanisms are fully available, the following functions have been defined as useful
short-hands to support accessing extension data in FHIR:

```sql
define function "GetExtensions"(domainResource DomainResource, url String):
  domainResource.extension E
	  where E.url = ('http://hl7.org/fhir/us/qicore/StructureDefinition/' + url)
		return E

define function "GetExtension"(domainResource DomainResource, url String):
  singleton from "GetExtensions"(domainResource, url)

define function "GetExtensions"(element Element, url String):
  element.extension E
	  where E.url = url
		return E

define function "GetExtension"(element Element, url String):
  singleton from "GetExtensions"(element, url)

define function "GetBaseExtensions"(domainResource DomainResource, url String):
  domainResource.extension E
	  where E.url = ('http://hl7.org/fhir/StructureDefinition/' + url)
		return E

define function "GetBaseExtension"(domainResource DomainResource, url String):
  singleton from "GetBaseExtensions"(domainResource, url)

define function "GetUSExtensions"(domainResource DomainResource, url String):
  domainResource.extension E
	  where E.url = ('http://hl7.org/fhir/us/core/StructureDefinition/' + url)
		return E

define function "GetUSExtension"(domainResource DomainResource, url String):
  singleton from "GetUSExtensions"(domainResource, url)
```

#### Choice Types

FHIR includes the notion of Choice Types, or elements that can be of any of a number of types. For example,
the `Patient.deceased` element can be specified as a `Boolean` or as a `DateTime`. Since CQL also supports choice
types, these are manifest directly as Choice Types within the FHIR Model Info.

Where appropriate, the QICoreProfiles restrict choice types to those that are appropriate for the quality improvement
use case. For example, The `QICoreCondition` profile removes `String` as a possible type for the `onset` element, to
communicate the expectation that a computable representation of onset is required for quality improvement applications.

However, because systems may communicate instances contain any of these types, quality improvement logic must be prepared
to deal with choice elements of any of the available types. To support the most common usages of choice types (for timing
  elements), the following functions have been defined:

```sql
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

### 3.1 Observations
{: #Observation_Examples}

For observations that have established profiles in US-Core, QI-Core uses those profiles:

|Profile|Description|
|---|---|
|[Vital Signs Profile]({{site.data.fhir.path}}observation-vitalsigns.html)|The FHIR Vital Signs profile sets minimum expectations for the Observation resource to record, search and fetch the vital signs associated with a patient that include the primary vital signs plus additional measurements such as height, weight and BMI.|
|[Smoking Status Profile](http://hl7.org/fhir/us/core/STU3/StructureDefinition-us-core-smokingstatus.html)|This profile sets minimum expectations for the Observation resource to record, search and fetch smoking status data associated with a patient.|
|[Laboratory Result Profile](http://hl7.org/fhir/us/core/STU3/StructureDefinition-us-core-observation-lab.html)|This profile sets minimum expectations for the Observation resource resource to record, search and fetch laboratory test results associated with a patient.|
|[Pediatric BMI For Age Profile](http://hl7.org/fhir/us/core/STU3/StructureDefinition-pediatric-bmi-for-age.html)|This profile sets minimum expectations for the Observation resource to record, search and fetch pediatric body mass index (BMI) per age and gender observations associated with a patient.|
|[Pediatric Weight For Height Profile](http://hl7.org/fhir/us/core/STU3/StructureDefinition-pediatric-weight-for-height.html)|This profile sets minimum expectations for the Observation resource to record, search and fetch pediatric weight for height and age observations associated with a patient.|
|[Pulse Oximetry Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-pulse-oximetry.html)|This profile sets minimum expectations for the Observation resource to record, search, and fetch pulse oximetry and inspired oxygen observations associated with a patient.|
{: .list}

For all other observations, use the [QICore-Observation](StructureDefinition-qicore-observation.html) profile.

For any observations _not_ done, including the observations identified in the profiles above, use the [Observation Not Done Profile](StructureDefinition-qicore-observationnotdone.html).

### 3.2 Encounter Examples

#### 3.2.1 Inpatient Encounter Example

Example source: MATGlobalCommonFunctions

```sql
define "Inpatient Encounter":
  [Encounter: "Encounter Inpatient"] EncounterInpatient
    where EncounterInpatient.status = 'finished'
      and "LengthInDays"(EncounterInpatient.period) <= 120
      and EncounterInpatient.period ends during "Measurement Period"
```

#### 3.2.2 Inpatient Encounter with Principal Diagnosis

Example source: EXM105

```sql
define "Inpatient Encounter with Principal Diagnosis of Ischemic Stroke":
  "Inpatient Encounter" Encounter
    let PrincipalDiagnosis:
      (singleton from (Encounter.diagnosis D where D.use ~ ToConcept("Billing") and D.rank = 1)) PD
        return singleton from ([Condition: id in Last(Split(PD.condition.reference, '/'))])
    where PrincipalDiagnosis.code in "Ischemic Stroke"
```

Note that the FHIRHelpers.ToConcept usage is intended to be implicit and will be unnecessary once QUICK is fully supported.

#### 3.2.3 Inpatient Encounter with Principal Procedure

Example source: VTE-1

```sql
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

### 3.3 Diagnosis Examples

Example source: EXM72_FHIR-8.1.0_TJC.cql

```sql
define "Condition of Intravenous or Intra arterial Thrombolytic (tPA) Therapy Prior to Arrival":
  Condition: "Intravenous or Intra arterial Thrombolytic (tPA) Therapy Prior to Arrival"] PriorTPA
    where clinicalStatus in { 'active', 'recurrence', 'relapse' }
```

Note that verificationStatus is not being checked due to feedback received that it may be difficult for implementers to retrieve the element.

### 3.4 Medications

Example source: EXM108_FHIR

```sql
define "VTE Prophylaxis by Medication Administered":
  ["MedicationAdministration": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] VTEMedication
    where VTEMedication.status = 'completed'
      and VTEMedication.dosage.route in "Subcutaneous route"
```

#### 3.4.1 Medications at discharge

Example source: EXM104_FHIR-8.1.000_TJC.cql

```sql
define "Antithrombotic Therapy at Discharge":
  ["MedicationRequest": "Antithrombotic Therapy"] Antithrombotic
    where exists (Antithrombotic.category C where FHIRHelpers.ToConcept(C) ~ "Discharge")
      and Antithrombotic.intent = 'order'
```

Note that the FHIRHelpers.ToConcept usage is intended to be implicit and will be unnecessary once QUICK is fully supported.

#### 3.4.2 Medication not discharged

```sql
define "Antithrombotic Not Given at Discharge":
  ["MedicationRequest": "Antithrombotic Therapy"] NoAntithromboticDischarge
    where NoAntithromboticDischarge.doNotPerform is true
      and (singleton from NoAntithromboticDischarge.reasonCode in "Medical Reason"
        or singleton from NoAntithromboticDischarge.reasonCode in "Patient Refusal")
```

#### 3.4.3 Medication not administered

Example source: EXM108_FHIR

```sql
define "No VTE Prophylaxis Medication Administered":
  ["MedicationAdministration": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] MedicationAdm
    where MedicationAdm.status = 'not-done'
```

#### 3.4.4 Medication not ordered

Example source: EXM108_FHIR

```sql
define "No VTE Prophylaxis Medication Ordered":
  ["MedicationRequest": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] MedicationOrder
    where MedicationOrder.intent = 'order'
      and MedicationOrder.doNotPerform is true
```

Ballot-note: Note that the MedicationRequest status element is not being checked here. What is the status element expected to be for a MedicationRequest with doNotPerform set to true?

### 3.5 Procedures/Interventions

Example source: EXM108_FHIR

```sql
define "Intervention Comfort Measures":
  (["ServiceRequest": "Comfort Measures"] P
    where P.intent = 'order'
  )
    union (["Procedure": "Comfort Measures"] InterventionPerformed
      where InterventionPerformed.status in {'completed', 'in-progress'}
    )
```

#### 3.5.1 Device Use

Example source: EXM108_FHIR

```sql
define "VTE Prophylaxis by Device Applied":
  ["Procedure": "Device Application"] DeviceApplied
    where DeviceApplied.status = 'complete'
      and (DeviceApplied.usedCode in "Intermittent pneumatic compression devices (IPC)"
        or DeviceApplied.usedCode in"Venous foot pumps (VFP)"
        or DeviceApplied.usedCode in "Graduated compression stockings (GCS)"
)
 ```

#### 3.5.2 Device Not Used

Example source: EXM108_FHIR

```sql
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

#### 3.5.3 Device Not Ordered

Example source: EXM108_FHIR

```sql
define "No VTE Prophylaxis Device Order":
  (["ServiceRequest": "Venous foot pumps (VFP)"]
    union ["ServiceRequest": "Intermittent pneumatic compression devices (IPC)"]
    union ["ServiceRequest": "Graduated compression stockings (GCS)"]
  ) DeviceOrder
    where DeviceOrder.status = 'completed'
      and DeviceOrder.doNotPerform is true
```
