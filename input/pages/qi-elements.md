### [QICore AdverseEvent](StructureDefinition-qicore-adverseevent.html) ###
**QI Elements:**
* actuality: (QI) actual \| potential
* category: (QI) product-problem \| product-quality \| product-use-error \| wrong-dose \| incorrect-prescribing-information \| wrong-technique \| wrong-route-of-administration \| wrong-rate \| wrong-duration \| wrong-time \| expired-drug \| medical-device-use-error \| problem-different-manufacturer \| unsafe-physical-environment
* event: (QI) Type of the event itself in relation to the subject
* subject: (QI) Subject impacted by event
* encounter: (QI) Encounter created as part of
* recordedDate: (QI) When the event was recorded
* resultingCondition: (QI) Effect on the subject due to this event
* suspectEntity.instance: (QI) Refers to the specific entity that caused the adverse event

**Primary code path:** event
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore AllergyIntolerance](StructureDefinition-qicore-allergyintolerance.html) ###
**Must Have:**
* code: (QI) Code that identifies the allergy or intolerance
* patient: (QI) Who the sensitivity is for
* reaction.manifestation: Clinical symptoms/signs associated with the Event


**QI Elements:**
* clinicalStatus: (QI) active \| inactive \| resolved
* type: (QI) allergy \| intolerance - Underlying mechanism (if known)
* category: (QI) food \| medication \| environment \| biologic
* criticality: (QI) low \| high \| unable-to-assess
* onset[x]: (QI) When allergy or intolerance was identified
* recordedDate: (QI) Date first version of the resource instance was recorded
* lastOccurrence: (QI) Date(/time) of last known occurrence of a reaction
* reaction: (QI) Adverse Reaction Events linked to exposure to substance
* reaction.severity: (QI) mild \| moderate \| severe (of event as a whole)

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore BodyStructure](StructureDefinition-qicore-bodystructure.html) ###
**QI Elements:**
* active: (QI) Whether this record is in active use
* location: (QI) Body site
* locationQualifier: (QI) Body site modifier
* patient: (QI) Who this is about

**Primary code path:** location
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



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

**Primary code path:** category
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore CareTeam](StructureDefinition-qicore-careteam.html) ###
**Must Have:**
* subject: (QI) Who the care team is for.
* participant: Members of the team
* participant.role: Type of involvement
* participant.member: (QI) Who is involved

**Primary code path:** category
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Claim](StructureDefinition-qicore-claim.html) ###
**QI Elements:**
* patient: (QI) The recipient of the products and services
* billablePeriod: (QI) Relevant time frame for the claim
* created: (QI) Resource creation date
* provider: (QI) Party responsible for the claim
* prescription: (QI) Prescription authorizing services and products
* diagnosis.sequence: (QI) Diagnosis instance identifier
* diagnosis.diagnosis[x]: (QI) Nature of illness or problem
* diagnosis.onAdmission: (QI) Present on admission
* procedure.sequence: (QI) Procedure instance identifier
* procedure.procedure[x]: (QI) Specific clinical procedure
* item.encounter: (QI) Encounters related to this billed item

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore ClaimResponse](StructureDefinition-qicore-claimresponse.html) ###
**QI Elements:**
* status: (QI) active \| cancelled \| draft \| entered-in-error
* type: (QI) More granular claim type
* use: (QI) claim \| preauthorization \| predetermination
* patient: (QI) The recipient of the products and services
* created: (QI) Response creation date
* insurer: (QI) Party responsible for reimbursement
* requestor: (QI) Party responsible for the claim
* request: (QI) Id of resource triggering adjudication
* item: (QI) Adjudication for claim line items
* item.adjudication: (QI) Adjudication details
* item.adjudication.category: (QI) This code is fixed to 'submitted' to indicate that the adjudication result is on what was submitted.
* item.adjudication.amount: (QI) Monetary amount
* item.detail.detailSequence: (QI) Claim detail instance identifier

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Communication Not Done](StructureDefinition-qicore-communicationnotdone.html) ###
**QI Elements:**
* recorded: (QI) Extension
* status: (QI) preparation \| in-progress \| not-done \| on-hold \| stopped \| completed \| entered-in-error \| unknown
* statusReason: (QI) Reason for current status
* subject: (QI) Focus of message
* topic: (QI) Description of the purpose/content
* notDoneValueSet: (QI) Url of a value set of activities not requested or performed

