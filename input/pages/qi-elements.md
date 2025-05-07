
"Must Have", "QI Elements" and "primary code path" are defined in the [QI-Core Must Support section](index.html#mustsupport-flag).

### [QICore AdverseEvent](StructureDefinition-qicore-adverseevent.html) ###


**QI Elements:**
* category: (QI) product-problem \| product-quality \| product-use-error \| wrong-dose \| incorrect-prescribing-information \| wrong-technique \| wrong-route-of-administration \| wrong-rate \| wrong-duration \| wrong-time \| expired-drug \| medical-device-use-error \| problem-different-manufacturer \| unsafe-physical-environment
* severity: (QI) mild \| moderate \| severe
* resultingCondition: (QI) Effect on the subject due to this event
* event: (QI) Type of the event itself in relation to the subject
* encounter: (QI) Encounter created as part of
* date: (QI) When the event occurred
* seriousness: (QI) Seriousness of the event
* recordedDate: (QI) When the event was recorded
* subject: (QI) Subject impacted by event
* actuality: (QI) actual \| potential

**Primary code path:** event
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore AllergyIntolerance](StructureDefinition-qicore-allergyintolerance.html) ###


**Must Have:**
* patient: (QI) Who the sensitivity is for
* code: (QI) Code that identifies the allergy or intolerance


**QI Elements:**
* verificationStatus: (QI) unconfirmed \| confirmed \| refuted \| entered-in-error
* onset[x]: (QI) When allergy or intolerance was identified
* clinicalStatus: (QI) active \| inactive \| resolved
* criticality: (QI) low \| high \| unable-to-assess
* recordedDate: (QI) Date first version of the resource instance was recorded
* type: (QI) allergy \| intolerance - Underlying mechanism (if known)
* category: (QI) food \| medication \| environment \| biologic
* lastOccurrence: (QI) Date(/time) of last known occurrence of a reaction
* reaction: (QI) Adverse Reaction Events linked to exposure to substance

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore BodyStructure](StructureDefinition-qicore-bodystructure.html) ###


**QI Elements:**
* active: (QI) Whether this record is in active use
* patient: (QI) Who this is about
* locationQualifier: (QI) Body site modifier
* location: (QI) Body site

**Primary code path:** location
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore CarePlan](StructureDefinition-qicore-careplan.html) ###


**Must Have:**
* subject: (QI) Who the care plan is for.
* status: draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* category(AssessPlan): (QI) Type of plan
* intent: proposal \| plan \| order \| option
* category: (QI) Type of plan

**Primary code path:** category
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore CareTeam](StructureDefinition-qicore-careteam.html) ###


**Must Have:**
* participant: Members of the team
* subject: (QI) Who the care team is for.

**Primary code path:** participant.role
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Claim](StructureDefinition-qicore-claim.html) ###


**QI Elements:**
* provider: (QI) Party responsible for the claim
* patient: (QI) The recipient of the products and services
* type: (QI) category \| discipline
* billablePeriod: (QI) Relevant time frame for the claim
* Claim: Claim, Pre-determination or Pre-authorization
* use: (QI) claim \| preauthorization \| predetermination
* diagnosis: (QI) Pertinent diagnosis information
* procedure: (QI) Clinical procedures performed
* created: (QI) Resource creation date
* prescription: (QI) Prescription authorizing services and products
* status: (QI) active

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore ClaimResponse](StructureDefinition-qicore-claimresponse.html) ###


**QI Elements:**
* request: (QI) Id of resource triggering adjudication
* requestor: (QI) Party responsible for the claim
* patient: (QI) The recipient of the products and services
* created: (QI) Response creation date
* status: (QI) active \| cancelled \| draft \| entered-in-error
* use: (QI) claim \| preauthorization \| predetermination
* item: (QI) Adjudication for claim line items
* type: (QI) More granular claim type
* insurer: (QI) Party responsible for reimbursement

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Communication Not Done](StructureDefinition-qicore-communicationnotdone.html) ###


**QI Elements:**
* extension(event-recorded): (QI) Captures the recorded date of the communication
* topic.extension(codeOptions): (QI) Url of a value set of candidate topics
* statusReason: (QI) Reason for current status
* sender: (QI) Message sender
* sent: (QI) When sent
* topic: (QI) Description of the purpose/content
* subject: (QI) Focus of message
* received: (QI) When received
* status: (QI) not-done
* recipient: (QI) Message recipient

**Primary code path:** topic
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Communication](StructureDefinition-qicore-communication.html) ###


