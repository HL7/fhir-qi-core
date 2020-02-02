library ProfilePatterns version '0.1.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0'

context Patient

// Profiles
// QICore-AdverseEvent
// QICore-AllergyIntolerance
  // connectathon/fhir4/cql/EXM105_FHIR4-8.1.000.cql
define "Statin Allergy":
        ["AllergyIntolerance": "Statin Allergen"] StatinAllergy
    where (StatinAllergy.clinicalStatus is null or FHIRHelpers.ToConcept(StatinAllergy.clinicalStatus) ~ Global."allergy-active")
      and FHIRHelpers.ToConcept(StatinAllergy.verificationStatus) in { Global."allergy-unconfirmed", Global."allergy-confirmed" }
// QICore-BodyStructure
// QICore-CarePlan
// QICore-CareTeam
// QICore-Claim
// QICore-Communication
// QICore-CommunicationRequest
// QICore-Condition
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Advanced Illness Diagnosis":
  [Condition: "Advanced Illness"] AdvancedIllnessDiagnosis
// QICore-Coverage
  // connectathon/fhir4/cql/SupplementalDataElements_FHIR4-1.0.0.cql
define "SDE Payer":
    [Coverage: type in "Payer"] Payer
      return {
        code: Payer.type,
         period: Payer.period
      }
// QICore-Device
// QICore-DeviceRequest
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Has Criteria Indicating Frailty":
  exists ( [DeviceRequest: "Frailty Device"] FrailtyDeviceOrder
                  where FrailtyDeviceOrder.authordOn during day of "Measurment Period"
  )
        or exists ( [DeviceUseStatement: "Frailty Device"] FrailtyDeviceUse
                        where FrailtyDeviceUse.timing as Period overlaps "Measurment Period"
            or FrailtyDeviceUse.timing as dateTime during day of "Measurement Period"
        )
        or exists ( [Condition: "Frailty Diagnosis"] FrailtyDiagnosis
                        where FrailtyDiagnosis.onset as Period overlaps "Measurement Period"
            or FrailtyDiagnosis.onset as dateTime during day of "Measurement Period"
        )
        or exists ( [Encounter: "Frailty Encounter"] FrailtyEncounter
                        where FrailtyEncounter.period overlaps "Measurement Period"
        )
        or exists ( [Observation: "Frailty Symptom"] FrailtySymptomObservation
                        where FrailtySymptomObservation.effective as Period overlaps "Measurement Period"
            or FrailtySymptomObservation as dateTime during day of "Measurement Period"
        )
// QICore-DeviceUseStatement
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Has Criteria Indicating Frailty":
  exists ( [DeviceRequest: "Frailty Device"] FrailtyDeviceOrder
                  where FrailtyDeviceOrder.authordOn during day of "Measurment Period"
  )
        or exists ( [DeviceUseStatement: "Frailty Device"] FrailtyDeviceUse
                        where FrailtyDeviceUse.timing as Period overlaps "Measurment Period"
            or FrailtyDeviceUse.timing as dateTime during day of "Measurement Period"
        )
        or exists ( [Condition: "Frailty Diagnosis"] FrailtyDiagnosis
                        where FrailtyDiagnosis.onset as Period overlaps "Measurement Period"
            or FrailtyDiagnosis.onset as dateTime during day of "Measurement Period"
        )
        or exists ( [Encounter: "Frailty Encounter"] FrailtyEncounter
                        where FrailtyEncounter.period overlaps "Measurement Period"
        )
        or exists ( [Observation: "Frailty Symptom"] FrailtySymptomObservation
                        where FrailtySymptomObservation.effective as Period overlaps "Measurement Period"
            or FrailtySymptomObservation as dateTime during day of "Measurement Period"
        )
// QICore-DiagnosticReportLab
// QICore-DiagnosticReportNote
// QICore-Encounter
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Outpatient Encounters with Advanced Illness":
        ( [Encounter: "Outpatient"]
                union [Encounter: "Observation"]
                union [Encounter: "ED"]
                union [Encounter: "Nonacute Inpatient"] ) OutpatientEncounter
                with "Advanced Illness Diagnosis" AdvancedIllnessDiagnosis
            such that exists (
                OutpatientEncounter.diagnosis.condition Condition
                    where EndsWith(Condition.reference, AdvancedIllnessDiagnosis.id)
                )
            and OutpatientEncounter.period starts 2 years or less before
                        end of "Measurement Period"