**Primary code path:** reasonCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Communication](StructureDefinition-qicore-communication.html) ###
**QI Elements:**
* status: (QI) preparation \| in-progress \| on-hold \| stopped \| completed \| entered-in-error \| unknown
* subject: (QI) Focus of message
* topic: (QI) Description of the purpose/content
* sent: (QI) When sent
* received: (QI) When received
* recipient: (QI) Message recipient
* sender: (QI) Message sender

**Primary code path:** reasonCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore CommunicationRequest](StructureDefinition-qicore-communicationrequest.html) ###
**QI Elements:**
* status:  draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* category:  Message category
* doNotPerform:  True if request is prohibiting action
* subject:  Focus of message
* encounter:  Encounter created as part of
* recipient:  Message recipient
* sender:  Message sender

**Primary code path:** category
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Condition Encounter Diagnosis](StructureDefinition-qicore-condition-encounter-diagnosis.html) ###
**Must Have:**
* category: category codes
* category: encounter-diagnosis
* code: Identification of the condition, problem or diagnosis
* subject: (QI) Who has the condition?


**QI Elements:**
* encounter: (QI) Encounter created as part of
* onset[x]: (QI) Estimated or actual date, date-time, or age
* abatement[x]: (QI) When in resolution/remission

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Condition Problems Health Concerns](StructureDefinition-qicore-condition-problems-health-concerns.html) ###
**Must Have:**
* category: category codes
* category: problem-list-item \| health-concern
* code: (QI) Identification of the condition, problem or diagnosis
* subject: (QI) Who has the condition?


**QI Elements:**
* clinicalStatus: (QI) active \| recurrence \| relapse \| inactive \| remission \| resolved
* verificationStatus: (QI) unconfirmed \| provisional \| differential \| confirmed \| refuted \| entered-in-error
* severity: (QI) Subjective severity of condition
* onset[x]: (QI) Estimated or actual date, date-time, or age
* abatement[x]: (QI) When in resolution/remission
* recordedDate: (QI) Date record was first recorded

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Coverage](StructureDefinition-qicore-coverage.html) ###
**Must Have:**
* identifier.type: Member Number identifier type
* status: active \| cancelled \| draft \| entered-in-error
* beneficiary: (QI) Plan beneficiary
* relationship: Beneficiary relationship to the subscriber
* payor: (QI) Issuer of the policy
* class.value: Group Number
* class.value: Plan Number


**QI Elements:**
* type: (QI) Coverage category such as medical or accident
* policyHolder:  Owner of the policy
* subscriberId: (QI) ID assigned to the subscriber
* period: (QI) Coverage start and end dates

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Device Not Requested](StructureDefinition-qicore-devicenotrequested.html) ###
**QI Elements:**
* doNotPerformReason: (QI) Extension
* modifierExtension: (QI) Extension
* modifierExtension.value[x]: (QI) Value of extension
* status: (QI) draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code[x]: (QI) Device requested
* doNotPerformValueSet: (QI) What was not done
* subject: (QI) Focus of request
* authoredOn: (QI) When recorded

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Device](StructureDefinition-qicore-device.html) ###
**QI Elements:**
* patient: (QI) Patient to whom Device is affixed

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore DeviceRequest](StructureDefinition-qicore-devicerequest.html) ###
**QI Elements:**
* modifierExtension: (QI) Extension
* modifierExtension.value[x]: (QI) Value of extension
* identifier: (QI) External Request identifier
* status: (QI) draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code[x]: (QI) Device requested
* subject: (QI) Focus of request
* authoredOn: (QI) When recorded

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore DeviceUseStatement](StructureDefinition-qicore-deviceusestatement.html) ###
**QI Elements:**
* status: (QI) active \| completed \| entered-in-error +
* subject: (QI) Patient using device
* timing[x]: (QI) How often the device was used
* recordedOn: (QI) When statement was recorded
* device: (QI) Reference to device used
* bodySite: (QI) Target body site