**QI Elements:**
* topic.extension(codeOptions): (QI) Url of a value set of candidate topics
* sender: (QI) Message sender
* sent: (QI) When sent
* topic: (QI) Description of the purpose/content
* subject: (QI) Focus of message
* received: (QI) When received
* status: (QI) preparation \| in-progress \| not-done \| on-hold \| stopped \| completed \| entered-in-error \| unknown
* recipient: (QI) Message recipient

**Primary code path:** topic
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore CommunicationDone](StructureDefinition-qicore-communicationdone.html) ###


**QI Elements:**
* topic.extension(codeOptions): (QI) Url of a value set of candidate topics
* status: (QI) preparation \| in-progress \| on-hold \| stopped \| completed
* sender: (QI) Message sender
* sent: (QI) When sent
* topic: (QI) Description of the purpose/content
* subject: (QI) Focus of message
* received: (QI) When received
* recipient: (QI) Message recipient

**Primary code path:** topic
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore CommunicationRequest](StructureDefinition-qicore-communicationrequest.html) ###


**QI Elements:**
* status: (QI) draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* encounter: (QI) Encounter created as part of
* category: (QI) Message category
* sender: (QI) Message sender
* subject: (QI) Focus of message
* doNotPerform: (QI) True if request is prohibiting action
* recipient: (QI) Message recipient

**Primary code path:** category
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Condition Encounter Diagnosis](StructureDefinition-qicore-condition-encounter-diagnosis.html) ###


**Must Have:**
* category: (QI) category codes
* category(us-core): encounter-diagnosis
* code: (QI) Identification of the condition, problem or diagnosis
* subject: (QI) Who has the condition?


**QI Elements:**
* clinicalStatus: (QI) active \| recurrence \| relapse \| inactive \| remission \| resolved
* extension(assertedDate): (QI) Date the condition was first asserted
* encounter: (QI) Encounter created as part of
* recordedDate: (QI) Date record was first recorded
* abatement[x]: (QI) When in resolution/remission
* severity: (QI) Subjective severity of condition
* onset[x]: (QI) Estimated or actual date, date-time, or age
* verificationStatus: (QI) unconfirmed \| provisional \| differential \| confirmed \| refuted \| entered-in-error

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Condition Problems Health Concerns](StructureDefinition-qicore-condition-problems-health-concerns.html) ###


**Must Have:**
* category: (QI) category codes
* code: (QI) Identification of the condition, problem or diagnosis
* category(us-core): problem-list-item \| health-concern
* subject: (QI) Who has the condition?


**QI Elements:**
* clinicalStatus: (QI) active \| recurrence \| relapse \| inactive \| remission \| resolved
* extension(assertedDate): (QI) Date the condition was first asserted
* recordedDate: (QI) Date record was first recorded
* abatement[x]: (QI) When in resolution/remission
* severity: (QI) Subjective severity of condition
* onset[x]: (QI) Estimated or actual date, date-time, or age
* verificationStatus: (QI) unconfirmed \| provisional \| differential \| confirmed \| refuted \| entered-in-error

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Coverage](StructureDefinition-qicore-coverage.html) ###


**Must Have:**
* payor: (QI) Issuer of the policy
* class.value: Group Number
* identifier.type: Member Number identifier type
* class.value: Plan Number
* beneficiary: (QI) Plan beneficiary
* status: active \| cancelled \| draft \| entered-in-error
* relationship: Beneficiary relationship to the subscriber


**QI Elements:**
* subscriberId: (QI) ID assigned to the subscriber
* policyHolder: (QI) Owner of the policy
* period: (QI) Coverage start and end dates
* type: (QI) Coverage category such as medical or accident

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Device Prohibited](StructureDefinition-qicore-deviceprohibited.html) ###


**QI Elements:**
* status: (QI) draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* modifierExtension(doNotPerform): (QI) Extension
* authoredOn: (QI) When recorded
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code[x]: (QI) Device requested
* code[x].extension(codeOptions): (QI) Url of a value set of candidate devices
* reasonCode: (QI) Explanation/Justification for procedure or service
* subject: (QI) Focus of request
* modifierExtension.value[x]: (QI) Value of extension
* identifier: (QI) External Request identifier

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Device](StructureDefinition-qicore-device.html) ###


**QI Elements:**
* patient: (QI) Patient to whom Device is affixed

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore DeviceRequest](StructureDefinition-qicore-devicerequest.html) ###


**QI Elements:**
* status: (QI) draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* modifierExtension(doNotPerform): (QI) Extension
* authoredOn: (QI) When recorded
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code[x]: (QI) Device requested
* code[x].extension(codeOptions): (QI) Url of a value set of candidate devices
* subject: (QI) Focus of request
* identifier: (QI) External Request identifier

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore DeviceRequested](StructureDefinition-qicore-devicerequested.html) ###


