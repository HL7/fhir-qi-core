### [QICore AdverseEvent](StructureDefinition-qicore-adverseevent.html) ###
**QI Elements:**
* date: When the event occurred
* location: Location where adverse event occurred
* recorder: Who recorded the adverse event
* contributor: Who was involved in the adverse event or the potential adverse event
* suspectEntity: The suspected agent causing the adverse event
* suspectEntity.causality: Information on the possible cause of the event
* subjectMedicalHistory: AdverseEvent.subjectMedicalHistory
<br>
<br>


### [QICore AllergyIntolerance](StructureDefinition-qicore-allergyintolerance.html) ###
**Must Have:**
* code: (QI) Code that identifies the allergy or intolerance
* patient: (QI) Who the sensitivity is for
* reaction.manifestation: Clinical symptoms/signs associated with the Event

**QI Elements:**
* AllergyIntolerance: Allergy or Intolerance (generally: Risk of adverse reaction to a substance)
* extension: Age that the allergy or intolerance resolved
* onset[x]: (QI) When allergy or intolerance was identified
<br>
<br>


### [QICore BodyStructure](StructureDefinition-qicore-bodystructure.html) ###
**QI Elements:**
* BodyStructure: Specific and identified anatomical structure
<br>
<br>


### [QICore CarePlan](StructureDefinition-qicore-careplan.html) ###
**Must Have:**
* text.status: generated \| additional
* text.div: Limited xhtml content
* status: draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* intent: proposal \| plan \| order \| option
* category: (QI) Type of plan
* category: (QI) Type of plan
* subject: (QI) Who the care plan is for.

**QI Elements:**
* CarePlan: Healthcare plan for patient or group
<br>
<br>


### [QICore CareTeam](StructureDefinition-qicore-careteam.html) ###
**Must Have:**
* subject: (QI) Who the care team is for.
* participant: Members of the team
* participant.role: Type of involvement
* participant.member: (QI) Who is involved

**QI Elements:**
* CareTeam: Planned participants in the coordination and delivery of care for a patient or group
<br>
<br>


### [QICore Claim](StructureDefinition-qicore-claim.html) ###
**QI Elements:**
* Claim: Claim, Pre-determination or Pre-authorization
* payee: Recipient of benefits payable
* payee.party: Recipient reference
* referral: Treatment referral
* facility: Servicing facility
* careTeam: Members of the care team
<br>
<br>


### [QICore ClaimResponse](StructureDefinition-qicore-claimresponse.html) ###
**QI Elements:**
* ClaimResponse: Response to a claim predetermination or preauthorization
<br>
<br>


### [QICore Communication Not Done](StructureDefinition-qicore-communicationnotdone.html) ###
**QI Elements:**
* Communication: A record of information transmitted from a sender to a receiver
<br>
<br>


### [QICore Communication](StructureDefinition-qicore-communication.html) ###
**QI Elements:**
* Communication: A record of information transmitted from a sender to a receiver
<br>
<br>


### [QICore Condition Encounter Diagnosis](StructureDefinition-qicore-condition-encounter-diagnosis.html) ###
**Must Have:**
* category: category codes
* category: encounter-diagnosis
* code: Identification of the condition, problem or diagnosis
* subject:  Who has the condition?

**QI Elements:**
* Condition: Detailed information about conditions, problems or diagnoses
<br>
<br>


### [QICore Condition Problems Health Concerns](StructureDefinition-qicore-condition-problems-health-concerns.html) ###
**Must Have:**
* category: category codes
* category: problem-list-item \| health-concern
* code: Identification of the condition, problem or diagnosis
* subject:  Who has the condition?

**QI Elements:**
* Condition: Detailed information about conditions, problems or diagnoses
<br>
<br>


### [QICore Coverage](StructureDefinition-qicore-coverage.html) ###
**Must Have:**
* identifier.type: Member Number identifier type
* status: active \| cancelled \| draft \| entered-in-error
* beneficiary:  Plan beneficiary
* relationship: Beneficiary relationship to the subscriber
* payor:  Issuer of the policy
* class.value: Group Number
* class.value: Plan Number
<br>
<br>


### [QICore Device Not Requested](StructureDefinition-qicore-devicenotrequested.html) ###
**QI Elements:**
* DeviceRequest: Medical device request
<br>
<br>


### [QICore DiagnosticReport Profile for Laboratory Results Reporting](StructureDefinition-qicore-diagnosticreport-lab.html) ###
**Must Have:**
* status: registered \| partial \| preliminary \| final +
* category:  Service category
* category:  Service category
* code: US Core Laboratory Report Order Code
* subject:  The subject of the report - usually, but not always, the patient