**Primary code path:** device.type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore DiagnosticReport Profile for Laboratory Results Reporting](StructureDefinition-qicore-diagnosticreport-lab.html) ###
**Must Have:**
* status: registered \| partial \| preliminary \| final +
* category: (QI) Service category
* category: (QI) Service category
* code: US Core Laboratory Report Order Code
* subject: (QI) The subject of the report - usually, but not always, the patient


**QI Elements:**
* basedOn: What was requested
* effective[x]: (QI) Diagnostically relevant time (typically the time of specimen collection)
* performer: (QI) Responsible Diagnostic Service
* result: (QI) Observations

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-qicore-diagnosticreport-note.html) ###
**Must Have:**
* status: registered \| partial \| preliminary \| final +
* category: (QI) Service Category
* code: (QI) QI-Core Report Code
* subject: (QI) The subject of the report - usually, but not always, the patient
* media.link: Reference to the image source


**QI Elements:**
* encounter: (QI) Health care event when test ordered
* effective[x]: (QI) Diagnostically relevant time (typically the time of the procedure)
* issued: (QI) DateTime this version was made
* performer: (QI) Responsible Diagnostic Service
* result: (QI) Observations
* imagingStudy:  Reference to full details of imaging associated with the diagnostic report
* media: (QI) Key images associated with this report

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Encounter](StructureDefinition-qicore-encounter.html) ###
**Must Have:**
* identifier.system: The namespace for the identifier value
* identifier.value: The value that is unique
* status: (QI) planned \| arrived \| triaged \| in-progress \| onleave \| finished \| cancelled +
* class: Classification of patient encounter
* type: (QI) Specific type of encounter
* subject: (QI) The patient or group present at the encounter
* location.location: (QI) Location the encounter takes place


**QI Elements:**
* participant: (QI) List of participants involved in the encounter
* participant.individual: (QI) Persons involved in the encounter other than the patient
* period: (QI) The start and end time of the encounter
* reasonCode: (QI) Coded reason the encounter takes place
* reasonReference: (QI) Reason the encounter takes place (reference)
* hospitalization: (QI) Details about the admission to a healthcare service
* hospitalization.dischargeDisposition: (QI) Category or kind of location after discharge
* location: (QI) List of locations where the patient has been
* location.period: (QI) Time period during which the patient was present at the location
* serviceProvider: (QI) The organization (facility) responsible for this encounter

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore FamilyMemberHistory](StructureDefinition-qicore-familymemberhistory.html) ###
**QI Elements:**
* patient: (QI) Patient history is about
* date: (QI) When history was recorded or last updated
* relationship: (QI) Relationship to the subject
* age[x]: (QI) (approximate) age
* deceased[x]: (QI) Dead? How old/when?
* condition.code: (QI) Condition suffered by relation

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Flag](StructureDefinition-qicore-flag.html) ###
**QI Elements:**
* status: (QI) active \| inactive \| entered-in-error
* category: (QI) Clinical, administrative, etc.
* code: (QI) Coded or textual message to display to user
* subject: (QI) Who/What is flag about?
* period: (QI) Time period when flag is active

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Goal](StructureDefinition-qicore-goal.html) ###
**Must Have:**
* lifecycleStatus: proposed \| planned \| accepted \| active \| on-hold \| completed \| cancelled \| entered-in-error \| rejected
* description: Code or text describing goal
* subject: (QI) Who this goal is intended for


**QI Elements:**
* start[x]: (QI) When goal pursuit begins
* target: (QI) Target outcome for the goal

**Primary code path:** category
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore ImagingStudy](StructureDefinition-qicore-imagingstudy.html) ###
**QI Elements:**
* subject: (QI) Who or what is the subject of the study
* encounter: Encounter with which this imaging study is associated
* started: (QI) When the study was started
* basedOn: (QI) Request fulfilled
* procedureReference: (QI) The performed Procedure reference

**Primary code path:** procedure
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Immunization Not Done](StructureDefinition-qicore-immunizationnotdone.html) ###
**Must Have:**
* status: (QI) completed \| entered-in-error \| not-done
* statusReason: (QI) Reason not done
* vaccineCode: Vaccine Product Type (bind to CVX)
* patient: (QI) Who was immunized
* occurrence[x]: Vaccine administration date