**QI Elements:**
* status: (QI) draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown
* modifierExtension(doNotPerform): (QI) Extension
* authoredOn: (QI) When recorded
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code[x]: (QI) Device requested
* code[x].extension(codeOptions): (QI) Url of a value set of candidate devices
* subject: (QI) Focus of request
* modifierExtension.value[x]: (QI) Value of extension
* identifier: (QI) External Request identifier

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore DeviceUseStatement](StructureDefinition-qicore-deviceusestatement.html) ###


**QI Elements:**
* subject: (QI) Patient using device
* bodySite: (QI) Target body site
* status: (QI) active \| completed \| entered-in-error +
* recordedOn: (QI) When statement was recorded
* device: (QI) Reference to device used
* timing[x]: (QI) How often the device was used

**Primary code path:** device.type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-qicore-diagnosticreport-note.html) ###


**Must Have:**
* subject: (QI) The subject of the report - usually, but not always, the patient
* status: (QI)registered \| partial \| preliminary \| final +
* category: (QI) Service Category
* code: (QI) QI-Core Report Code


**QI Elements:**
* effective[x]: (QI) Diagnostically relevant time (typically the time of the procedure)
* result: (QI) Observations
* imagingStudy: (QI) Reference to full details of imaging associated with the diagnostic report
* issued: (QI) DateTime this version was made
* media: (QI) Key images associated with this report
* encounter: (QI) Health care event when test ordered
* performer: (QI) Responsible Diagnostic Service

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Encounter](StructureDefinition-qicore-encounter.html) ###


**Must Have:**
* status: (QI) planned \| arrived \| triaged \| in-progress \| onleave \| finished \| cancelled +
* subject: (QI) The patient or group present at the encounter
* class: (QI) Classification of patient encounter
* type: (QI) Specific type of encounter


**QI Elements:**
* serviceProvider: (QI) The organization (facility) responsible for this encounter
* participant: (QI) List of participants involved in the encounter
* hospitalization: (QI) Details about the admission to a healthcare service
* reasonCode: (QI) Coded reason the encounter takes place
* period: (QI) The start and end time of the encounter
* reasonReference: (QI) Reason the encounter takes place (reference)
* location: (QI) List of locations where the patient has been

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore FamilyMemberHistory](StructureDefinition-qicore-familymemberhistory.html) ###


**QI Elements:**
* relationship: (QI) Relationship to the subject
* deceased[x]: (QI) Dead? How old/when?
* age[x]: (QI) (approximate) age
* patient: (QI) Patient history is about
* date: (QI) When history was recorded or last updated

**Primary code path:** FamilyMemberHistory.condition.code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Flag](StructureDefinition-qicore-flag.html) ###


**QI Elements:**
* status: (QI) active \| inactive \| entered-in-error
* code: (QI) Coded or textual message to display to user
* subject: (QI) Who/What is flag about?
* period: (QI) Time period when flag is active
* category: (QI) Clinical, administrative, etc.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Goal](StructureDefinition-qicore-goal.html) ###


**Must Have:**
* lifecycleStatus: proposed \| planned \| accepted \| active \| on-hold \| completed \| cancelled \| entered-in-error \| rejected
* subject: (QI) Who this goal is intended for
* description: Code or text describing goal


**QI Elements:**
* start[x]: (QI) When goal pursuit begins
* target: (QI) Target outcome for the goal

**Primary code path:** category
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore ImagingStudy](StructureDefinition-qicore-imagingstudy.html) ###


**QI Elements:**
* procedureReference: (QI) The performed Procedure reference
* subject: (QI) Who or what is the subject of the study
* basedOn: (QI) Request fulfilled
* started: (QI) When the study was started
* encounter: Encounter with which this imaging study is associated

**Primary code path:** procedureCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Immunization Done](StructureDefinition-qicore-immunizationdone.html) ###


**Must Have:**
* occurrence[x]: (QI) Vaccine administration date
* status: (QI) completed
* patient: (QI) Who was immunized
* vaccineCode: (QI) Vaccine Product Type (bind to CVX)


**QI Elements:**
* statusReason: (QI) Reason for status
* recorded: (QI) When the immunization was first captured in the subject's record
* vaccineCode.extension(codeOptions): (QI) Url of a value set of candidate vaccines

**Primary code path:** vaccineCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Immunization Not Done](StructureDefinition-qicore-immunizationnotdone.html) ###


