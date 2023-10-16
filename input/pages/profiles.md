{:toc}

### QI-Core Profiles
The following table lists the QI-Core profiles that are part of the IG, which USCore profile they are derived from, if any, and the underlying FHIR resources:

<div class="new-content" markdown="1">


|QI-Core Profile|USCore Profile|Base Resource|
|----|:----:|----:|
|*AdverseEvent*|
|[QICore AdverseEvent](StructureDefinition-qicore-adverseevent.html)| |[AdverseEvent]({{site.data.fhir.path}}adverseevent.html)|
|*AllergyIntolerance*|
|[QICore AllergyIntolerance](StructureDefinition-qicore-allergyintolerance.html)| [US Core AllergyIntolerance]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-allergyintolerance.html) |[AllergyIntolerance]({{site.data.fhir.path}}allergyintolerance.html)|
|*BodyStructure*|
|[QICore BodyStructure](StructureDefinition-qicore-bodystructure.html)| |[BodyStructure]({{site.data.fhir.path}}bodystructure.html)|
|*CarePlan*|
|[QICore CarePlan](StructureDefinition-qicore-careplan.html)| [US Core CarePlan]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-careplan.html) |[CarePlan]({{site.data.fhir.path}}careplan.html)|
|*CareTeam*|
|[QICore CareTeam](StructureDefinition-qicore-careteam.html)| [US Core CareTeam]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-careteam.html) |[CareTeam]({{site.data.fhir.path}}careteam.html)|
|*Claim*|
|[QICore Claim](StructureDefinition-qicore-claim.html)| |[Claim]({{site.data.fhir.path}}claim.html)|
|*ClaimResponse*|
|[QICore ClaimResponse](StructureDefinition-qicore-claimresponse.html)| |[Claim]({{site.data.fhir.path}}claimresponse.html)|
|*Communication*|
|[QICore Communication](StructureDefinition-qicore-communication.html)| |[Communication]({{site.data.fhir.path}}communication.html)|
|[QICore Communication Not Done](StructureDefinition-qicore-communicationnotdone.html)| |[Communication]({{site.data.fhir.path}}communication.html)|
|*CommunicationRequest*|
|[QICore CommunicationRequest](StructureDefinition-qicore-communicationrequest.html)| |[CommunicationRequest]({{site.data.fhir.path}}communicationrequest.html)|
|*Condition*|
|[QICore Condition Encounter Diagnosis](StructureDefinition-qicore-condition-encounter-diagnosis.html)| [US Core Condition Encounter Diagnosis]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-condition-encounter-diagnosis.html) |[Condition]({{site.data.fhir.path}}condition.html)|
|[QICore Condition Problems Health Concerns](StructureDefinition-qicore-condition-problems-health-concerns.html)| [US Core Condition Problems Health Concerns]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-condition-problems-health-concerns.html) |[Condition]({{site.data.fhir.path}}condition.html)|
|*Coverage*|
|[QICore Coverage](StructureDefinition-qicore-coverage.html)| |[Coverage]({{site.data.fhir.path}}coverage.html)|
|*Device*|
|[QICore Device](StructureDefinition-qicore-device.html)| |[Device]({{site.data.fhir.path}}device.html)|
| | [US Core Implantable Device]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-implantable-device.html) |[Device]({{site.data.fhir.path}}device.html)|
|*DeviceRequest*|
|[QICore Device Not Requested](StructureDefinition-qicore-devicenotrequested.html)| |[DeviceRequest]({{site.data.fhir.path}}devicerequest.html)|
|[QICore DeviceRequest](StructureDefinition-qicore-devicerequest.html)| |[DeviceRequest]({{site.data.fhir.path}}devicerequest.html)|
|*DeviceUseStatement*|
|[QICore DeviceUseStatement](StructureDefinition-qicore-deviceusestatement.html)| |[DeviceUseStatement]({{site.data.fhir.path}}deviceusestatement.html)|
|*DiagnositcReport*|
|[QICore DiagnosticReport Profile for Laboratory Results Reporting](StructureDefinition-qicore-diagnosticreport-lab.html)| [US Core DiagnosticReport Profile for Laboratory Results Reporting]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-diagnosticreport-lab.html) |[DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html)|
|[QICore DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-qicore-diagnosticreport-note.html)| [US Core DiagnosticReport Profile for Report and Note Exchange]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-diagnosticreport-note.html) |[DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html)|
|*Encounter*|
|[QICore Encounter](StructureDefinition-qicore-encounter.html)| [US Core Encounter]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-encounter.html) |[Encounter]({{site.data.fhir.path}}encounter.html)|
|*FamilyMemberHistory*|
|[QICore FamilyMemberHistory](StructureDefinition-qicore-familymemberhistory.html)| |[FamilyMemberHistory]({{site.data.fhir.path}}familymemberhistory.html)|
|*Flag*|
|[QICore Flag](StructureDefinition-qicore-flag.html)| |[Flag]({{site.data.fhir.path}}flag.html)|
|*Goal*|
|[QICore Goal](StructureDefinition-qicore-goal.html)| [US Core Goal]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-goal.html) |[Goal]({{site.data.fhir.path}}goal.html)|
|*ImagingStudy*|
|[QICore ImagingStudy](StructureDefinition-qicore-imagingstudy.html)| |[ImagingStudy]({{site.data.fhir.path}}imagingstudy.html)|
|*Immunization*|
|[QICore Immunization](StructureDefinition-qicore-immunization.html)| [US Core Immunization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-immunization.html) |[Immunization]({{site.data.fhir.path}}immunization.html)|
|[QICore Immunization Not Done](StructureDefinition-qicore-immunizationnotdone.html)| [US Core Immunization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-immunization.html) |[Immunization]({{site.data.fhir.path}}immunization.html)|
|*ImmunizationEvaluation*|
|[QICore ImmunizationEvaluation](StructureDefinition-qicore-immunizationevaluation.html)| |[ImmunizationEvaluation]({{site.data.fhir.path}}immunizationevaluation.html)|
|*ImmunizationRecommendation*|
|[QICore ImmunizationRecommendation](StructureDefinition-qicore-immunizationrecommendation.html)| |[ImmunizationRecommendation]({{site.data.fhir.path}}immunizationrecommendation.html)|
|*Location*|
|[QICore Location](StructureDefinition-qicore-location.html)| [US Core Location]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-location.html) |[Location]({{site.data.fhir.path}}location.html)|
|*Medication*|
|[QICore Medication](StructureDefinition-qicore-medication.html)| [US Core Medication]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medication.html) |[Medication]({{site.data.fhir.path}}medication.html)|
|*MedicationAdministration*|
|[QICore MedicationAdministration](StructureDefinition-qicore-medicationadministration.html)| |[MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html)|
|[QICore MedicationAdministration Not Done](StructureDefinition-qicore-medicationadministrationnotdone.html)| |[MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html)|
|*MedicationDispense*|
|[QICore MedicationDispense](StructureDefinition-qicore-medicationdispense.html)| [US Core MedicationDispense]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationdispense.html)  |[MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)|
|[QICore MedicationDispense Declined](StructureDefinition-qicore-medicationdispensedeclined.html)| [US Core MedicationDispense]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationdispense.html)  |[MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)|
|*MedicationRequest*|
|[QICore Medication Not Requested](StructureDefinition-qicore-medicationnotrequested.html)| [US Core MedicationRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationrequest.html) |[MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)|
|[QICore MedicationRequest](StructureDefinition-qicore-medicationrequest.html)| [US Core MedicationRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationrequest.html) |[MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)|
|*MedicationStatement*|
|[QICore MedicationStatement](StructureDefinition-qicore-medicationstatement.html)| |[MedicationStatement]({{site.data.fhir.path}}medicationstatement.html)|
|*NutritionOrder*|
|[QICore NutritionOrder](StructureDefinition-qicore-nutritionorder.html)| |[NutritionOrder]({{site.data.fhir.path}}nutritionorder.html)|
|*Observation*|
|[QICore Simple Observation](StructureDefinition-qicore-simple-observation.html)| [US Core Simple Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-simple-observation.html) |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICore Observation Cancelled](StructureDefinition-qicore-observationcancelled.html)|  |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICore Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html)| [US Core Laboratory Result Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-lab.html) |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICore Observation Clinical Result](StructureDefinition-qicore-observation-clinical-result.html)| [US Core Observation Clinical Result]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-clinical-result.html) |[Observation]({{site.data.fhir.path}}observation.html)|
|[QICore Observation Screening Assessment](StructureDefinition-qicore-observation-screening-assessment.html)| [US Core Observation Screening Assessment]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-screening-assessment.html) |[Observation]({{site.data.fhir.path}}observation.html)|
| | [US Core Vital Signs]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-vital-signs.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Blood Pressure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core BMI]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Body Height]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Body Temperature]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Body Weight]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Head Circumference]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Heart Rate]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Pediatric BMI for Age Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Pediatric Head Occipital-frontal Circumference Percentile]({{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Pediatric Weight for Height Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Pulse Oximetry]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Respiratory Rate]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Smoking Status]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Observation Occupation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-occupation.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Observation Sexual Orientation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Observation Pregnancy Intent]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancyintent.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [US Core Observation Pregnancy Status]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancystatus.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|*Organization*|
|[QICore Organization](StructureDefinition-qicore-organization.html)| [US Core Organization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-organization.html) |[Organization]({{site.data.fhir.path}}organization.html)|
|*Patient*|
|[QICore Patient](StructureDefinition-qicore-patient.html)| [US Core Patient]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-patient.html) |[Patient]({{site.data.fhir.path}}patient.html)|
|*Practitioner*|
|[QICore Practitioner](StructureDefinition-qicore-practitioner.html)| [US Core Practitioner]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitioner.html) |[Practitioner]({{site.data.fhir.path}}practitioner.html)|
|*PractitionerRole*|
|[QICore PractitionerRole](StructureDefinition-qicore-practitionerrole.html)| [US Core PractitionerRole]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitionerrole.html) |[PractitionerRole]({{site.data.fhir.path}}practitionerrole.html)|
|*Procedure*|
|[QICore Procedure](StructureDefinition-qicore-procedure.html)| [US Core Procedure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-procedure.html) |[Procedure]({{site.data.fhir.path}}procedure.html)|
|[QICore Procedure Not Done](StructureDefinition-qicore-procedurenotdone.html)| [US Core Procedure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-procedure.html) |[Procedure]({{site.data.fhir.path}}procedure.html)|
|*QuestionnaireResponse*|
|[QICore QuestionnaireResponse](StructureDefinition-qicore-questionnaireresponse.html)| [US Core QuestionnaireResponse]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-questionnaireresponse.html) |[QuestionnaireResponse]({{site.data.fhir.path}}questionnaireresponse.html)|
|*RelatedPerson*|
|[QICore RelatedPerson](StructureDefinition-qicore-relatedperson.html)|[US Core RelatedPerson]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-relatedperson.html) |[RelatedPerson]({{site.data.fhir.path}}relatedperson.html)|
|*ServiceRequest*|
|[QICore Service Not Requested](StructureDefinition-qicore-servicenotrequested.html)|[US Core ServiceRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-servicerequest.html)  |[ServiceRequest]({{site.data.fhir.path}}servicerequest.html)|
|[QICore ServiceRequest](StructureDefinition-qicore-servicerequest.html)|[US Core ServiceRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-servicerequest.html) |[ServiceRequest]({{site.data.fhir.path}}servicerequest.html)|
|*Specimen*|
| | [US Core Specimen]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-specimen.html)|[Specimen]({{site.data.fhir.path}}specimen.html)|
|*Substance*|
|[QICore Substance](StructureDefinition-qicore-substance.html)| |[Substance]({{site.data.fhir.path}}substance.html)|
|*Task*|
|[QICore Task](StructureDefinition-qicore-task.html)| |[Task]({{site.data.fhir.path}}task.html)|
|[QICore Task Rejected](StructureDefinition-qicore-taskrejected.html)| |[Task]({{site.data.fhir.path}}task.html)|
{: .list}