**QI Elements:**
* notDoneValueSet: (QI) What wasn't administered
* recorded: (QI) When the immunization was first captured in the subject's record

**Primary code path:** vaccineCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Immunization](StructureDefinition-qicore-immunization.html) ###
**Must Have:**
* status: (QI) completed \| entered-in-error
* vaccineCode: (QI) Vaccine Product Type (bind to CVX)
* patient: (QI) Who was immunized
* occurrence[x]: (QI) Vaccine administration date


**QI Elements:**
* statusReason: (QI) Reason not done
* recorded: (QI) When the immunization was first captured in the subject's record

**Primary code path:** vaccineCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore ImmunizationEvaluation](StructureDefinition-qicore-immunizationevaluation.html) ###
**QI Elements:**
* identifier: (QI) Business identifier
* status: (QI) completed \| entered-in-error
* patient: (QI) Who this evaluation is for
* date: (QI) Date evaluation was performed
* targetDisease: (QI) Evaluation target disease
* immunizationEvent: (QI) Immunization being evaluated
* doseStatus: (QI) Status of the dose relative to published recommendations
* doseStatusReason: (QI) Reason for the dose status

**Primary code path:** targetDisease
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore ImmunizationRecommendation](StructureDefinition-qicore-immunizationrecommendation.html) ###
**QI Elements:**
* patient: (QI) Who this profile is for
* recommendation: (QI) Vaccine administration recommendations
* recommendation.vaccineCode: (QI) Vaccine or vaccine group recommendation applies to
* recommendation.doseNumber[x]: (QI) Recommended dose number within series

**Primary code path:** recommendation.vaccineCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html) ###
**Must Have:**
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category: (QI) Classification of type of observation
* category: (QI) Classification of type of observation
* code: (QI) Laboratory Test Name
* subject: (QI) Who and/or what the observation is about


**QI Elements:**
* effective[x]: (QI) Clinically relevant time/time-period for observation
* issued: (QI) Date/Time this version was made available
* value[x]: (QI) Result Value
* interpretation: (QI) High, low, normal, etc.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Location](StructureDefinition-qicore-location.html) ###
**Must Have:**
* name: Name by which a facility or location is known.


**QI Elements:**
* type: (QI) Category of service or resource available in a location.
* telecom: (QI) Contact details of the location
* managingOrganization: (QI) Organization responsible for provisioning and upkeep

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Medication Not Requested](StructureDefinition-qicore-medicationnotrequested.html) ###
**Must Have:**
* status: (QI) active \| on-hold \| cancelled \| completed \| entered-in-error \| stopped \| draft \| unknown
* intent: (QI) proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* medication[x]: (QI) Medication to be taken
* subject: (QI) Who or group medication request is for
* authoredOn: (QI) When request was initially authored


**QI Elements:**
* doNotPerform: (QI) True if medication was not requested
* reported[x]: (QI) Reported rather than primary record
* encounter: (QI) Encounter created as part of encounter/admission/stay
* requester: (QI) Who/What requested the Request
* reasonCode: (QI) Reason or indication for ordering or not ordering the medication
* reasonReference: (QI) US Core Condition or Observation that supports the prescription

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Medication](StructureDefinition-qicore-medication.html) ###
**Must Have:**
* code: Codes that identify this medication

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore MedicationAdministration Not Done](StructureDefinition-qicore-medicationadministrationnotdone.html) ###
**QI Elements:**
* implicitRules: (QI) A set of rules under which this content was created
* recorded: (QI) Extension
* status: (QI) in-progress \| not-done \| on-hold \| completed \| entered-in-error \| stopped \| unknown
* statusReason: (QI) Reason administration not performed
* medication[x]: (QI) What was administered
* notDoneValueSet: (QI) Url of a value set of activities not requested or performed
* subject: (QI) Who received medication
* context: (QI) Encounter or Episode of Care administered as part of
* effective[x]: (QI) Start and end time of administration
* request: (QI) Request administration performed against

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore MedicationAdministration](StructureDefinition-qicore-medicationadministration.html) ###
**QI Elements:**
* status: (QI) in-progress \| on-hold \| completed \| entered-in-error \| stopped \| unknown
* medication[x]: (QI) What was administered
* subject: (QI) Who received medication
* context: (QI) Encounter or Episode of Care administered as part of
* effective[x]: (QI) Start and end time of administration
* request: (QI) Request administration performed against
* dosage: (QI) Details of how medication was taken
* dosage.route: (QI) Path of substance into body
* dosage.dose: (QI) Amount of medication per dose

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore MedicationDispense Declined](StructureDefinition-qicore-medicationdispensedeclined.html) ###
**Must Have:**
* status: (QI) preparation \| in-progress \| cancelled \| on-hold \| completed \| entered-in-error \| stopped \| declined \| unknown
* medication[x]: (QI) What medication was supplied
* subject: (QI) Who the dispense is for
* performer.actor: Individual who was performing