**Must Have:**
* statusReason: (QI) Reason not done
* occurrence[x]: (QI) Vaccine administration date
* patient: (QI) Who was immunized
* status: (QI) not-done
* vaccineCode: (QI) Vaccine Product Type (bind to CVX)


**QI Elements:**
* recorded: (QI) Documented date Immunization did not occur.
* vaccineCode.extension(codeOptions): (QI) Url of a value set of candidate vaccines

**Primary code path:** vaccineCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Immunization](StructureDefinition-qicore-immunization.html) ###


**Must Have:**
* status: (QI) completed \| not-done \| entered-in-error
* occurrence[x]: (QI) Vaccine administration date
* patient: (QI) Who was immunized
* vaccineCode: (QI) Vaccine Product Type (bind to CVX)


**QI Elements:**
* statusReason: (QI) Reason for status
* recorded: (QI) When the immunization was first captured in the subject's record
* vaccineCode.extension(codeOptions): (QI) Url of a value set of candidate vaccines

**Primary code path:** vaccineCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore ImmunizationEvaluation](StructureDefinition-qicore-immunizationevaluation.html) ###


**QI Elements:**
* targetDisease: (QI) Evaluation target disease
* date: (QI) Date evaluation was performed
* immunizationEvent: (QI) Immunization being evaluated
* doseStatusReason: (QI) Reason for the dose status
* identifier: (QI) Business identifier
* status: (QI) completed \| entered-in-error
* patient: (QI) Who this evaluation is for
* doseStatus: (QI) Status of the dose relative to published recommendations

**Primary code path:** targetDisease
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore ImmunizationRecommendation](StructureDefinition-qicore-immunizationrecommendation.html) ###


**QI Elements:**
* patient: (QI) Who this profile is for
* recommendation: (QI) Vaccine administration recommendations

**Primary code path:** recommendation.vaccineCode
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html) ###


**Must Have:**
* subject: (QI) Who and/or what the observation is about
* code: (QI) Laboratory Test Name
* category: (QI) Classification of type of observation
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| cancelled \| entered-in-error \| unknown
* category(us-core): (QI) Classification of type of observation


**QI Elements:**
* encounter: (QI) Encounter associated with Observation
* value[x]: (QI) Result Value
* issued: (QI) Date/Time this version was made available
* referenceRange: (QI) Result reference range
* effective[x]: (QI) Clinically relevant time/time-period for observation
* interpretation: (QI) High, low, normal, etc.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Location](StructureDefinition-qicore-location.html) ###


**Must Have:**
* name: Name by which a facility or location is known.


**QI Elements:**
* status: (QI) active \| suspended \| inactive
* telecom: (QI) Contact details of the location
* managingOrganization: (QI) Organization responsible for provisioning and upkeep
* type: (QI) Category of service or resource available in a location.

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>


### [QICore Medication Prohibited](StructureDefinition-qicore-medicationprohibited.html) ###


**Must Have:**
* subject: (QI) Who or group medication request is for
* authoredOn: (QI) When request was initially authored
* status: (QI) active \| on-hold \| cancelled \| completed \| stopped \| draft
* intent: (QI) proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* medication[x]: (QI) Medication to be taken


**QI Elements:**
* doNotPerform: (QI) True if medication was not requested
* requester: (QI) Who/What requested the Request
* extension(medicationAdherence): (QI) Reported adherence to prescribed medication instructions.
* reasonCode: (QI) Reason or indication for not ordering the medication
* encounter: (QI) Encounter created as part of encounter/admission/stay
* dispenseRequest: (QI) Medication supply authorization
* reasonReference: (QI) QI-Core Condition or Observation that supports the prescription
* dosageInstruction: (QI) How medication should be taken
* reported[x]: (QI) Reported rather than primary record

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Medication](StructureDefinition-qicore-medication.html) ###


**Must Have:**
* code: Codes that identify this medication

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationAdministration Done](StructureDefinition-qicore-medicationadministrationdone.html) ###


**QI Elements:**
* medication[x]: (QI) What was administered
* dosage: (QI) Details of how medication was taken
* medication[x].extension(codeOptions): (QI) Url of a value set of candidate medications
* status: (QI) in-progress \| on-hold \| completed \| stopped
* subject: (QI) Who received medication
* request: (QI) Request administration performed against
* effective[x]: (QI) Start and end time of administration
* context: (QI) Encounter or Episode of Care administered as part of

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationAdministration Not Done](StructureDefinition-qicore-medicationadministrationnotdone.html) ###