// QICore-FamilyMemberHistory
// QICore-Flag
// QICore-Goal
// QICore-ImagingStudy
// QICore-Immunization
// QICore-ImmunizationEvaluation
// QICore-ImmunizationRecommendation
// QICore-Location
  // connectathon/fhir4/cql/EXM108_FHIR4-8.2.000.cql
define "Encounter With ICU Location Stay 1 Day or More":
  "Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
    where exists ( QualifyingEncounter.location Location
                where Global.GetLocation(Location.location).type in "Intensive Care Unit"
                        and Global."LengthInDays"(Location.period)>= 1
                        and Location.period starts during TJC."CalendarDayOfOrDayAfter"(start of QualifyingEncounter.period)
             )
// QICore-Medication
  // connectathon/fhir4/cql/MATGlobalCommonFunctions_FHIR4-4.0.000.cql
define function "GetMedicationCode"(request MedicationRequest):
  if request.medication is CodeableConcept then
           request.medication as CodeableConcept
         else
           (singleton from ([Medication] M where M.id = GetId((request.medication as Reference).reference))).code
// QICore-MedicationAdministration
  // connectathon/fhir4/cql/EXM108_FHIR4-8.2.000.cql
define "VTE Prophylaxis by Medication Administered or Device Applied":
  ( ["MedicationAdministration": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] VTEMedication
      where VTEMedication.status ='completed'
                              and VTEMedication.dosage.route in "Subcutaneous route"
  )
    union (["MedicationAdministration": medication in "Low Molecular Weight Heparin for VTE Prophylaxis"] LMWH where LMWH.status = 'completed')
      union (["MedicationAdministration": medication in "Injectable Factor Xa Inhibitor for VTE Prophylaxis"] FactorXa where FactorXa.status = 'completed')
        union (["MedicationAdministration": medication in "Warfarin"] Warfarin where Warfarin.status = 'completed')
          union (
              ["Procedure": "Device Application"] DeviceApplied
              where DeviceApplied.status = 'complete'
                    and (DeviceApplied.usedCode in "Intermittent pneumatic compression devices (IPC)"
                        or DeviceApplied.usedCode in"Venous foot pumps (VFP)"
                        or DeviceApplied.usedCode in "Graduated compression stockings (GCS)"
                        )
              )
// QICore-MedicationDispense
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Dementia Medications In Year Before or During Measurment Period":
        ["MedicationDispense": "Dimentia Medications"] DementiaMed
                where DementiaMed.whenHandedOver as dateTime during day of Interval[
             ( start of "Measurement Period" - 1 year ), end of "Measurement Period"
        ]
// QICore-MedicationDispenseNotDone
// QICore-MedicationNotRequested
// QICore-MedicationRequest
  // connectathon/fhir4/cql/EXM104_FHIR4-8.1.000.cql
define "Antithrombotic Therapy at Discharge":
        ["MedicationRequest": medication in "Antithrombotic Therapy"] Antithrombotic
          where exists (Antithrombotic.category C where FHIRHelpers.ToConcept(C) in { Global."Community", Global."Discharge" })
      and Antithrombotic.status in { 'active', 'completed' }
            and Antithrombotic.intent.value = 'order'
// QICore-MedicationStatement
// QICore-NutritionOrder
// QICore-Observation
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Has Criteria Indicating Frailty":
  exists ( [DeviceRequest: "Frailty Device"] FrailtyDeviceOrder
                where FrailtyDeviceOrder.authordOn during day of "Measurment Period"
         )
         or exists ( [DeviceUseStatement: "Frailty Device"] FrailtyDeviceUse
                          where FrailtyDeviceUse.timing as Period overlaps "Measurment Period"
             or FrailtyDeviceUse.timing as dateTime during day of "Measurement Period"
         )
         or exists ( [Condition: "Frailty Diagnosis"] FrailtyDiagnosis
                          where FrailtyDiagnosis.onset as Period overlaps "Measurement Period"
             or FrailtyDiagnosis.onset as dateTime during day of "Measurement Period"
         )
         or exists ( [Encounter: "Frailty Encounter"] FrailtyEncounter
                          where FrailtyEncounter.period overlaps "Measurement Period"
         )
         or exists ( [Observation: "Frailty Symptom"] FrailtySymptomObservation
                          where FrailtySymptomObservation.effective as Period overlaps "Measurement Period"
             or FrailtySymptomObservation as dateTime during day of "Measurement Period"
         )