**QI Elements:**
* recorded: (QI) Extension
* statusReason[x]: (QI) Why a dispense was not performed
* notDoneValueSet: (QI) Url of a value set of activities not requested or performed
* dosageInstruction.text: (QI) Free text dosage instructions e.g. SIG
* dosageInstruction.timing: (QI) When medication should be administered
* dosageInstruction.doseAndRate: (QI) Amount of medication administered
* dosageInstruction.doseAndRate.type: (QI) The kind of dose or rate specified
* dosageInstruction.doseAndRate.dose[x]: (QI) Amount of medication per dose

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore MedicationDispense](StructureDefinition-qicore-medicationdispense.html) ###
**Must Have:**
* status: (QI) preparation​ \| in-progress​ \| cancelled​ \| on-hold​ \| completed​ \| entered-in-error​ \| stopped​ \| unknown
* medication[x]: (QI) What medication was supplied
* subject: (QI) Who the dispense is for
* performer.actor: Individual who was performing


**QI Elements:**
* authorizingPrescription: (QI) Medication order that authorizes the dispense
* type: (QI) Trial fill, partial fill, emergency fill, etc.
* quantity: (QI) Amount dispensed
* daysSupply: (QI) Amount of medication expressed as a timing amount
* whenPrepared: (QI) When product was packaged and reviewed
* whenHandedOver: (QI) When product was given out or mailed
* dosageInstruction: (QI) How the medication is to be used by the patient or administered by the caregiver
* dosageInstruction.text: (QI) Free text dosage instructions e.g. SIG
* dosageInstruction.timing: (QI) When medication should be administered
* dosageInstruction.doseAndRate: (QI) Amount of medication administered
* dosageInstruction.doseAndRate.dose[x]: (QI) Amount of medication per dose

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore MedicationRequest](StructureDefinition-qicore-medicationrequest.html) ###
**Must Have:**
* status: (QI) active \| on-hold \| cancelled \| completed \| entered-in-error \| stopped \| draft \| unknown
* intent: (QI) proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* medication[x]: (QI) Medication to be taken
* subject: (QI) Who or group medication request is for