**QI Elements:**
* medication[x]: (QI) What was administered
* dosage: (QI) Details of how medication was taken
* statusReason: (QI) Reason administration not performed
* medication[x].extension(codeOptions): (QI) Url of a value set of candidate medications
* subject: (QI) Who received medication
* request: (QI) Request administration performed against
* effective[x]: (QI) Start and end time of administration
* status: (QI) not-done
* context: (QI) Encounter or Episode of Care administered as part of

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationAdministration](StructureDefinition-qicore-medicationadministration.html) ###


**QI Elements:**
* status: (QI) in-progress \| not-done \| on-hold \| completed \| entered-in-error \| stopped \| unknown
* medication[x]: (QI) What was administered
* dosage: (QI) Details of how medication was taken
* medication[x].extension(codeOptions): (QI) Url of a value set of candidate medications
* subject: (QI) Who received medication
* request: (QI) Request administration performed against
* effective[x]: (QI) Start and end time of administration
* context: (QI) Encounter or Episode of Care administered as part of

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationDispense Declined](StructureDefinition-qicore-medicationdispensedeclined.html) ###


**Must Have:**
* medication[x]: (QI) What medication was supplied
* subject: (QI) Who the dispense is for
* status: (QI) declined


**QI Elements:**
* extension(recorded): (QI) Extension
* authorizingPrescription: (QI) Medication order that authorizes the dispense
* dosageInstruction: (QI) How the medication is to be used by the patient or administered by the caregiver
* medication[x].extension(codeOptions): (QI) Url of a value set of candidate medications
* statusReason[x]: (QI) Why a dispense was not performed
* daysSupply: (QI) Amount of medication expressed as a timing amount
* whenPrepared: (QI) When product was packaged and reviewed
* quantity: (QI) Amount dispensed
* whenHandedOver: (QI) When product was given out or mailed
* type: (QI) Trial fill, partial fill, emergency fill, etc.

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationDispense Done](StructureDefinition-qicore-medicationdispensedone.html) ###


**Must Have:**
* medication[x]: (QI) What medication was supplied
* status: (QI) preparation​ \| in-progress​ \| on-hold​ \| completed​ \| stopped​
* subject: (QI) Who the dispense is for


**QI Elements:**
* authorizingPrescription: (QI) Medication order that authorizes the dispense
* extension(recorded): (QI) When recorded
* dosageInstruction: (QI) How the medication is to be used by the patient or administered by the caregiver
* medication[x].extension(codeOptions): (QI) Url of a value set of candidate medications
* daysSupply: (QI) Amount of medication expressed as a timing amount
* whenPrepared: (QI) When product was packaged and reviewed
* quantity: (QI) Amount dispensed
* whenHandedOver: (QI) When product was given out or mailed
* type: (QI) Trial fill, partial fill, emergency fill, etc.

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationDispense](StructureDefinition-qicore-medicationdispense.html) ###


**Must Have:**
* medication[x]: (QI) What medication was supplied
* subject: (QI) Who the dispense is for
* status: (QI) preparation \| in-progress \| cancelled \| on-hold \| completed \| entered-in-error \| stopped \| declined \| unknown


**QI Elements:**
* authorizingPrescription: (QI) Medication order that authorizes the dispense
* extension(recorded): (QI) When recorded
* dosageInstruction: (QI) How the medication is to be used by the patient or administered by the caregiver
* medication[x].extension(codeOptions): (QI) Url of a value set of candidate medications
* daysSupply: (QI) Amount of medication expressed as a timing amount
* whenPrepared: (QI) When product was packaged and reviewed
* quantity: (QI) Amount dispensed
* whenHandedOver: (QI) When product was given out or mailed
* type: (QI) Trial fill, partial fill, emergency fill, etc.

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationRequest](StructureDefinition-qicore-medicationrequest.html) ###


**Must Have:**
* subject: (QI) Who or group medication request is for
* intent: (QI) proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* status: (QI) active \| on-hold \| cancelled \| completed \| entered-in-error \| stopped \| draft \| unknown
* medication[x]: (QI) Medication to be taken


**QI Elements:**
* reasonCode: (QI) Reason or indication for ordering or not ordering the medication
* authoredOn: (QI) When request was initially authored
* requester: (QI) Who/What requested the Request
* extension(medicationAdherence): (QI) Reported adherence to prescribed medication instructions.
* encounter: (QI) Encounter created as part of encounter/admission/stay
* dispenseRequest: (QI) Medication supply authorization
* reasonReference: (QI) QI-Core Condition or Observation that supports the prescription
* dosageInstruction: (QI) How medication should be taken
* doNotPerform: (QI) True if the order is not to provide the medication
* reported[x]: (QI) Reported rather than primary record

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationRequested](StructureDefinition-qicore-medicationrequested.html) ###