**QI Elements:**
* DiagnosticReport: A Diagnostic report - a combination of request information, atomic results, images, interpretation, as well as formatted reports
* basedOn: What was requested
<br>
<br>


### [QICore DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-qicore-diagnosticreport-note.html) ###
**Must Have:**
* status: registered \| partial \| preliminary \| final +
* category:  Service Category
* code:  QI-Core Report Code
* subject:  The subject of the report - usually, but not always, the patient
* media.link: Reference to the image source

**QI Elements:**
* DiagnosticReport: A Diagnostic report - a combination of request information, atomic results, images, interpretation, as well as formatted reports
<br>
<br>


### [QICore Encounter](StructureDefinition-qicore-encounter.html) ###
**Must Have:**
* identifier.system: The namespace for the identifier value
* identifier.value: The value that is unique
* status: planned \| arrived \| triaged \| in-progress \| onleave \| finished \| cancelled +
* class: Classification of patient encounter
* type: Specific type of encounter
* subject:  The patient or group present at the encounter
* location.location:  Location the encounter takes place

**QI Elements:**
* Encounter: An interaction during which services are provided to the patient
* hospitalization.origin: The location/organization from which the patient came before admission
* hospitalization.destination: Location/organization to which the patient is discharged
* partOf: Another Encounter this encounter is part of
<br>
<br>


### [QICore FamilyMemberHistory](StructureDefinition-qicore-familymemberhistory.html) ###
**QI Elements:**
* condition: Condition that the related person had
* condition.extension: When (or if) the family member's condition resolved
* condition.extension: The seriousness of the family member condition
* condition.onset[x]: When condition first manifested
<br>
<br>


### [QICore Goal](StructureDefinition-qicore-goal.html) ###
**Must Have:**
* lifecycleStatus: proposed \| planned \| accepted \| active \| on-hold \| completed \| cancelled \| entered-in-error \| rejected
* description: Code or text describing goal
* subject:  Who this goal is intended for

**QI Elements:**
* Goal: Describes the intended objective(s) for a patient, group or organization
<br>
<br>


### [QICore ImagingStudy](StructureDefinition-qicore-imagingstudy.html) ###
**QI Elements:**
* referrer: Referring physician
* interpreter: Who interpreted images
<br>
<br>


### [QICore Immunization Not Done](StructureDefinition-qicore-immunizationnotdone.html) ###
**Must Have:**
* status:  completed \| entered-in-error \| not-done
* statusReason:  Reason not done
* vaccineCode: Vaccine Product Type (bind to CVX)
* patient:  Who was immunized
* occurrence[x]: Vaccine administration date

**QI Elements:**
* Immunization: Immunization event information
<br>
<br>


### [QICore Immunization](StructureDefinition-qicore-immunization.html) ###
**Must Have:**
* status:  completed \| entered-in-error
* vaccineCode: Vaccine Product Type (bind to CVX)
* patient:  Who was immunized
* occurrence[x]: Vaccine administration date

**QI Elements:**
* Immunization: Immunization event information
* id: Logical id of this artifact
<br>
<br>


### [QICore ImmunizationEvaluation](StructureDefinition-qicore-immunizationevaluation.html) ###
**QI Elements:**
* ImmunizationEvaluation: Immunization evaluation information
* authority: Who is responsible for publishing the recommendations
<br>
<br>


### [QICore ImmunizationRecommendation](StructureDefinition-qicore-immunizationrecommendation.html) ###
**QI Elements:**
* ImmunizationRecommendation: Guidance or advice relating to an immunization
* authority: Who is responsible for protocol
* recommendation.supportingImmunization: Past immunizations supporting recommendation
* recommendation.supportingPatientInformation: Patient observations supporting recommendation
<br>
<br>


### [QICore Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html) ###
**Must Have:**
* status:  registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category:  Classification of type of observation
* category:  Classification of type of observation
* code:  Laboratory Test Name
* subject:  Who and/or what the observation is about

**QI Elements:**
* Observation: Measurements and simple assertions
<br>
<br>


### [QICore Location](StructureDefinition-qicore-location.html) ###
**Must Have:**
* name: Name by which a facility or location is known.

**QI Elements:**
* Location: Details and position information for a physical place
* partOf: Another Location this one is physically a part of
<br>
<br>


### [QICore Medication Not Requested](StructureDefinition-qicore-medicationnotrequested.html) ###
**Must Have:**
* status:  active \| on-hold \| cancelled \| completed \| entered-in-error \| stopped \| draft \| unknown
* intent: proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* medication[x]:  Medication to be taken
* subject:  Who or group medication request is for
* authoredOn:  When request was initially authored

**QI Elements:**
* MedicationRequest: Ordering of medication for patient or group
* extension: 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: US Core Medication Adherence Extension
* medication[x].coding: Code defined by a terminology system
<br>
<br>