**QI Elements:**
* doNotPerform: (QI) True if medication was not requested
* reported[x]: (QI) Reported rather than primary record
* encounter: (QI) Encounter created as part of encounter/admission/stay
* authoredOn: (QI) When request was initially authored
* requester: (QI) Who/What requested the Request
* reasonCode: (QI) Reason or indication for ordering or not ordering the medication
* reasonReference: (QI) QI-Core Condition or Observation that supports the prescription
* dosageInstruction: (QI) How medication should be taken
* dosageInstruction.timing: (QI) When medication should be administered
* dosageInstruction.timing.repeat: (QI) When the event is to occur
* dosageInstruction.timing.repeat.bounds[x]: (QI) Length/Range of lengths, or (Start and/or end) limits
* dosageInstruction.timing.repeat.frequency: (QI) Event occurs frequency times per period
* dosageInstruction.timing.repeat.frequencyMax: (QI) Event occurs frequencyMax times per period
* dosageInstruction.timing.repeat.period: (QI) Event occurs frequency times per period
* dosageInstruction.timing.repeat.periodMax: (QI) Upper limit of period (3-4 hours)
* dosageInstruction.timing.repeat.periodUnit: (QI) s \| min \| h \| d \| wk \| mo \| a - unit of time (UCUM)
* dosageInstruction.asNeeded[x]: (QI) Take "as needed" (for x)
* dosageInstruction.doseAndRate: (QI) Amount of medication administered
* dosageInstruction.doseAndRate.dose[x]: (QI) Amount of medication per dose
* dispenseRequest: (QI) Medication supply authorization
* dispenseRequest.dispenseInterval: (QI) Minimum period of time between dispenses
* dispenseRequest.validityPeriod: (QI) Time period supply is authorized for
* dispenseRequest.numberOfRepeatsAllowed: (QI) Number of refills authorized
* dispenseRequest.quantity: (QI) Amount of medication to supply per dispense
* dispenseRequest.expectedSupplyDuration: (QI) Number of days supply per dispense

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore MedicationStatement](StructureDefinition-qicore-medicationstatement.html) ###
**QI Elements:**
* status: (QI) active \| completed \| entered-in-error \| intended \| stopped \| on-hold \| unknown \| not-taken
* medication[x]: (QI) What medication was taken
* subject: (QI) Who is/was taking the medication
* effective[x]: (QI) The date/time or interval when the medication is/was/will be taken
* dateAsserted: (QI) When the statement was asserted?
* informationSource: (QI) Person or organization that provided the information about the taking of this medication
* derivedFrom: (QI) Additional supporting information
* dosage.timing: (QI) When medication should be administered
* dosage.route: (QI) How drug should enter body
* dosage.doseAndRate: (QI) Amount of medication administered
* dosage.doseAndRate.dose[x]: (QI) Amount of medication per dose

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore NonPatient Observation](StructureDefinition-qicore-nonpatient-observation.html) ###
**QI Elements:**
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category: (QI) Classification of type of observation
* code: (QI) Type of observation (code / type)
* subject: (QI) The device/location/implantable device the observation is about
* effective[x]: (QI) Clinically relevant time/time-period for observation
* performer: (QI) Who is responsible for the observation
* value[x]: (QI) Actual result
* value[x]: (QI) actual \| potential
* interpretation: (QI) High, low, normal, etc.
* derivedFrom: (QI) QI Core Profiles or other resource the observation is made from

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore NutritionOrder](StructureDefinition-qicore-nutritionorder.html) ###
**QI Elements:**
* patient: (QI) The person who requires the diet, formula or nutritional supplement



<br>
<br>

### [QICore Observation Cancelled](StructureDefinition-qicore-observationcancelled.html) ###
**QI Elements:**
* notDoneReason: (QI) Extension
* status: (QI) registered \| preliminary \| final \| amended +
* category: (QI) Classification of type of observation
* code: (QI) Type of observation (code / type)
* notDoneValueSet: (QI) What was not done
* subject: (QI) Who and/or what the observation is about
* effective[x]: (QI) Clinically relevant time/time-period for observation
* issued: (QI) Date/Time this version was made available
* value[x]: (QI) Actual result
* value[x]: (QI) Actual result
* interpretation: (QI) High, low, normal, etc.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Observation Clinical Result](StructureDefinition-qicore-observation-clinical-result.html) ###
**Must Have:**
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category: (QI) Classification of type of observation
* code: (QI) Clinical Test or Procedure Name
* subject: (QI) Who and/or what the observation is about


**QI Elements:**
* category: (QI) Classification of type of observation
* effective[x]: (QI) Clinically relevant time/time-period for observation
* value[x]: (QI) Result Value
* dataAbsentReason: (QI) Why the result is missing

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Observation Screening Assessment](StructureDefinition-qicore-observation-screening-assessment.html) ###
**Must Have:**
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category: (QI) Classification of type of observation
* category: (QI) Classification of type of observation
* code: (QI) Type of observation (code / type)
* subject: (QI) Who and/or what the observation is about


**QI Elements:**
* category: (QI) Classification of type of observation
* effective[x]: (QI) Clinically relevant time/time-period for observation
* performer: (QI) Who is responsible for the observation
* value[x]: (QI) Actual result
* dataAbsentReason: (QI) Why the result is missing
* interpretation: (QI) High, low, normal, etc.
* hasMember: (QI) Reference to panel or multi-select responses
* derivedFrom: (QI) Related Observations or QuestionnaireResponses that the observation is made from

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Organization](StructureDefinition-qicore-organization.html) ###
**Must Have:**
* active: Whether the organization's record is still in active use
* name: Name used for the organization