**Must Have:**
* subject: (QI) Who or group medication request is for
* status: (QI) active \| on-hold \| cancelled \| completed \| stopped \| draft
* intent: (QI) proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* medication[x]: (QI) Medication to be taken


**QI Elements:**
* doNotPerform: (QI) True if medication was not requested
* reasonCode: (QI) Reason or indication for ordering or not ordering the medication
* category: (QI) Type of medication usage
* authoredOn: (QI) When request was initially authored
* requester: (QI) Who/What requested the Request
* extension(medicationAdherence): (QI) Reported adherence to prescribed medication instructions.
* encounter: (QI) Encounter created as part of encounter/admission/stay
* dispenseRequest: (QI) Medication supply authorization
* reasonReference: (QI) QI-Core Condition or Observation that supports the prescription
* dosageInstruction: (QI) How medication should be taken
* reported[x]: (QI) Reported rather than primary record

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore MedicationStatement](StructureDefinition-qicore-medicationstatement.html) ###


**QI Elements:**
* subject: (QI) Who is/was taking the medication
* status: (QI) active \| completed \| entered-in-error \| intended \| stopped \| on-hold \| unknown \| not-taken
* dateAsserted: (QI) When the statement was asserted?
* derivedFrom: (QI) Additional supporting information
* medication[x]: (QI) What medication was taken
* effective[x]: (QI) The date/time or interval when the medication is/was/will be taken
* informationSource: (QI) Person or organization that provided the information about the taking of this medication

**Primary code path:** medication
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore NonPatient Observation](StructureDefinition-qicore-nonpatient-observation.html) ###


**QI Elements:**
* performer: (QI) Who is responsible for the observation
* derivedFrom: (QI) QI Core Profiles or other resource the observation is made from
* category: (QI) Classification of type of observation
* code: (QI) Type of observation (code / type)
* subject: (QI) The device/location/implantable device the observation is about
* value[x]: (QI) Actual result
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| cancelled \| entered-in-error \| unknown
* effective[x]: (QI) Clinically relevant time/time-period for observation
* value[x]: (valueCodeableConcept) (QI) actual \| potential
* interpretation: (QI) High, low, normal, etc.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore NutritionOrder](StructureDefinition-qicore-nutritionorder.html) ###


**QI Elements:**
* patient: (QI) The person who requires the diet, formula or nutritional supplement

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Observation Clinical Result](StructureDefinition-qicore-observation-clinical-result.html) ###


**Must Have:**
* code: (QI) Clinical Test or Procedure Name
* subject: (QI) Who and/or what the observation is about
* category: (QI) Classification of type of observation
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| cancelled \| entered-in-error \| unknown


**QI Elements:**
* value[x]: (QI) Result Value
* dataAbsentReason: (QI) Why the result is missing
* category(us-core): (QI) Classification of type of observation
* effective[x]: (QI) Clinically relevant time/time-period for observation

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Observation Screening Assessment](StructureDefinition-qicore-observation-screening-assessment.html) ###


**Must Have:**
* category (survey - extension): (QI) Classification of type of observation
* subject: (QI) Who and/or what the observation is about
* category: (QI) Classification of type of observation
* code: (QI) Type of observation (code / type)
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| cancelled \| entered-in-error \| unknown


**QI Elements:**
* performer: (QI) Who is responsible for the observation
* category(screening-assessment): (QI) Classification of type of observation
* hasMember: (QI) Reference to panel or multi-select responses
* derivedFrom: (QI) Related Observations or QuestionnaireResponses that the observation is made from
* dataAbsentReason: (QI) Why the result is missing
* value[x]: (QI) Actual result
* effective[x]: (QI) Clinically relevant time/time-period for observation
* interpretation: (QI) High, low, normal, etc.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Organization](StructureDefinition-qicore-organization.html) ###


**Must Have:**
* active: Whether the organization's record is still in active use
* name: Name used for the organization


**QI Elements:**
* identifier.use: (QI) usual \| official \| temp \| secondary \| old (If known)
* identifier.value: (QI) The value that is unique
* identifier(ein): (QI) Employer Identification Number
* identifier(ccn): (QI) CMS Certification Number
* type: (QI) Kind of organization

**Primary code path:** type
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Patient](StructureDefinition-qicore-patient.html) ###


**Must Have:**
* name: A name associated with the patient
* identifier: An identifier for this patient
* gender: male \| female \| other \| unknown