// QICore-ObservationPulseOximetry
// FHIR Vital Signs
// USCore Smoking Status
// USCore Laboratory Result
// USCore Pediatric BMI for Age
// USCore Pediatric Weight for Height
// QICore-Organization
// QICore-Patient
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Advanced Illness and Frailty Exclusion Including Over Age 80":
        //If the measure includes populations age 80 and older, then use this logic:
        (
        Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period")in Interval[66, 80]
           and "Has Criteria Indicating Frailty"
           and ( Count("Outpatient Encounters with Advanced Illness")>= 2
                or exists ( "Inpatient Encounter with Advanced Illness" )
                or exists "Dementia Medications In Year Before or During Measurement Period"
           )
        )
                or (
           Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period")>= 81
                            and "Has Criteria Indicating Frailty"
                )
// QICore-Practitioner
// QICore-PractitionerRole
// QICore-Procedure
  // connectathon/fhir4/cql/EXM108_FHIR4-8.2.000.cql
define "SCIP VTE Selected Surgery":
  (	["Procedure": "General Surgery"]
    union ["Procedure": "Gynecological Surgery"]
    union ["Procedure": "Hip Fracture Surgery"]
    union ["Procedure": "Hip Replacement Surgery"]
    union ["Procedure": "Intracranial Neurosurgery"]
    union ["Procedure": "Knee Replacement Surgery"]
    union ["Procedure": "Urological Surgery"] ) Procedure
  where Procedure.status = 'completed'
// QICore-RelatedPerson
// QICore-ServiceRequest
  // connectathon/fhir4/cql/EXM108_FHIR4-8.2.000.cql
define "Intervention Comfort Measures":
        (["ServiceRequest": "Comfort Measures"] P
                where P.intent = 'order'
  )
        union
        (["Procedure": "Comfort Measures"] InterventionPerformed
        where InterventionPerformed.status in {'completed', 'in-progress'})
// QICore-Specimen
// QICore-Substance
// QICore-Task

// Negation Examples
// Communication
// CommunicationNotDone
// CommunicationRequest
// CommunicationNotRequested
// Device
// DeviceRequest
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Has Criteria Indicating Frailty":
  exists ( [DeviceRequest: "Frailty Device"] FrailtyDeviceOrder
                  where FrailtyDeviceOrder.authordOn during day of "Measurment Period"
  )
        or exists ( [DeviceUseStatement: "Frailty Device"] FrailtyDeviceUse
                        where FrailtyDeviceUse.timing as Period overlaps "Measurment Period"
            or FrailtyDeviceUse.timing as dateTime during day of "Measurement Period"
        )
        or exists ( [Condition: "Frailty Diagnosis"] FrailtyDiagnosis
                        where FrailtyDiagnosis.onset as Period overlaps "Measurement Period"
            or FrailtyDiagnosis.onset as dateTime during day of "Measurement Period"
        )
        or exists ( [Encounter: "Frailty Encounter"] FrailtyEncounter
                        where FrailtyEncounter.period overlaps "Measurement Period"
        )
        or exists ( [Observation: "Frailty Symptom"] FrailtySymptomObservation
                        where FrailtySymptomObservation.effective as Period overlaps "Measurement Period"
            or FrailtySymptomObservation as dateTime during day of "Measurement Period"
        )
// DeviceNotRequested
// DeviceUseStatement
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Has Criteria Indicating Frailty":
  exists ( [DeviceRequest: "Frailty Device"] FrailtyDeviceOrder
                  where FrailtyDeviceOrder.authordOn during day of "Measurment Period"
  )
        or exists ( [DeviceUseStatement: "Frailty Device"] FrailtyDeviceUse
                        where FrailtyDeviceUse.timing as Period overlaps "Measurment Period"
            or FrailtyDeviceUse.timing as dateTime during day of "Measurement Period"
        )
        or exists ( [Condition: "Frailty Diagnosis"] FrailtyDiagnosis
                        where FrailtyDiagnosis.onset as Period overlaps "Measurement Period"
            or FrailtyDiagnosis.onset as dateTime during day of "Measurement Period"
        )
        or exists ( [Encounter: "Frailty Encounter"] FrailtyEncounter
                        where FrailtyEncounter.period overlaps "Measurement Period"
        )
        or exists ( [Observation: "Frailty Symptom"] FrailtySymptomObservation
                        where FrailtySymptomObservation.effective as Period overlaps "Measurement Period"
            or FrailtySymptomObservation as dateTime during day of "Measurement Period"
        )