**QI Elements:**
* identifier: (QI) CMS Certification Number
* identifier.use: (QI) usual \| official \| temp \| secondary \| old (If known)
* identifier.value: (QI) The value that is unique
* identifier: (QI) Employer Identification Number
* identifier.use: (QI) usual \| official \| temp \| secondary \| old (If known)
* identifier.value: (QI) The value that is unique

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



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
* race: (QI) US Core Race Extension
* ethnicity: (QI) US Core ethnicity Extension
* tribalAffiliation: (QI) Tribal Affiliation Extension
* sex: (QI) Sex Extension
* genderIdentity: (QI) The individual's gender identity
* name.use: (QI) usual \| official \| temp \| nickname \| anonymous \| old \| maiden
* name.suffix: (QI) Parts that come after the name
* name.period: (QI) Time period when name was/is in use
* telecom: (QI) A contact detail for the individual
* birthDate: (QI) The date of birth for the individual
* deceased[x]: (QI) Indicates if the individual is deceased or not
* address: (QI) An address for the individual
* address.use: (QI) home \| work \| temp \| old \| billing - purpose of this address
* address.period: (QI) Time period when address was/is in use
* communication: (QI) A language which may be used to communicate with the patient about his or her health



<br>
<br>

### [QICore Practitioner](StructureDefinition-qicore-practitioner.html) ###
**Must Have:**
* identifier: (QI) An identifier for the person as this agent
* identifier.system: (QI) The namespace for the identifier value
* identifier.value: (QI) The value that is unique
* name: The name(s) associated with the practitioner
* name.family: Family name (often called 'Surname')


**QI Elements:**
* identifier: (QI) An identifier for the person as this agent
* identifier: (QI) There is not a general Tax Identifier Numer (TIN) OID. There is an SSN, a PTIN, and an ITIN, but no TIN generally. So the only slice specified here is EIN, if consumers determine a need for an SSN, submit a comment to that effect.
* identifier.use: (QI) usual \| official \| temp \| secondary \| old (If known)
* identifier.value: (QI) The value that is unique



<br>
<br>

### [QICore PractitionerRole](StructureDefinition-qicore-practitionerrole.html) ###
**Must Have:**
* telecom.system: (QI) phone \| fax \| email \| pager \| url \| sms \| other
* telecom.value: (QI) The actual contact point details


**QI Elements:**
* identifier: (QI) Business Identifiers that are specific to a role/location
* identifier.use: (QI) usual \| official \| temp \| secondary \| old (If known)
* identifier.system: (QI) The namespace for the identifier value
* identifier.value: (QI) The value that is unique
* active: (QI) Whether this practitioner role record is in active use
* period: (QI) The period during which the practitioner is authorized to perform in these role(s)
* practitioner: (QI) Practitioner that is able to provide the defined services for the organization
* organization: (QI) Organization where the roles are available
* code: (QI) Roles which this practitioner may perform
* specialty: (QI) Specific specialty of the practitioner
* location: (QI) The location(s) at which this practitioner provides care
* telecom: (QI) Contact details that are specific to the role/location/service
* endpoint: (QI) Technical endpoints providing access to services operated for the practitioner with this role

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Procedure Not Done](StructureDefinition-qicore-procedurenotdone.html) ###
**Must Have:**
* status: (QI) preparation \| in-progress \| not-done \| on-hold \| stopped \| completed \| entered-in-error \| unknown
* code: (QI) Identification of the procedure
* subject: (QI) Who the procedure was performed on


**QI Elements:**
* recorded: (QI) When the procedure was first captured in the subject's record
* basedOn: (QI) A request for this procedure
* statusReason: (QI) Reason for the current status
* notDoneValueSet: (QI) What was not performed
* performed[x]: (QI) When the procedure was performed

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Procedure](StructureDefinition-qicore-procedure.html) ###
**Must Have:**
* status: (QI) preparation \| in-progress \| ​on-hold​ \| stopped​ \| completed \| entered-in-error​ \| unknown​
* code: (QI) Identification of the procedure
* subject: (QI) Who the procedure was performed on


