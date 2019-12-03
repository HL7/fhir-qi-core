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

> NOTE: The examples throughout this topic have been simplified to illustrate specific usage. Refer to the originating context for complete expressions.

### 3.1 Observations
{: #Observation_Examples}

For observations that have established profiles in US-Core, QI-Core uses those profiles:

|Profile|Description|
|---|---|
|[Vital Signs Profile]({{site.data.fhir.path}}observation-vitalsigns.html)|The FHIR Vital Signs profile sets minimum expectations for the Observation resource to record, search and fetch the vital signs associated with a patient that include the primary vital signs plus additional measurements such as height, weight and BMI.|
|[Smoking Status Profile](http://hl7.org/fhir/us/core/STU3/StructureDefinition-us-core-smokingstatus.html)|This profile sets minimum expectations for the Observation resource to record, search and fetch smoking status data associated with a patient.|
|[Laboratory Result Profile](http://hl7.org/fhir/us/core/STU3/StructureDefinition-us-core-observation-lab.html)|This profile sets minimum expectations for the Observation resource resource to record, search and fetch laboratory test results associated with a patient.|
|[Pediatric Bmi For Age Profile](http://hl7.org/fhir/us/core/STU3/StructureDefinition-pediatric-bmi-for-age.html)|This profile sets minimum expectations for the Observation resource to record, search and fetch pediatric body mass index (BMI) per age and gender observations associated with a patient.|
|[Pediatric Weight For Height Profile](http://hl7.org/fhir/us/core/STU3/StructureDefinition-pediatric-weight-for-height.html)|This profile sets minimum expectations for the Observation resource to record, search and fetch pediatric weight for height and age observations associated with a patient.|
{: .list}

For all other observations, use the [QICore-Observation](StructureDefinition-qicore-observation.html) profile.

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
                    (singleton from (Encounter.diagnosis D where D.role ~ ToConcept("Billing") and D.rank = 1)) PD
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
        // STU3
            where exists (
                NoAntithromboticDischarge.extension E
                    where E.url = 'http://hl7.org/fhir/us/davinci-deqm/STU3/StructureDefinition/extension-doNotPerform'
                        and E.value is true
		            )
		            // R4
		            //where NoAntithromboticDischarge.doNotPerform is true
			            and (singleton from NoAntithromboticDischarge.reasonCode in "Medical Reason"
				            or singleton from NoAntithromboticDischarge.reasonCode in "Patient Refusal")

// NOTE: On the assumption that status of not-taken is the closest to what the measure is looking for, this is the expression:
// Ballot-note: Request discussion w/ Pharmacy regarding how medications not prescribed at discharged would be documented
//define "Antithrombotic Not Given at Discharge R4":
//  ["MedicationStatement": "Antithrombotic Therapy"] AntithromboticTherapy
//	  where AntithromboticTherapy.status = 'not-taken'
//		  and (AntithromboticTherapy.statusReason in "Medical Reason"
//				or AntithrombtoicTherapy.statusReason in "Patient Refusal")
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
        where P.intent = 'order')
    union
    (["Procedure": "Comfort Measures"] IntervetionPerformed
        where IntervetionPerformed.status = 'completed')
```

#### 3.5.1 Device Use

Example source: EXM108_FHIR

```sql
define "VTE Prophylaxis by Device Applied":
    (
            ["DeviceUseStatement": code in "Intermittent pneumatic compression devices (IPC)"]
        union ["DeviceUseStatement": code in "Venous foot pumps (VFP)"]
            union ["DeviceUseStatement": code in "Graduated compression stockings (GCS)"]
    ) DeviceApplied
            where DeviceApplied.status = 'completed'
```

#### 3.5.2 Device Not Used

Example source: EXM108_FHIR

```sql
define "No VTE Prophylaxis Device Applied":
    (["DeviceUseStatement": code in "Venous foot pumps (VFP)"]
    union ["DeviceUseStatement": code in "Intermittent pneumatic compression devices (IPC)"]
    union ["DeviceUseStatement": code in "Graduated compression stockings (GCS)"]
    ) DeviceApplied
        where GetExtension(DeviceApplied.extension, 'http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-deviceusestatement-notDone').value is true
```

#### 3.5.3 Device Not Ordered

Example source: EXM108_FHIR

```sql
define "No VTE Prophylaxis Device Ordered":
    ["DeviceRequest": code in "Venous foot pumps (VFP)"]
        union ["DeviceRequest": code in "Intermittent pneumatic compression devices (IPC)"]
        union ["DeviceRequest": code in "Graduated compression stockings (GCS)"]
    ) DevideOrder
        where DevideOrder.intent = 'Order'
            and GetExtension(DevideOrder.extension, 'http://hl7.org/fhir/StructureDefinition/request-doNotPerform').value is true
```