**QI Elements:**
* deceased[x]: (QI) Indicates if the individual is deceased or not
* extension(race): (QI) US Core Race Extension
* extension(tribalAffiliation): (QI) Tribal Affiliation Extension
* birthDate: (QI) The date of birth for the individual
* extension(ethnicity): (QI) US Core ethnicity Extension
* address: (QI) An address for the individual
* communication: (QI) A language which may be used to communicate with the patient about his or her health
* extension(genderIdentity): (QI) The individual's gender identity
* telecom: (QI) A contact detail for the individual
* extension(sex): (QI) Sex Extension



<br>
<br>

### [QICore Practitioner](StructureDefinition-qicore-practitioner.html) ###


**Must Have:**
* name: The name(s) associated with the practitioner
* identifier: (QI) An identifier for the person as this agent


**QI Elements:**
* identifier.use: (QI) usual \| official \| temp \| secondary \| old (If known)
* identifier(NPI): (QI) An identifier for the person as this agent
* identifier.value: (QI) The value that is unique
* identifier(ein): (QI) There is not a general Tax Identifier Numer (TIN) OID. There is an SSN, a PTIN, and an ITIN, but no TIN generally. So the only slice specified here is EIN, if consumers determine a need for an SSN, submit a comment to that effect.



<br>
<br>

### [QICore PractitionerRole](StructureDefinition-qicore-practitionerrole.html) ###


**QI Elements:**
* identifier.use: (QI) usual \| official \| temp \| secondary \| old (If known)
* period: (QI) The period during which the practitioner is authorized to perform in these role(s)
* identifier.value: (QI) The value that is unique
* practitioner: (QI) Practitioner that is able to provide the defined services for the organization
* organization: (QI) Organization where the roles are available
* location: (QI) The location(s) at which this practitioner provides care
* code: (QI) Roles which this practitioner may perform
* identifier: (QI) Business Identifiers that are specific to a role/location
* active: (QI) Whether this practitioner role record is in active use
* telecom: (QI) Contact details that are specific to the role/location/service
* specialty: (QI) Specific specialty of the practitioner
* endpoint: (QI) Technical endpoints providing access to services operated for the practitioner with this role

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Procedure Done](StructureDefinition-qicore-proceduredone.html) ###


**Must Have:**
* subject: (QI) Who the procedure was performed on
* code: (QI) What procedure
* status: (QI) preparation \| in-progress \| ​on-hold​ \| stopped​ \| completed


**QI Elements:**
* performed[x]: (QI) When the procedure was performed
* reasonCode: (QI) Coded reason procedure performed
* reasonReference: (QI) The justification that the procedure was performed
* basedOn: (QI) A request for this procedure
* code.extension(codeOptions): (QI) Url of a value set of candidate procedures
* extension(recorded): (QI) When the procedure was first captured in the subject's record

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Procedure Not Done](StructureDefinition-qicore-procedurenotdone.html) ###


**Must Have:**
* subject: (QI) Who the procedure was performed on
* code: (QI) What procedure
* status: (QI) not-done


**QI Elements:**
* performed[x]: (QI) When the procedure was performed
* reasonCode: (QI) Coded reason procedure performed
* reasonReference: (QI) The justification that the procedure was performed
* basedOn: (QI) A request for this procedure
* code.extension(codeOptions): (QI) Url of a value set of candidate procedures
* statusReason: (QI) Reason for the current status
* extension(recorded): (QI) When the procedure was first captured in the subject's record

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Procedure](StructureDefinition-qicore-procedure.html) ###


**Must Have:**
* subject: (QI) Who the procedure was performed on
* code: (QI) What procedure
* status: (QI) preparation \| in-progress \| not-done \| on-hold \| stopped \| completed \| entered-in-error \| unknown


**QI Elements:**
* performed[x]: (QI) When the procedure was performed
* reasonCode: (QI) Coded reason procedure performed
* reasonReference: (QI) The justification that the procedure was performed
* basedOn: (QI) A request for this procedure
* code.extension(codeOptions): (QI) Url of a value set of candidate procedures
* extension(recorded): (QI) When the procedure was first captured in the subject's record

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore QuestionnaireResponse](StructureDefinition-qicore-questionnaireresponse.html) ###


**Must Have:**
* questionnaire: (QI) Form being answered
* status: in-progress \| completed \| amended \| entered-in-error \| stopped
* subject: (QI) The subject of the questions
* authored: Date the answers were gathered


**QI Elements:**
* item: (QI) Groups and questions
* author: (QI) Person who received and recorded the answers

**Primary code path:** questionnaire
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore RelatedPerson](StructureDefinition-qicore-relatedperson.html) ###


