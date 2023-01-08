{:toc}

### QI-Core Profiles
The following table lists the QI-Core profiles that are part of the IG, which USCore profile they are derived from, if any, and the underlying FHIR resources:

<div class="new-content" markdown="1">


|QI-Core Profile|USCore Profile|Base Resource|
|----|:----:|----:|
|*AdverseEvent*|
|[QICoreAdverseEvent](StructureDefinition-qicore-adverseevent.html)| |[AdverseEvent]({{site.data.fhir.path}}adverseevent.html)|
|*AllergyIntolerance*|
|[QICoreAllergyIntolerance](StructureDefinition-qicore-allergyintolerance.html)| [USCoreAllergyIntolerance]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-allergyintolerance.html) |[AllergyIntolerance]({{site.data.fhir.path}}allergyintolerance.html)|
|*BodyStructure*|
|[QICoreBodyStructure](StructureDefinition-qicore-bodystructure.html)| |[BodyStructure]({{site.data.fhir.path}}bodystructure.html)|
|*CarePlan*|
|[QICoreCarePlan](StructureDefinition-qicore-careplan.html)| [USCoreCarePlan]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-careplan.html) |[CarePlan]({{site.data.fhir.path}}careplan.html)|
|*CareTeam*|
|[QICoreCareTeam](StructureDefinition-qicore-careteam.html)| [USCoreCareTeam]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-careteam.html) |[CareTeam]({{site.data.fhir.path}}careteam.html)|
|*Claim*|
|[QICoreClaim](StructureDefinition-qicore-claim.html)| |[Claim]({{site.data.fhir.path}}claim.html)|
|*ClaimResponse*|
|[QICoreClaimResponse](StructureDefinition-qicore-claimresponse.html)| |[Claim]({{site.data.fhir.path}}claimresponse.html)|
|*Communication*|
|[QICoreCommunication](StructureDefinition-qicore-communication.html)| |[Communication]({{site.data.fhir.path}}communication.html)|
|[QICoreCommunicationNotDone](StructureDefinition-qicore-communicationnotdone.html)| |[Communication]({{site.data.fhir.path}}communication.html)|
|*CommunicationRequest*|
|[QICoreCommunicationRequest](StructureDefinition-qicore-communicationrequest.html)| |[CommunicationRequest]({{site.data.fhir.path}}communicationrequest.html)|
|*Condition*|
|[QICoreConditionEncounterDiagnosis](StructureDefinition-qicore-condition-encounter-diagnosis.html)| [USCore Condition Encounter Diagnosis]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-condition-encounter-diagnosis.html) |[Condition]({{site.data.fhir.path}}condition.html)|
|[QICoreConditionProblemsHealthConcerns](StructureDefinition-qicore-condition-problems-health-concerns.html)| [USCore Condition Problems Health Concerns]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-condition-problems-health-concerns.html) |[Condition]({{site.data.fhir.path}}condition.html)|
|*Coverage*|
|[QICoreCoverage](StructureDefinition-qicore-coverage.html)| |[Coverage]({{site.data.fhir.path}}coverage.html)|
|*Device*|
|[QICoreDevice](StructureDefinition-qicore-device.html)| |[Device]({{site.data.fhir.path}}device.html)|
| | [USCoreImplantableDeviceProfile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-implantable-device.html) |[Device]({{site.data.fhir.path}}device.html)|
|*DeviceRequest*|
|[QICoreDeviceNotRequested](StructureDefinition-qicore-devicenotrequested.html)| |[DeviceRequest]({{site.data.fhir.path}}devicerequest.html)|
|[QICoreDeviceRequest](StructureDefinition-qicore-devicerequest.html)| |[DeviceRequest]({{site.data.fhir.path}}devicerequest.html)|
|*DeviceUseStatement*|
|[QICoreDeviceUseStatement](StructureDefinition-qicore-deviceusestatement.html)| |[DeviceUseStatement]({{site.data.fhir.path}}deviceusestatement.html)|
|*DiagnositcReport*|
|[QICoreDiagnosticReportLab](StructureDefinition-qicore-diagnosticreport-lab.html)| [USCore Diagnostic Report Lab]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-diagnosticreport-lab.html) |[DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html)|
|[QICoreDiagnosticReportNote](StructureDefinition-qicore-diagnosticreport-note.html)| [USCore Diagnostic Report Note]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-diagnosticreport-note.html) |[DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html)|
|*Encounter*|
|[QICoreEncounter](StructureDefinition-qicore-encounter.html)| [USCoreEncounter]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-encounter.html) |[Encounter]({{site.data.fhir.path}}encounter.html)|
|*FamilyMemberHistory*|
|[QICoreFamilyMemberHistory](StructureDefinition-qicore-familymemberhistory.html)| |[FamilyMemberHistory]({{site.data.fhir.path}}familymemberhistory.html)|
|*Flag*|
|[QICoreFlag](StructureDefinition-qicore-flag.html)| |[Flag]({{site.data.fhir.path}}flag.html)|
|*Goal*|
|[QICoreGoal](StructureDefinition-qicore-goal.html)| [USCoreGoal]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-goal.html) |[Goal]({{site.data.fhir.path}}goal.html)|
|*ImagingStudy*|
|[QICoreImagingStudy](StructureDefinition-qicore-imagingstudy.html)| |[ImagingStudy]({{site.data.fhir.path}}imagingstudy.html)|
|*Immunization*|
|[QICoreImmunization](StructureDefinition-qicore-immunization.html)| [USCoreImmunization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-immunization.html) |[Immunization]({{site.data.fhir.path}}immunization.html)|
|[QICoreImmunizationNotDone](StructureDefinition-qicore-immunizationnotdone.html)| [USCoreImmunization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-immunization.html) |[Immunization]({{site.data.fhir.path}}immunization.html)|
|*ImmunizationEvaluation*|
|[QICoreImmunizationEvaluation](StructureDefinition-qicore-immunizationevaluation.html)| |[ImmunizationEvaluation]({{site.data.fhir.path}}immunizationevaluation.html)|
|*ImmunizationRecommendation*|
|[QICoreImmunizationRecommendation](StructureDefinition-qicore-immunizationrec.html)| |[ImmunizationRecommendation]({{site.data.fhir.path}}immunizationrecommendation.html)|
|*Location*|
|[QICoreLocation](StructureDefinition-qicore-location.html)| [USCoreLocation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-location.html) |[Location]({{site.data.fhir.path}}location.html)|
|*Medication*|
|[QICoreMedication](StructureDefinition-qicore-medication.html)| [USCoreMedication]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medication.html) |[Medication]({{site.data.fhir.path}}medication.html)|
|*MedicationAdministration*|
|[QICoreMedicationAdministration](StructureDefinition-qicore-medicationadministration.html)| |[MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html)|
|[QICoreMedicationAdministrationNotDone](StructureDefinition-qicore-medicationadministrationnotdone.html)| |[MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html)|
|*MedicationDispense*|
|[QICoreMedicationDispense](StructureDefinition-qicore-medicationdispense.html)| |[MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)|
|[QICoreMedicationDispenseDeclined](StructureDefinition-qicore-medicationdispensedeclined.html)| |[MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)|
|*MedicationRequest*|
|[QICoreMedicationNotRequested](StructureDefinition-qicore-medicationnotrequested.html)| [USCoreMedicationRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationrequest.html) |[MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)|
|[QICoreMedicationRequest](StructureDefinition-qicore-medicationrequest.html)| [USCoreMedicationRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationrequest.html) |[MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)|
|*MedicationStatement*|
|[QICoreMedicationStatement](StructureDefinition-qicore-medicationstatement.html)| |[MedicationStatement]({{site.data.fhir.path}}medicationstatement.html)|
|*NutritionOrder*|
|[QICoreNutritionOrder](StructureDefinition-qicore-nutritionorder.html)| |[NutritionOrder]({{site.data.fhir.path}}nutritionorder.html)|
|*Observation*|
|[QICoreObservation](StructureDefinition-qicore-observation.html)| |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICoreObservationCancelled](StructureDefinition-qicore-observationcancelled.html)| |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICoreLaboratoryResultObservation](StructureDefinition-qicore-observation-lab.html)| [USCore Laboratory Result Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-lab.html) |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICoreObservationClinicalTestResult](StructureDefinition-qicore-observation-clinical-test.html)| [USCore Observation Clincal Test Result]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-clinical-test.html) |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICoreObservationImagingResult](StructureDefinition-qicore-observation-imaging.html)| [USCore Observation Imaging Result]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-imaging.html) |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICoreObservationSurvey](StructureDefinition-qicore-observation-survey.html)| [USCore Observation Survey]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-survey.html) |[Observation]({{site.data.fhir.path}}observation.html)|
| | [USCore Vital Signs]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-vital-signs.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Blood Pressure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore BMI]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Body Height]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Body Temperature]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Body Weight]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Head Circumference]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Heart Rate]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Pediatric BMI for Age Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Pediatric Head Occipital-frontal Circumference Percentile]({{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Pediatric Weight for Height Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Pulse Oximetry]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Respiratory Rate]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Smoking Status]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Observation Sexual Orientation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Observation Social History]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-social-history.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Observation SDOH Assessment]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sdoh-assessment.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|*Organization*|
|[QICoreOrganization](StructureDefinition-qicore-organization.html)| [USCoreOrganization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-organization.html) |[Organization]({{site.data.fhir.path}}organization.html)|
|*Patient*|
|[QICorePatient](StructureDefinition-qicore-patient.html)| [USCorePatient]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-patient.html) |[Patient]({{site.data.fhir.path}}patient.html)|
|*Practitioner*|
|[QICorePractitioner](StructureDefinition-qicore-practitioner.html)| [USCorePractitioner]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitioner.html) |[Practitioner]({{site.data.fhir.path}}practitioner.html)|
|*PractitionerRole*|
|[QICorePractitionerRole](StructureDefinition-qicore-practitionerrole.html)| [USCorePractitionerRole]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitionerrole.html) |[PractitionerRole]({{site.data.fhir.path}}practitionerrole.html)|
|*Procedure*|
|[QICoreProcedure](StructureDefinition-qicore-procedure.html)| [USCoreProcedure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-procedure.html) |[Procedure]({{site.data.fhir.path}}procedure.html)|
|[QICoreProcedureNotDone](StructureDefinition-qicore-procedurenotdone.html)| [USCoreProcedure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-procedure.html) |[Procedure]({{site.data.fhir.path}}procedure.html)|
|*QuestionnaireResponse*|
|[QICoreQuestionnaireResponse](StructureDefinition-qicore-questionnaireresponse.html)| [USCore QuestionnaireResponse]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-questionnaireresponse.html) |[QuestionnaireResponse]({{site.data.fhir.path}}questionnaireresponse.html)|
|*RelatedPerson*|
|[QICoreRelatedPerson](StructureDefinition-qicore-relatedperson.html)|[USCore RelatedPerson]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-relatedperson.html) |[RelatedPerson]({{site.data.fhir.path}}relatedperson.html)|
|*ServiceRequest*|
|[QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html)|[USCore ServiceRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-servicerequest.html)  |[ServiceRequest]({{site.data.fhir.path}}servicerequest.html)|
|[QICoreServiceRequest](StructureDefinition-qicore-servicerequest.html)|[USCore ServiceRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-servicerequest.html) |[ServiceRequest]({{site.data.fhir.path}}servicerequest.html)|
|*Specimen*|
|[QICoreSpecimen](StructureDefinition-qicore-specimen.html)| |[Specimen]({{site.data.fhir.path}}specimen.html)|
|*Substance*|
|[QICoreSubstance](StructureDefinition-qicore-substance.html)| |[Substance]({{site.data.fhir.path}}substance.html)|
|*Task*|
|[QICoreTask](StructureDefinition-qicore-task.html)| |[Task]({{site.data.fhir.path}}task.html)|
|[QICoreTaskRejected](StructureDefinition-qicore-taskrejected.html)| |[Task]({{site.data.fhir.path}}task.html)|
{: .list}



