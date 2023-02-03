{:toc}

{: #QICore-Patterns}

The patterns described here have been developed through usage of QI-Core profiles in the development of
CQL-based quality measures and decision support. CMS program measures can be accessed at [HealthIT.gov](https://ecqi.healthit.gov/)
. The most recent examples of FHIR based measures referenced can be found [here:](https://github.com/cqframework/ecqm-content)

### FHIR and CQL

Clinical Quality Language ([CQL](http://cql.hl7.org)) is a high-level, domain-specific language focused on clinical quality and targeted at clinical knowledge artifact authors such as quality measure and decision support artifact developers. In addition, the CQL specification provides a machine-readable canonical representation called Expression Logical Model ([ELM](https://cql.hl7.org/04-logicalspecification.html)) targeted at implementations and designed to enable automated sharing of clinical knowledge.

To use CQL with FHIR, [model information](https://cql.hl7.org/07-physicalrepresentation.html#data-model-references) must be provided to the implementation environment. The [CQF Common](http://fhir.org/guides/cqf/common) IG provides a FHIR-ModelInfo library that provides this information for the base FHIR specification, as well as FHIRHelpers and FHIRCommon libraries that provide commonly used functions and declarations for clinical knowledge artifact development. To use FHIR directly, follow the documentation provided in that implementation guide.

However, this implementation guide includes a [QICore ModelInfo](Library-QICore-ModelInfo.html) library that provides model information for the profiles and extensions defined in QI-Core. To use this model, include a [using declaration](https://cql.hl7.org/02-authorsguide.html#data-models) as shown in the example below:

```cql
using QICore version '5.0.0'
```

Although not required by CQL, current best-practice is to include the version of the QICore model. For more information about how this library is constructed, refer to the [ModelInfo](modelinfo.html) topic.

#### Primitives

The QICore model info represents FHIR primitive elements using the system types directly, so when using QICore, no `.value` accessor is required.

Because of the way mapping works, the `FHIRHelpers` library is still required and is a runtime dependency rather than a compile-time dependency for the profile-informed authoring models.

In profile-informed authoring, the primitive type is mapped to the CQL type and represented with the CQL type in the model. So a `FHIR.string` element is modeled as a `System.String`, and the translator maps that to the `FHIR.string` value using the `FHIRHelpers` library.

```cql
include FHIRHelpers version '4.0.1'
```

Note that the FHIRHelpers version must match the FHIR version being used.

With this include, the following is simplified to:

```cql
define "Completed Encounter":
  ["Encounter"] E
    where E.status = 'finished'
```
from

```cql
define "Completed Encounter":
  ["Encounter"] E
    where E.status.value = 'finished'
```

#### Extensions

Extensions in FHIR provide a standard mechanism to describe additional content that is not part of the base
FHIR resources. By defining extensions in a uniform way as part of the base specification, FHIR enables extension-based functionality to be introduced through the use of profiles and implementation guidance. QI-Core includes several extensions related to quality improvement applications.

When using QICore, extensions and slices defined in profiles are represented directly as elements in the types. For example:

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
  ["us-core-blood-pressure"] BP
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

Quality improvement logic must be prepared to deal with choice elements of any of the available types because systems may communicate instances contain any of these types. To support the most common usages of choice types (for timing elements), the following functions have been defined:

```cql
define function ToInterval(choice Choice<DateTime, Quantity, Interval<DateTime>, Interval<Quantity>>):
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

define function ToAbatementInterval(condition Condition):
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

define function ToPrevalenceInterval(condition Condition):
if condition.clinicalStatus ~ "active"
  or condition.clinicalStatus ~ "recurrence"
  or condition.clinicalStatus ~ "relapse" then
  Interval[start of ToInterval(condition.onset), end of ToAbatementInterval(condition)]
else
  Interval[start of ToInterval(condition.onset), end of ToAbatementInterval(condition))

define function "Latest"(choice Choice<DateTime, Quantity, Interval<DateTime>, Interval<Quantity>> ):
  (choice.toInterval()) period
    return
      if (HasEnd(period)) then end of period
      else start of period

define function "Earliest"(choice Choice<DateTime, Quantity, Interval<DateTime>, Interval<Quantity>> ):
  (choice.toInterval()) period
    return
      if (HasStart(period)) then start of period
      else end of period

```

Note that these functions make use of the FHIRHelpers library to ensure correct processing.

> NOTE: The examples throughout this topic have been simplified to illustrate specific usage. Refer to the originating context for complete expressions.

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


For all other observations, use the [QICore Observation](StructureDefinition-qicore-observation.html) profile.

For any observations _not_ done, including the observations identified in the profiles above, use the [Observation Not Done Profile](StructureDefinition-qicore-observationcancelled.html).

#### Observation Vital Signs - Blood Pressure Example

Source of example based on: CMS165 ControllingHighBloodPressureFHIR

```cql
code "Blood pressure panel with all children optional": '85354-9' from "LOINC" display 'Blood pressure panel with all children optional'
code "Diastolic blood pressure": '8462-4' from "LOINC" display 'Diastolic blood pressure'
code "Systolic blood pressure": '8480-6' from "LOINC" display 'Systolic blood pressure'

define "Qualifying Diastolic Blood Pressure Reading":
    [Observation: "Blood pressure panel with all children optional"] BloodPressure
                                  where BloodPressure.status.value in {'final', 'amended'}
                                  and Global."Normalize Interval"(BloodPressure.effective) during "Measurement Period"
    and not ((GetEncounter(BloodPressure.encounter)).class.code.value in {'emergency', 'inpatient encounter', 'inpatient acute', 'inpatient non-acute', 'pre-admission', 'short stay'})
                                  and exists (BloodPressure.component DiastolicBP
                                  where FHIRHelpers.ToConcept(DiastolicBP.code) ~ "Diastolic blood pressure"
                                  and DiastolicBP.value.unit = 'mm[Hg]')

define "Qualifying Systolic Blood Pressure Reading":
   [Observation: "Blood pressure panel with all children optional"] BloodPressure
                                    where BloodPressure.status.value in {'final', 'amended'}
                                    and Global."Normalize Interval"(BloodPressure.effective) during "Measurement Period"
    and not (GetEncounter(BloodPressure.encounter).class.code.value in {'emergency', 'inpatient encounter', 'inpatient acute', 'inpatient non-acute', 'pre-admission', 'short stay'})
                                    and exists (BloodPressure.component SystolicBP
                                    where FHIRHelpers.ToConcept(SystolicBP.code) ~ "Systolic blood pressure"
                                    and SystolicBP.value.unit = 'mm[Hg]')

define function "GetEncounter"(ref Reference):
  singleton from (AdultOutpatientEncounters."Qualifying Encounters" x where x.id = Global."GetId"(ref.reference))
```

### Encounter Examples

#### Inpatient Encounter Example

Source of example based on: CQMCOMMON

```cql
define "Inpatient Encounter": 
  [Encounter: "Encounter Inpatient"] EncounterInpatient 
  where EncounterInpatient.status = 'finished' 
  and "LengthInDays"(EncounterInpatient.period) <= 120 
  and EncounterInpatient.period ends during day of "Measurement Period" 
```

#### Inpatient Encounter with Principal Diagnosis

Source of example based on: TJCOverallFHIR

```cql
define "Ischemic Stroke Encounter":
  "Encounter with Principal Diagnosis and Age" EncounterWithAge
    		where Global.PrincipalDiagnosis(EncounterWithAge).code in "Ischemic Stroke"
```

#### Inpatient Encounter with Principal Procedure

Source of example based on: IntensiveCareUnitVenousThromboembolismProphylaxisFHIR

```cql
define "Encounter With First ICU Stay With Principal Procedure of SCIP VTE Selected Surgery":
  from
        "Encounter With ICU Location" QualifyingEncounterICU,
        "SCIP VTE Selected Surgery" SelectedProcedure
        let EncounterProcedure: Global.GetExtension ( QualifyingEncounterICU, 'qicore-encounter-procedure' )
        where FHIRHelpers.ToInteger ( Global.GetExtension ( EncounterProcedure, 'rank' ).value as FHIR.positiveInt ) = 1
          and Global.GetId ( FHIRHelpers.ToString ( ( Global.GetExtension ( EncounterProcedure, 'procedure' ).value as FHIR.Reference ).reference ) ) = SelectedProcedure.id
          and date from ( 
            end of Global."Normalize Interval" ( SelectedProcedure.performed )
          ) during VTE."CalendarDayOfOrDayAfter" ( VTE."StartOfFirstICU" ( QualifyingEncounterICU ) )
        return QualifyingEncounterICU
```

### Diagnosis Examples

Source of example based on: AntithromboticTherapyByEndofHospitalDay2FHIR4

```cql
define "Encounter with Thrombolytic Therapy Prior to Arrival":
  TJC."Ischemic Stroke Encounter" IschemicStrokeEncounter
                    where exists ((Global."EncounterDiagnosis"(IschemicStrokeEncounter)) EncounterDiagnosis
                        where (EncounterDiagnosis.code in "Intravenous or Intra arterial Thrombolytic (tPA) Therapy Prior to Arrival")
                   )
```

* Note: `verificationStatus` is not being checked due to feedback received that it may be difficult for implementers to retrieve the element.

### Medications

Source of example based on: IntensiveCareUnitVenousThromboembolismProphylaxisFHIR

```cql
define "VTE Prophylaxis by Medication Administered or Device Applied":
  ( ["MedicationAdministration":"Low Dose Unfractionated Heparin for VTE Prophylaxis"] VTEMedication
                where VTEMedication.status ='completed'
                     and VTEMedication.dosage.route in "Subcutaneous route"
            )
             union (["MedicationAdministration": "Low Molecular Weight Heparin for VTE Prophylaxis"] LMWH where LMWH.status = 'completed')
              union (["MedicationAdministration":  "Injectable Factor Xa Inhibitor for VTE Prophylaxis"] FactorXa where FactorXa.status = 'completed')
               union (["MedicationAdministration":  "Warfarin"] Warfarin where Warfarin.status = 'completed')
                union (
                    ["Procedure": "Device Application"] DeviceApplied
                    where DeviceApplied.status = 'completed'
                          and (DeviceApplied.usedCode in "Intermittent pneumatic compression devices (IPC)"
                              or DeviceApplied.usedCode in"Venous foot pumps (VFP)"
                              or DeviceApplied.usedCode in "Graduated compression stockings (GCS)"
                              )
                    )
```

#### Medications at discharge

Source of example based on: DischargedonAntithromboticTherapyFHIR4

```cql
define "Antithrombotic Therapy at Discharge":
  ["MedicationRequest": medication in "Antithrombotic Therapy"] Antithrombotic
      where Antithrombotic.doNotPerform is not true
        and exists ( Antithrombotic.category C
            where FHIRHelpers.ToConcept ( C ) ~ FHIRCommon."Community"
                  or FHIRHelpers.ToConcept ( C ) ~ FHIRCommon."Discharge"
                    )
                and Antithrombotic.status in { 'active', 'completed' }
                and Antithrombotic.intent = 'order'
```

#### Medication not discharged

Source of example based on: DischargedonAntithromboticTherapyFHIR

```cql
define "Antithrombotic Not Given at Discharge":
  ["MedicationNotRequested": medication in "Antithrombotic Therapy"] NoAntithromboticDischarge
			where (NoAntithromboticDischarge.reasonCode in "Medical Reason"
				or NoAntithromboticDischarge.reasonCode in "Patient Refusal")
      and (NoAntithromboticDischarge.isCommunity() or NoAntimthromboticDischarge.isDischarge())
      and NoAntithromboticDischarge.intent = 'order'
```

* NOTE: Because the MedicationNotRequested profile fixes the value of `doNotPerform` to true, that element does not need to be tested in the expression.

#### Medication not administered 

Source of example based on: IntensiveCareUnitVenousThromboembolismProphylaxisFHIR4

```cql
define "Low Dose Unfractionated Heparin for VTE Prophylaxis Not Administered":
  ["MedicationAdministrationNotDone": "Low Dose Unfractionated Heparin for VTE Prophylaxis"] VTEMedication
    where VTEMedication.category ~ QICoreCommon."Inpatient"
      and (VTEMedication.reasonCode in "Medical Reason" or VTEMedication.reasonCode in "Patient Refusal")
```
* Note: Because the MedicationAdministrationNotDone profile fixes the value of `status` to `not-done`, that element does not need to be tested in the expression.

#### Medication not ordered

```cql
define "Reason for Not Ordering Antithrombotic":
  ["MedicationNotRequested": "Antithrombotic Therapy"] NoAntithromboticDischarge
    where (NoAntithromboticDischarge.reasonCode in "Medical Reason"
      or NoAntithromboticDischarge.reasonCode in "Patient Refusal")
      and (NoAntithromboticDischarge.isCommunity() or NoAntithromboticDischarge.isDischarge())
      and NoAntithromboticDischarge.intent = 'order'
```

* Note: Because the MedicationNotRequested profile fixes the value of `doNotPerform` to `true`, that element does not need to be tested in the expression.


### Procedures/Interventions

Source of example based on: IntensiveCareUnitVenousThromboembolismProphylaxisFHIR

```cql
define "Intervention Comfort Measures":
  ( ["ServiceRequest": "Comfort Measures"] P
          where P.intent = 'order'
            and P.status in { 'active', 'on-hold', 'completed' }
      )
        union ( ["Procedure": "Comfort Measures"] InterventionPerformed
            where InterventionPerformed.status in { 'completed', 'in-progress' }
        )
```

#### Device Use

Source of example based on: IntensiveCareUnitVenousThromboembolismProphylaxisFHIR

```cql
define "VTE Prophylaxis by Medication Administered or Device Applied":
  ( ["MedicationAdministration":"Low Dose Unfractionated Heparin for VTE Prophylaxis"] VTEMedication
                where VTEMedication.status ='completed'
                     and VTEMedication.dosage.route in "Subcutaneous route"
            )
             union (["MedicationAdministration": "Low Molecular Weight Heparin for VTE Prophylaxis"] LMWH where LMWH.status = 'completed')
              union (["MedicationAdministration":  "Injectable Factor Xa Inhibitor for VTE Prophylaxis"] FactorXa where FactorXa.status = 'completed')
               union (["MedicationAdministration":  "Warfarin"] Warfarin where Warfarin.status = 'completed')
                union (
                    ["Procedure": "Device Application"] DeviceApplied
                    where DeviceApplied.status = 'completed'
                          and (DeviceApplied.usedCode in "Intermittent pneumatic compression devices (IPC)"
                              or DeviceApplied.usedCode in"Venous foot pumps (VFP)"
                              or DeviceApplied.usedCode in "Graduated compression stockings (GCS)"
                              )
                    )

 ```

#### Device not used

Source of example based on: IntensiveCareUnitVenousThromboembolismProphylaxisFHIR

```cql
define "Venous Foot Pump Not Used":
  ( [ProcedureNotDone: "Application of Intermittent Pneumatic Compression Devices (IPC)"] 
                  union [ProcedureNotDone: "Application of Venous Foot Pumps (VFP)"] 
                  union [ProcedureNotDone: "Application of Graduated Compression Stockings (GCS)"]) DeviceNotApplied
        let DeviceNotDoneTiming: DeviceNotApplied.recorded
        return {
          id: DeviceNotApplied.id,
          requestStatusReason: DeviceNotApplied.statusReason,
          authoredOn: DeviceNotDoneTiming
        }
      )
 ```

* NOTE: Because the ProcedureNotDone profile fixes the value of `status` to `not-done`, this element does not need to be tested in the expression

#### Device not ordered

```cql
 define "Venous Foot Pumps Not Ordered":
  ["DeviceNotRequested": "Venous Foot Pumps (VFP)"] DeviceNotOrdered
    where DeviceNotOrdered.doNotPerformReason in "Medical Reason"
      or DeviceNotOrdered.doNotPerformReason in "Patient Refusal"
```
* NOTE: Because the DeviceNotRequested profile fixes the value of `doNotPerform` to `true`, this element does not need to be tested in the expression.