**Must Have:**
* active: (QI) Whether this related person's record is in active use
* patient: (QI) The patient this person is related to


**QI Elements:**
* name: (QI) A name associated with the person
* telecom: (QI) A contact detail for the person
* relationship: (QI) The nature of the relationship

**Primary code path:** relationship
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Service Prohibited](StructureDefinition-qicore-serviceprohibited.html) ###


**Must Have:**
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code: (QI) What is being requested/ordered
* subject: (QI) Individual or Entity the service is ordered for
* authoredOn: (QI) Date request signed
* status: (QI) draft \| active \| on-hold \| completed


**QI Elements:**
* code.extension(codeOptions): (QI) Url of a value set of candidate services
* reasonCode: (QI) Explanation/Justification for procedure or service
* occurrence[x]: (QI) When service should occur
* doNotPerform: (QI) True if service/procedure should not be performed
* reasonReference: (QI) Explanation/Justification for service or service

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
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
* code.extension(codeOptions): (QI) Url of a value set of candidate services
* reasonCode: (QI) Explanation/Justification for procedure or service
* occurrence[x]: (QI) When service should occur
* authoredOn: (QI) Date request signed
* doNotPerform: (QI) True if service/procedure should not be performed
* reasonReference: (QI) Explanation/Justification for service or service

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore ServiceRequested](StructureDefinition-qicore-servicerequested.html) ###


**Must Have:**
* intent: (QI) proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option
* code: (QI) What is being requested/ordered
* subject: (QI) Individual or Entity the service is ordered for
* status: (QI) draft \| active \| on-hold \| completed


**QI Elements:**
* code.extension(codeOptions): (QI) Url of a value set of candidate services
* reasonCode: (QI) Explanation/Justification for procedure or service
* occurrence[x]: (QI) When service should occur
* authoredOn: (QI) Date request signed
* doNotPerform: (QI) True if service/procedure should not be performed
* reasonReference: (QI) Explanation/Justification for service or service

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Simple Observation](StructureDefinition-qicore-simple-observation.html) ###


**Must Have:**
* subject: (QI) Who and/or what the observation is about
* category: (QI) Classification of type of observation
* code: (QI) Type of observation (code / type)
* status: (QI) registered \| prliminary \| final \| amended \| corrected \| cancelled \| entered-in-error \| unknown


**QI Elements:**
* performer: (QI) Who is responsible for the observation
* derivedFrom: (QI) US Core Profiles or other resource the observation is made from
* value[x]: (QI) Actual result
* effective[x]: (QI) Clinically relevant time/time-period for observation
* value[x]: (valueCodeableConcept) (QI) actual \| potential
* interpretation: (QI) High, low, normal, etc.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Substance](StructureDefinition-qicore-substance.html) ###


**QI Elements:**
* code: (QI) If this describes a specific package/container of the substance

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Task Done](StructureDefinition-qicore-taskdone.html) ###


**QI Elements:**
* basedOn: (QI) Request fulfilled by this task
* executionPeriod: (QI) Start and end time of execution
* focus: (QI) What task is acting on
* intent: (QI) unknown \| proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance
* code: (QI) Task Type
* status: (QI) draft​ \| requested​ \| received​ \| accepted​ \| ready \| in-progress​ \| on-hold​ \| completed
* encounter: (QI) Healthcare event during which this task originated
* for: (QI) Beneficiary of the Task
* priority: (QI) routine \| urgent \| asap \| stat

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Task Rejected](StructureDefinition-qicore-taskrejected.html) ###


**QI Elements:**
* focus: (QI) What task is acting on
* statusReason: (QI) Reason for current status
* for: (QI) Beneficiary of the Task
* executionPeriod: (QI) The time action first taken meets expectation of the rejected use case.

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

### [QICore Task](StructureDefinition-qicore-task.html) ###


**QI Elements:**
* basedOn: (QI) Request fulfilled by this task
* executionPeriod: (QI) Start and end time of execution
* focus: (QI) What task is acting on
* intent: (QI) unknown \| proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance
* status: (QI) draft​ \| requested​ \| received​ \| accepted​ \| rejected \| ready​ \| cancelled​ \| in-progress​ \| on-hold​ \| failed​ \| completed \| entered-in-error
* code: (QI) Task Type
* encounter: (QI) Healthcare event during which this task originated
* for: (QI) Beneficiary of the Task
* priority: (QI) routine \| urgent \| asap \| stat

**Primary code path:** code
<br>
(PCPath) This element is the primary code path for this resource [CQL Retrieve](https://cql.hl7.org/02-authorsguide.html#retrieve)
<br>



<br>
<br>