</div>

### Referencing QI-Core Profiles

There are a number of  QI-Core profiles inherited directly from US Core profiles, if any, or other FHIR resources (i.e. US Core Implantable Device Profile, FHIR Vital Signs, US Core Smoking Status etc.) and the underlying Reference elements can address the US Core or FHIR profiles for the items referenced. For any other references to base FHIR resources or not formally defined in a QI-Core Profile, the referenced resource **SHALL** be a QI-Core Profile if a QI-Core Profile exists for the resource type. For example, USCore Smoking Status references US Core Patient profile, the reference to Patient **SHALL** be a valid QI-Core Patient.

Note to Implementers: QI-Core profiles have been developed with the principle that if the profiles only need to provide references to QI-Core Profiles, that is insufficient to require individual QI-Core profiles for all US Core profiles. There are edge cases using this approach where the FHIR validator would not validate an assumption made by the measure author, such as that an encounter traced through an observation is a QI-Core Encounter. We think that general validation of all the resources provided to the context of a measure evaluation can address that risk without the need for deriving specific profiles that only constraint reference types. We seek feedback on this point.

This change will strengthen the requirement to use a QI-Core profile when using a base FHIR or US Core profile not formally defined in QI-Core and to use QI-Core profiles as referenced resources if a QI-Core Profile exists for that resource.

<br>
STU Note: Mappings from the QI Core Profiles to Quality Data Model have been removed from this version of the QI Core IG. The CQI Work Group is seeking implementer feedback on the value of these mappings and whether they would be useful to include in a future version of the specification. Mappings from QDM-to-QI-Core are still available on the [QDM-to-QI-Core](qdm-to-qicore.html) page, and the FHIR-to-QDM mappings are still available in the mappings section for each profile in the [STU3.2 version](http://hl7.org/fhir/us/qicore/STU32/) of this implementation guide.