// Immunization
// ImmunizationNotDone
// ImmunizationRecommendation
// ImmunizationNotRecommended?
// MedicationRequest
  // connectathon/fhir4/cql/EXM104_FHIR4-8.1.000.cql
define "Antithrombotic Therapy at Discharge":
        ["MedicationRequest": medication in "Antithrombotic Therapy"] Antithrombotic
          where exists (Antithrombotic.category C where FHIRHelpers.ToConcept(C) in { Global."Community", Global."Discharge" })
      and Antithrombotic.status in { 'active', 'completed' }
           and Antithrombotic.intent.value = 'order'
// MedicationNotRequested
// MedicationAdministration
  // connectathon/fhir4/cql/EXM108_FHIR4-8.2.000.cql
define "VTE Prophylaxis by Medication Administered or Device Applied":
  ( ["MedicationAdministration": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] VTEMedication
      where VTEMedication.status ='completed'
                              and VTEMedication.dosage.route in "Subcutaneous route"
  )
    union (["MedicationAdministration": medication in "Low Molecular Weight Heparin for VTE Prophylaxis"] LMWH where LMWH.status = 'completed')
      union (["MedicationAdministration": medication in "Injectable Factor Xa Inhibitor for VTE Prophylaxis"] FactorXa where FactorXa.status = 'completed')
        union (["MedicationAdministration": medication in "Warfarin"] Warfarin where Warfarin.status = 'completed')
          union (
            ["Procedure": "Device Application"] DeviceApplied
            where DeviceApplied.status = 'complete'
                  and (DeviceApplied.usedCode in "Intermittent pneumatic compression devices (IPC)"
                      or DeviceApplied.usedCode in"Venous foot pumps (VFP)"
                      or DeviceApplied.usedCode in "Graduated compression stockings (GCS)"
                      )
            )
// MedicationAdministrationNotDone
// MedicationDispensed
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Dementia Medications In Year Before or During Measurement Period":
        ["MedicationDispense": "Dementia Medications"] DementiaMed
                where DementiaMed.whenHandedOver as dateTime during day of Interval[
            ( start of "Measurement Period" - 1 year ), end of "Measurement Period"
        ]
// MedicationNotDispensed
// Observation
  // connectathon/fhir4/cql/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql
define "Has Criteria Indicating Frailty":
        exists ( [DeviceRequest: "Frailty Device"] FrailtyDeviceOrder
                        where FrailtyDeviceOrder.authoredOn during day of "Measurement Period"
        )
                or exists ( [DeviceUseStatement: "Frailty Device"] FrailtyDeviceUse
                        where FrailtyDeviceUse.timing as Period overlaps "Measurement Period"
                    or FrailtyDeviceUse.timing as dateTime during day of "Measurement Period"
                )
                or exists ( [Condition: "Frailty Diagnosis"] FrailtyDiagnosis
                        where FrailtyDiagnosis.onset as Period overlaps "Measurement Period"
                    or FrailtyDiagnosis.onset as dateTime during day of "Measurement Period"
                )
                or exists ( [Encounter: "Frailty Encounter"] FrailtyEncounter
                        where FrailtyEncounter.period overlaps "Measurement Period"
                )
                or exists ( [Observation: "Frailty Symptom"] FrailtySymptomObservation
                        where FrailtySymptomObservation.effective as Period overlaps "Measurement Period"
                    or FrailtySymptomObservation.effective as dateTime during day of "Measurement Period"
                )
// ObservationNotDone
// Procedure
  // connectathon/fhir4/cql/TJCOverall_FHIR4-4.0.000.cql
define "Intervention Comfort Measures":
        (["ServiceRequest": "Comfort Measures"] P
                where P.intent = 'order')
                union
                (["Procedure": "Comfort Measures"] InterventionPerformed
                where InterventionPerformed.status = 'completed')
// ProcedureNotDone
// ServiceRequest
  // connectathon/fhir4/cql/EXM108_FHIR4-8.2.000.cql
define "Intervention Comfort Measures":
        (["ServiceRequest": "Comfort Measures"] P
                where P.intent = 'order'
  )
        union
        (["Procedure": "Comfort Measures"] InterventionPerformed
        where InterventionPerformed.status in {'completed', 'in-progress'})
// ServiceNotRequested

// FHIR Vital Signs
// USCore Smoking Status
// USCore Laboratory Result
// USCore Pediatric BMI for Age
// USCore Pediatric Weight for Height
