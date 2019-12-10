library ProfilePatterns

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0'

context Patient

// Profiles
// QICore-AdverseEvent
// QICore-AllergyIntolerance
// QICore-BodyStructure
// QICore-Claim
// QICore-Communication
// QICore-CommunicationRequest
// QICore-Condition
// QICore-Coverage
// QICore-Device
// QICore-DeviceRequest
// QICore-DeviceUseStatement
// QICore-DiagnosticReportLab
// QICore-DiagnosticReportNote
// QICore-Encounter
// QICore-FamilyMemberHistory
// QICore-Flag
// QICore-Goal
// QICore-ImagingStudy
// QICore-Immunization
// QICore-ImmunizationRecommendation
// QICore-Location
// QICore-Medication
// QICore-MedicationAdministration
// QICore-MedicationDispense
// QICore-MedicationRequest
// QICore-MedicationStatement
// QICore-Observation
// FHIR Vital Signs
// USCore Smoking Status
// USCore Laboratory Result
// USCore Pediatric BMI for Age
// USCore Pediatric Weight for Height
// QICore-Organization
// QICore-Patient
// QICore-Practitioner
// QICore-PractitionerRole
// QICore-Procedure
// QICore-RelatedPerson
// QICore-ServiceRequest
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
// DeviceNotRequested
// DeviceUseStatement
// Immunization
// ImmunizationNotDone
// ImmunizationRecommendation?
// ImmunizationNotRecommended?
// MedicationRequest
// MedicationNotRequested
// MedicationAdministration
// MedicationAdministrationNotDone
// MedicationDispensed
// MedicationNotDispensed
// Observation
// ObservationNotDone
// Procedure
// ProcedureNotDone
// ServiceRequest
// ServiceNotRequested

// FHIR Vital Signs
// USCore Smoking Status
// USCore Laboratory Result
// USCore Pediatric BMI for Age
// USCore Pediatric Weight for Height