### [QICore Medication](StructureDefinition-qicore-medication.html) ###
**Must Have:**
* code: Codes that identify this medication

**QI Elements:**
* Medication: Definition of a Medication
* manufacturer: Manufacturer of the item
* ingredient.isActive: Active ingredient indicator
<br>
<br>


### [QICore MedicationAdministration Not Done](StructureDefinition-qicore-medicationadministrationnotdone.html) ###
**QI Elements:**
* MedicationAdministration: Administration of medication to a patient
<br>
<br>


### [QICore MedicationAdministration](StructureDefinition-qicore-medicationadministration.html) ###
**QI Elements:**
* dosage: Details of how medication was taken
<br>
<br>


### [QICore MedicationDispense Declined](StructureDefinition-qicore-medicationdispensedeclined.html) ###
**Must Have:**
* status:  preparation \| in-progress \| cancelled \| on-hold \| completed \| entered-in-error \| stopped \| declined \| unknown
* medication[x]:  What medication was supplied
* subject:  Who the dispense is for
* performer.actor: Individual who was performing

**QI Elements:**
* dosageInstruction.route: How drug should enter body
<br>
<br>


### [QICore MedicationDispense](StructureDefinition-qicore-medicationdispense.html) ###
**Must Have:**
* status:  preparation​ \| in-progress​ \| cancelled​ \| on-hold​ \| completed​ \| entered-in-error​ \| stopped​ \| unknown
* medication[x]:  What medication was supplied
* subject:  Who the dispense is for
* performer.actor: Individual who was performing
<br>
<br>


### [QICore MedicationRequest](StructureDefinition-qicore-medicationrequest.html) ###
**Must Have:**
* status:  active \| on-hold \| cancelled \| completed \| entered-in-error \| stopped \| draft \| unknown
* intent: proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* medication[x]: Medication to be taken
* subject:  Who or group medication request is for

**QI Elements:**
* MedicationRequest: Ordering of medication for patient or group
* extension: 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: US Core Medication Adherence Extension
<br>
<br>


### [QICore MedicationStatement](StructureDefinition-qicore-medicationstatement.html) ###
**QI Elements:**
* reasonCode: Reason for why the medication is being/was taken
* dosage.modifierExtension: Extension
* dosage.site: Body site to administer to
<br>
<br>


### [QICore NonPatient Observation](StructureDefinition-qicore-nonpatient-observation.html) ###
**QI Elements:**
* derivedFrom:  QI Core Profiles or other resource the observation is made from
<br>
<br>


### [QICore NutritionOrder](StructureDefinition-qicore-nutritionorder.html) ###
**QI Elements:**
* identifier: Identifiers assigned to this order
<br>
<br>


### [QICore Observation Cancelled](StructureDefinition-qicore-observationcancelled.html) ###
**QI Elements:**
* derivedFrom: Related measurements the observation is made from
<br>
<br>


### [QICore Observation Clinical Result](StructureDefinition-qicore-observation-clinical-result.html) ###
**Must Have:**
* status:  registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category:  Classification of type of observation
* code:  Clinical Test or Procedure Name
* subject:  Who and/or what the observation is about

**QI Elements:**
* Observation: Measurements and simple assertions
<br>
<br>


### [QICore Observation Screening Assessment](StructureDefinition-qicore-observation-screening-assessment.html) ###
**Must Have:**
* status:  registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category:  Classification of type of observation
* category:  Classification of type of observation
* code:  Type of observation (code / type)
* subject:  Who and/or what the observation is about
<br>
<br>


### [QICore Organization](StructureDefinition-qicore-organization.html) ###
**Must Have:**
* active: Whether the organization's record is still in active use
* name: Name used for the organization

**QI Elements:**
* Organization: A grouping of people or organizations with a common purpose
* identifier: Clinical Laboratory Improvement Amendments (CLIA) Number for laboratories
* identifier: NAIC Code
<br>
<br>


### [QICore Patient](StructureDefinition-qicore-patient.html) ###
**Must Have:**
* identifier: An identifier for this patient
* identifier.system: The namespace for the identifier value
* identifier.value: The value that is unique within the system.
* name: A name associated with the patient
* telecom.system: phone \| fax \| email \| pager \| url \| sms \| other
* telecom.value: The actual contact point details
* gender: male \| female \| other \| unknown
* communication.language: The language which can be used to communicate with the patient about his or her health