### Referencing QI-Core Profiles

There are a number of  QI-Core profiles inherit directly from US Core profiles, if any, or other FHIR resources (i.e. USCoreImplantableDeviceProfile, FHIR VitalSigns, USCore Smoking Status etc.) and the underlying Reference elements can address the US Core or FHIR profiles for the items referenced. For any other references to base FHIR resources or not formally defined in a QI-Core Profile, the referenced resource **SHALL** be a QI-Core Profile if a QI-Core Profile exists for the resource type. For example, USCore Smoking Status references US Core Patient profile, the reference to Patient **SHALL** be a valid QI-Core Patient.

Note to Implementers: QI-Core profiles have been developed with the principle that if the profiles only need to provide references to QI-Core Profiles, that is insufficient to require individual QI-Core profiles for all US Core profiles. There are edge cases using this approach where the FHIR validator would not validate an assumption made by the measure author, such as that an encounter traced through an observation is a QI-Core Encounter. We think that general validation of all the resources provided to the context of a measure evaluation can address that risk without the need for deriving specific profiles that only constraint reference types. We seek feedback on this point.

This change will strengthen the requirement to use a QI-Core profile when using a base FHIR or US Core profile not formally defined in QI-Core and to use QI-Core profiles as referenced resources if a QI-Core Profile exists for that resource.
</div>
<br>
STU Note: Mappings from the QI Core Profiles to Quality Data Model have been removed from this version of the QI Core IG. The CQI Work Group is seeking implementer feedback on the value of these mappings and whether they would be useful to include in a future version of the specification. Mappings from QDM-to-QI-Core are still available on the [QDM-to-QI-Core](qdm-to-qicore.html) page, and the FHIR-to-QDM mappings are still available in the mappings section for each profile in the [STU3.2 version](http://hl7.org/fhir/us/qicore/STU32/) of this implementation guide.