**QI Elements:**
* implicitRules: (QI) A set of rules under which this content was created
* recorded: (QI) When the procedure was first captured in the subject's record
* basedOn: (QI) A request for this procedure
* performed[x]: (QI) When the procedure was performed
* reasonCode: (QI) Coded reason procedure performed
* reasonReference: (QI) The justification that the procedure was performed

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore QuestionnaireResponse](StructureDefinition-qicore-questionnaireresponse.html) ###
**Must Have:**
* questionnaire: Form being answered
* status: in-progress \| completed \| amended \| entered-in-error \| stopped
* subject: (QI) The subject of the questions
* authored: Date the answers were gathered
* item.linkId: (QI) Pointer to specific item from Questionnaire


**QI Elements:**
* author: (QI) Person who received and recorded the answers
* item: (QI) Groups and questions
* item.answer.value[x]: (QI) Single-valued answer to the question



<br>
<br>

### [QICore RelatedPerson](StructureDefinition-qicore-relatedperson.html) ###
**Must Have:**
* active: (QI) Whether this related person's record is in active use
* patient: (QI) The patient this person is related to


**QI Elements:**
* relationship: (QI) The nature of the relationship
* name: (QI) A name associated with the person

**Primary code path:** relationship
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Service Not Requested](StructureDefinition-qicore-servicenotrequested.html) ###
**Must Have:**
* status: (QI) draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code: What is being requested/ordered
* subject: (QI) Individual or Entity the service is ordered for
* authoredOn: (QI) Date request signed


**QI Elements:**
* reasonRefused: (QI) Extension
* doNotPerform: (QI) True if service/procedure should not be performed
* notDoneValueSet: (QI) What was not requested
* occurrence[x]: (QI) When service should occur
* reasonCode: (QI) Explanation/Justification for procedure or service
* reasonReference: (QI) Explanation/Justification for service or service

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore ServiceRequest](StructureDefinition-qicore-servicerequest.html) ###
**Must Have:**
* status: (QI) draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code: (QI) What is being requested/ordered
* subject: (QI) Individual or Entity the service is ordered for


**QI Elements:**
* doNotPerform: (QI) True if service/procedure should not be performed
* occurrence[x]: (QI) When service should occur
* authoredOn: (QI) Date request signed
* reasonCode: (QI) Explanation/Justification for procedure or service
* reasonReference: (QI) Explanation/Justification for service or service

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Simple Observation](StructureDefinition-qicore-simple-observation.html) ###
**Must Have:**
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| entered-in-error \| unknown
* category: (QI) Classification of type of observation
* code: (QI) Type of observation (code / type)
* subject: (QI) Who and/or what the observation is about


**QI Elements:**
* partOf: (QI) Part of referenced event
* effective[x]: (QI) Clinically relevant time/time-period for observation
* performer: (QI) Who is responsible for the observation
* value[x]: (QI) Actual result
* value[x]: (QI) actual \| potential
* interpretation: (QI) High, low, normal, etc.
* derivedFrom: (QI) US Core Profiles or other resource the observation is made from

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Substance](StructureDefinition-qicore-substance.html) ###
**QI Elements:**
* code: (QI) If this describes a specific package/container of the substance
* instance.quantity: (QI) Amount of substance in the package
* ingredient.quantity: (QI) Optional amount (concentration)
* ingredient.substance[x]: (QI) A component of the substance

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Task Rejected](StructureDefinition-qicore-taskrejected.html) ###
**QI Elements:**
* executionPeriod: (QI) The timing the task was rejected and the reason.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

### [QICore Task](StructureDefinition-qicore-task.html) ###
**QI Elements:**
* identifier:  Task Instance Identifier
* basedOn: (QI) Request fulfilled by this task
* status:  draft​ \| requested​ \| received​ \| accepted​ \| ready​ \| cancelled​ \| in-progress​ \| on-hold​ \| failed​ \| completed \| entered-in-error
* intent:  unknown \| proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance
* priority:  routine \| urgent \| asap \| stat
* code:  Task Type
* executionPeriod: (QI) Start and end time of execution

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#filtering-with-terminology)
<br>



<br>
<br>