**QI Elements:**
* Patient: Information about an individual or animal receiving health care services
* extension:  US Core Race Extension
* extension:  US Core ethnicity Extension
* extension:  Tribal Affiliation Extension
* extension: Birth Sex Extension
* extension:  Sex Extension
* extension:  The individual's gender identity
* name.suffix:  Parts that come after the name
* name.period:  Time period when name was/is in use
* telecom:  A contact detail for the individual
* telecom.extension: Preferred
* address.extension: Preferred
* communication:  A language which may be used to communicate with the patient about his or her health
* link: Link to another patient resource that concerns the same actual person
<br>
<br>


### [QICore Practitioner](StructureDefinition-qicore-practitioner.html) ###
**Must Have:**
* identifier:  An identifier for the person as this agent
* identifier.system:  The namespace for the identifier value
* identifier.value:  The value that is unique
* name: The name(s) associated with the practitioner
* name.family: Family name (often called 'Surname')

**QI Elements:**
* Practitioner: A person with a formal responsibility in the provisioning of healthcare or related services
<br>
<br>


### [QICore PractitionerRole](StructureDefinition-qicore-practitionerrole.html) ###
**Must Have:**
* telecom.system:  phone \| fax \| email \| pager \| url \| sms \| other
* telecom.value:  The actual contact point details

**QI Elements:**
* PractitionerRole: Roles/organizations the practitioner is associated with
<br>
<br>


### [QICore Procedure Not Done](StructureDefinition-qicore-procedurenotdone.html) ###
**Must Have:**
* status:  preparation \| in-progress \| not-done \| on-hold \| stopped \| completed \| entered-in-error \| unknown
* code:  Identification of the procedure
* subject:  Who the procedure was performed on

**QI Elements:**
* Procedure: An action that is being or was performed on a patient
* basedOn:  A request for this procedure
<br>
<br>


### [QICore Procedure](StructureDefinition-qicore-procedure.html) ###
**Must Have:**
* status:  preparation \| in-progress \| ​on-hold​ \| stopped​ \| completed \| entered-in-error​ \| unknown​
* code: Identification of the procedure
* subject:  Who the procedure was performed on

**QI Elements:**
* Procedure: An action that is being or was performed on a patient
* basedOn:  A request for this procedure
<br>
<br>


### [QICore QuestionnaireResponse](StructureDefinition-qicore-questionnaireresponse.html) ###
**Must Have:**
* questionnaire: Form being answered
* status: in-progress \| completed \| amended \| entered-in-error \| stopped
* subject:  The subject of the questions
* authored: Date the answers were gathered
* item.linkId:  Pointer to specific item from Questionnaire

**QI Elements:**
* QuestionnaireResponse: US Core Profile based on SDC QuestionnaireResponse
* extension: A signature attesting to the content
* extension: E.g. Verbal, written, electronic
* basedOn: Request fulfilled by this QuestionnaireResponse
* partOf: Part of this action
* encounter: Encounter created as part of
* source: The person who answered the questions
* item.extension: Media to display
* item.extension: A signature attesting to the content
* item.answer.extension: Answer Media to display
* item.answer.extension: Assigned Ordinal Value
<br>
<br>


### [QICore RelatedPerson](StructureDefinition-qicore-relatedperson.html) ###
**Must Have:**
* active:  Whether this related person's record is in active use
* patient:  The patient this person is related to
<br>
<br>


### [QICore Service Not Requested](StructureDefinition-qicore-servicenotrequested.html) ###
**Must Have:**
* status:  draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* intent: proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code: What is being requested/ordered
* subject:  Individual or Entity the service is ordered for
* authoredOn:  Date request signed

**QI Elements:**
* ServiceRequest: A request for a service to be performed
<br>
<br>


### [QICore ServiceRequest](StructureDefinition-qicore-servicerequest.html) ###
**Must Have:**
* status:  draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* intent: proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code: What is being requested/ordered
* subject:  Individual or Entity the service is ordered for

**QI Elements:**
* ServiceRequest: A request for a service to be performed
<br>
<br>


### [QICore Simple Observation](StructureDefinition-qicore-simple-observation.html) ###
**Must Have:**
* status:  registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category:  Classification of type of observation
* code:  Type of observation (code / type)
* subject:  Who and/or what the observation is about

**QI Elements:**
* Observation: assessment observation
* derivedFrom:  US Core Profiles or other resource the observation is made from
<br>
<br>


### [QICore Substance](StructureDefinition-qicore-substance.html) ###
**QI Elements:**
* instance: If this describes a specific package/container of the substance
* ingredient: Composition information about the substance
<br>
<br>


### [QICore Task Rejected](StructureDefinition-qicore-taskrejected.html) ###
**QI Elements:**
* Task: A task to be performed
* for: Beneficiary of the Task
* encounter: Healthcare event during which this task originated
<br>
<br>


### [QICore Task](StructureDefinition-qicore-task.html) ###
**QI Elements:**
* reasonCode: Why task is needed
<br>
<br>


