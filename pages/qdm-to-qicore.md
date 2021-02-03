---
layout: default
title: QDM to QI-Core
topofpage: true
---

---

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## 8 Quality Data Model (QDM) v5.5 to QI-Core R4 Draft Mapping

### 8.1 Introduction

The CMS Quality Data Model (QDM) has been used to express electronic
clinical quality measures (eCQMs) in HQMF since 2012. QDM is a
conceptual data model that has evolved based on feedback, testing and
use. The current version (5.5) and QDM's complete history can be found
on the [eCQI Resource Center](https://ecqi.healthit.gov/qdm). Most of
the QDM concepts map directly to US Core R4, FHIR R4 resources or
extensions represented in QI-Core.

This version of QI Core updates mappings from QI-Core to QDM based on
US Core R4 and FHIR R4 and QDM version 5.5. Reviewers can evaluate the
comparisons, represented in the *Mappings* table for each QI-Core
resource. Each *mapping* table shows the QI-Core concept in the
left-hand column and the corresponding QDM datatype(s) and attributes in
the left-hand column. Only QI-Core metadata concepts represented in QDM
are included in the *mapping* tables. The effort mapped the intended
meaning of each QDM datatype and attribute to a QI-Core resource
metadata element. In some cases, multiple QDM datatypes map to a single
QI-Core resource as indicated in the QI-Core *mapping* table.

In addition to the QI-Core to QDM comparisons presented with each
QI-Core resource, this section of the implementation guide presents the
mapping directly from QDM concepts. Thus, the IG provides a view of the
mappings in both directions (QI-Core to QDM, and QDM to QI-Core). This
section is divided into 55 sections, one for each QDM concept, or QDM
datatype. Each QDM datatype includes a general description of the
concept and a table mapping each of the QDM datatype-related attributes
to QI-Core metadata elements. Refer to the [eCQI Resource
Center](https://ecqi.healthit.gov/qdm) for the full QDM 5.5
documentation.

### 8.2 Adverse Event

This QDM to QI-Core Mapping for the QDM Datatype "Adverse Event" has
been updated from QDM 5.4 to QDM 5.5.

QDM defines Adverse Event as any untoward medical occurrence associated
with the clinical care delivery, whether or not considered drug related.
The concepts aligns with the FHIR R4 resource Adverse Event
(<http://hl7.org/fhir/adverseevent-definitions.html#AdverseEvent>).
The FHIR resource provides clearer expressivity as compared with QDM. 
QDM AdverseEvent references only the suspectEntity.instance (as *code*)
and category (as *type*).  It does not include any reference to an
event’s actuality (i.e., potential Vs actual) which is available in
FHIR. To expand on the ability to express such a concept, the mapping
table includes adverseEvent.actuality.

| **QDM Context**    | **QI-Core R4**                                                                                                                                               | **Comments**                                               |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- |
| Adverse Event      | [AdverseEvent](StructureDefinition-qicore-adverseevent.html)                                                                         |                                                            |
|                    | [AdverseEvent.actuality](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.actuality)                          |                                                            |
| **QDM Attributes** |                                                                                                                                                              |                                                            |
| code               | [AdverseEvent.event](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.event)               | FHIR R4 replaces AdverseEvent.type with AdverseEvent.event |
| type               | [AdverseEvent.category](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.category)         |                                                            |
| severity           | [AdverseEvent.severity](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.severity)         |                                                            |
| relevant dateTime  | [AdverseEvent.date](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.date)                 |                                                            |
| FacilityLocations  | [AdverseEvent.location](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.location)         |                                                            |
| Author dateTime    | [AdverseEvent.recordedDate](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.recordedDate) |                                                            |
| id                 | [AdverseEVent.id](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.id)                     |                                                            |
| recorder           | [AdverseEvent.recorder](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.recorder)         |                                                            |
{: .grid}

### 8.3 Allergy/Intolerance

This QDM to QI-Core Mapping for the QDM Datatype "Allergy/Intolerance"
is updated from QDM 5.4 to QDM 5.5

Allergy is used to address immune-mediated reactions to a substance such
as type 1 hypersensitivity reactions, other allergy-like reactions,
including pseudo-allergy.

Intolerance is a record of a clinical assessment of a propensity, or a
potential risk to an individual, to have a non-immune mediated adverse
reaction on future exposure to the specified substance, or class of
substance.

| **QDM Context**     | **QI-Core R4**                                                                                                                                                                                       | **Comments**                                                                                                                                                                                                                                     |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Allergy/Intolerance | [AllergyIntolerance](StructureDefinition-qicore-allergyintolerance.html)                                                                         |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.clinicalStatus](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.clinicalStatus)                   | active, inactive, resolved                                                                                                                                                                                                                                                 |
|                     | [AllergyIntolerance.type](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.type)                                       | Defines difference between Allergy and Intolerance                                                                                                                                                                                               |
|                     | [AllergyIntolerance.verificationStatus](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.verificationStatus)           | unconfirmed, confirmed, refuted, entered-in-error                                                                                                                                                                                                |
|                     | [AllergyIntolerance.extension:reasonRefuted](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.extension:reasonRefuted) |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.category](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.category)                               | Food, medication, environment, biologic                                                                                                                                                                                                          |
| **QDM Attributes**  |                                                                                                                                                                                                      |                                                                                                                                                                                                                                                  |
| Code                | [AllergyIntolerance.code](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.code)                                       | RxNorm                                                                                                                                                                                                                                           |
| id                  | [AllergyIntolerance.id](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.id)                                           |                                                                                                                                                                                                                                                  |
| Prevalence Period   | [AllergyIntolerance.onset\[x\]](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.onset[x])                             | Prevalence Period start time maps to AllergyIntolerance.onset[x]. Implementers may need to “map” existing allergy onset timings (e.g., day, age, year, etc.) to a corresponding dateTime to allow calculation of measure or CDS expressions.     |
|                     | [AllergyIntolerance.lastOccurrence](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.lastOccurrence)                   |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.extension:resolutionAge](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.extension:resolutionAge) | Prevalence Period end time maps to AllergyIntolerance.extension:resolutionAge. Implementers may need to “map” existing allergy resolution timings (e.g., day, age, year, etc.) to a corresponding dateTime to allow calculation of measure or CDS expressions.|
| author dateTime     | [AllergyIntolerance.recordedDate](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.recordedDate)                       |                                                                                                                                                                                                                                                  |
| Type                | [AllergyIntolerance.reaction](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction)                               |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.reaction.substance](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction.substance)           |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.reaction.manifestation](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction.manifestation)   |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.reaction.onset](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction.onset)                   |                                                                                                                                                                                                                                                  |
| Severity            | [AllergyIntolerance.reaction.severity](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction.severity)             | mild, moderate, severe                                                                                                                                                                                                                           |
|                     | [AllergyIntolerance.criticality](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.criticality)                         | low, high, unable-to-assess                                                                                                                                                                                                                      |
| Recorder            | [AllergyIntolerance.asserter](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.asserter)                               |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.recorder](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.recorder)                               |                                                                                                                                                                                                                                                  |
{: .grid}

### 8.4 Assessment

#### 8.4.1 Assessment, Order

Assessment, Order uses the ServiceRequest resource. However, specifically for
evaluating smoking status, see subsection below.

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Assessment, Order**                                             | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                              |
| Negation Rationale                                                | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.4.1.1 Negation Rationale for Assessment, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

##### 8.4.1.2 QI-Core Smoking Status for Assessment, Order

To capture an order for QI-Core Smoking Status, use the Assessment, Order
mapping but constrain ServiceRequest.code to the value set
[us-core-smoking-status-observation-codes](https://www.hl7.org/fhir/us/core/ValueSet-us-core-smoking-status-observation-codes.html)

#### 8.4.2 Assessment, Performed

QDM defines Assessment as a resource used to define specific
observations that clinicians use to guide treatment of the patient. An
assessment can be a single question, or observable entity with an
expected response, an organized collection of questions intended to
solicit information from patients, providers or other individuals, or a
single observable entity that is part of such a collection of questions.

Assessment, Performed uses the Observation resource. However, specifically for
evaluating smoking status, use the specific [QI-Core smoking status assessment](http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus)
profile inherited from US Core.

| **QDM Context**                               | **QI-Core R4**                                                                                                                                                                        | **Comments**                                                                                                                                                                                                |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Assessment, Performed: General Use Case**   | [Observation](StructureDefinition-qicore-observation.html)                                                       |                                                                                                                                                                                                             |
|                                               | [Observation.category](StructureDefinition-qicore-observation-definitions.html#Observation.category)                                     | Since Assessment is a broad concept, the measure developer will need to select the appropriate category.                                                                                                    |
|                                               | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected                                                                                                                                                            |
| **QDM Attributes**                            |                                                                                                                                                      |                                                                                                                                                                                                             |
| code                                          | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                                             |                                                                                                                                                                                                             |
| id                                            | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                                 |                                                                                                                                                                                                             |
| method                                        | [Observation.method](StructureDefinition-qicore-observation-definitions.html#Observation.method)                                         |                                                                                                                                                                                                             |
| relatedTo                                     | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       |                                                                                                                                                                                                             |
|                                               | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)                                         | A larger event of which this particular Observation is a component or step. For example, an observation as part of a procedure.                                                                             |
|                                               | [Observation.derivedFrom](StructureDefinition-qicore-observation-definitions.html#Observation.derivedFrom)                               |                                                                                                                                                                                                             |
| Negation Rationale                            | See Below |
| reason                                        | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | The observation fulfills a plan, proposal or order - trace for authorization. Not a perfect  fit for the intent in QDM (e.g., observation "reason" = a diagnosis)  Is an extension needed?                  |
| result                                        | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])                                   |                                                                                                                                                                            |
|                                               | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation)                         |                                                                                                                                                                                                             |
| Relevant dateTime                             | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                  |                                                                                                                                                                                                             |
| Relevant Period                               | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                    |                                                                                                                                                                                                             |
| Author dateTime                               | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         |                                                                                                                                                                                                             |
| Component                                     | [Observation.component](StructureDefinition-qicore-observation-definitions.html#Observation.component)                                   |                                                                                                                                                                                                             |
|                                               | [Observation.component.id](StructureDefinition-qicore-observation-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                             |
| Component code                                | [Observation.component.code](StructureDefinition-qicore-observation-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                             |
| Component result                              | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                             |
|                                               | [Observation.component.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                             |
|                                               | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                             |
| Performer                                     | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                             |
{: .grid}


##### 8.4.2.1 Negation Rationale for Assessment, Performed
Use [QICoreObservationNotDone](StructureDefinition-qicore-observationnotdone.html), which contains:
* [Observation.modifierExtension:notDone](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.modifierExtension:notDone) - Value Boolean fixed to "true"
* [Observation.status](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.status) - Fixed as "final"
* [Observation.extension:notDoneReason](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Observation.issued](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.issued) - When this was made available
* [Observation.code](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.code) - Use [Observation.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.code.coding.extension:notDoneValueSet) to indicate the specific Observation that was not performed

#### 8.4.3 Assessment, Recommended

Assessment, Recommended uses the ServiceRequest resource. However, specifically for
evaluating smoking status, see subsection below.

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Assessment, Recommended**                                       | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale                                                | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.4.3.1 Negation Rationale for Assessment, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

##### 8.4.3.2 QI-Core Smoking Status for Assessment, Recommended

To capture a recommendation for QI-Core Smoking Status, use the Assessment,
Recommended mapping but constrain ServiceRequest.code to the value set
[us-core-smoking-status-observation-codes](https://www.hl7.org/fhir/us/core/ValueSet-us-core-smoking-status-observation-codes.html)

### 8.5 Care Experience

QDM defines Care Experience as the experience a patient has when
receiving care or a provider has when providing care. QDM represents two
kinds of care experience: Patient Care Experience and Provider Care
Experience. While generally interpreted as patient or provider
satisfaction, experience may also represent understanding, involvement
and other factors about the care received or given. Most often
organizations obtain such information using questionnaires. Use cases
are welcome to help provide examples for us of this concept. The Care
Experience concept best fits with the FHIR Observation resource.

#### 8.5.1 Patient Care Experience

| **QDM Context**              | **FHIR R4**                                                                                                                                                          | **Comments**                                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| **Patient Care Experience**  | [Observation](StructureDefinition-qicore-observation.html)                                      |                                                             |
|                              | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                        | Constrain status to -  final, amended, corrected            |
| **QDM Attributes**           |                                                                                                                                     |                                                             |
| Code                         | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                            |                                                             |
| id                           | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                |                                                             |
|                              | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x]) |                                                             |
|                              | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])   |                                                             |
| author dateTime              | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                        |                                                             |
| Recorder                     | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                  | who was responsible for asserting the observation as "true" |
{: .grid}

#### 8.5.2 Provider Care Experience

| **QDM Context**              | **FHIR R4**                                                                                                                                                          | **Comments**                                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| **Provider Care Experience** | [Observation](StructureDefinition-qicore-observation-definitions.html#Observation)                                      |                                                             |
|                              | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                        | Constrain status to -  final, amended, corrected            |
| **QDM Attributes**           |                                                                                                                                     |                                                             |
| Code                         | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                            |                                                             |
| id                           | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                |                                                             |
|                              | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x]) |                                                             |
|                              | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])   |                                                             |
| author dateTime              | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                        |                                                             |
| Recorder                     | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                  | who was responsible for asserting the observation as "true" |
{: .grid}

### 8.6 Care Goal

QDM defines Care Goal as a defined target or measure to be achieved in
the process of patient care, that is, an expected outcome. A typical
goal is expressed as a change in status expected at a defined future
time. That change can be an observation represented by other QDM
categories (diagnostic tests, laboratory tests, symptoms, etc.)
scheduled for some time in the future and with a particular value. A
goal can be found in the plan of care (care plan), the structure used by
many stakeholders to define the management actions for the various
conditions, problems, or issues identified for the target of the plan.
This structure, through which the goals and care-planning actions and
processes can be organized, planned, communicated, and checked for
completion, is represented in QDM as a Record Artifact in which Care
Goal is found.

| **QDM Context**    | **QI-Core R4**                                                                                                                                 | **Comments** |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **Care Goal**      | [Goal](StructureDefinition-qicore-goal.html)                                                                          |              |
|                    | [Goal.achievementStatus](StructureDefinition-qicore-goal-definitions.html#Goal.achievementStatus) |              |
| **QDM Attributes** |                                                                                                                                                |              |
| Code               | [Goal.target.measure](StructureDefinition-qicore-goal-definitions.html#Goal.target.measure)       |              |
|                    | [Goal.target.detail\[x\]](StructureDefinition-qicore-goal-definitions.html#Goal.target.detail[x]) |              |
| id                 | [Goal.id](StructureDefinition-qicore-goal-definitions.html#Goal.id)                               |              |
| statusDate         |                                                                                                                                                |              |
| Target outcome     | [Goal.target.detail\[x\]](StructureDefinition-qicore-goal-definitions.html#Goal.target.detail[x]) |              |
| Relevant Period    | [Goal.start\[x\]](StructureDefinition-qicore-goal-definitions.html#Goal.start[x])                 |              |
|                    | [Goal.target.due\[x\]](StructureDefinition-qicore-goal-definitions.html#Goal.target.due[x])             |              |
| statusDate         | [Goal.statusDate](StructureDefinition-qicore-goal-definitions.html#Goal.statusDate)               |              |
| relatedTo          | [Goal.addresses](StructureDefinition-qicore-goal-definitions.html#Goal.addresses)                 |              |
| Performer          | [Goal.expressedBy](StructureDefinition-qicore-goal-definitions.html#Goal.expressedBy)             |              |
{: .grid}

### 8.7 Communication

QDM defines Communication as the transmission, receipt, or
acknowledgement of information sent from a source to a recipient, such
as from one clinician to another regarding findings, assessments, plans
of care, consultative advice, instructions, educational resources, etc.
 The following text from the FHIR Communication and Procedure Resources
may help to differentiate when to use Communication.

[***FHIR Communication Resource***](http://hl7.org/fhir/communication.html)

This resource is a record of a communication. A communication is a
conveyance of information from one entity, a sender, to another entity,
a receiver. The sender and receivers may be patients, practitioners,
related persons, organizations, or devices. Communication use cases
include:

  - A reminder or alert delivered to a responsible provider

  - A recorded notification from the nurse to the on-call physician (or
    any other specified person) that a patient's temperature exceeds a
    value

  - A notification to a public health agency of a patient presenting
    with a communicable disease reportable to the public health agency

  - Patient educational material sent by a provider to a patient

  - Unable to deliver lab results to ordering physician

Non-patient specific communication use cases may include:

  - A nurse call from a hall bathroom

  - Advisory for battery service from a pump

**Boundaries and Relationships (Section 8.20.2) - Communication and
Encounter**

  - The Communication is about the transfer of information (which might
    or might not occur as part of an encounter), while Encounter is
    about the coming together (in person or virtually) of a Patient with
    a Practitioner. Communication does not deal with the duration of a
    call, it represents the fact that information was transferred at a
    particular point in time.

  - The phone calls involving the Patient should be handled
    using [Encounter](http://hl7.org/fhir/encounter.html). Phone calls
    not involving the patient (e.g. between practitioners or
    practitioner to relative) that are tracked for billing or other
    purposes can use Communication to represent the information
    transferred but are not ideal to represent the call itself. A better
    mechanism for handling such calls will be explored in a future
    release.

[***HL7 FHIR Procedure Resource***](http://hl7.org/fhir/procedure.html)

The boundary between determining whether an action is a Procedure
(training or counseling) as opposed to a Communication is based on
whether there's a specific intent to change the mind-set of the patient.
Mere disclosure of information would be considered a Communication. A
process that involves verification of the patient's comprehension or to
change the patient's mental state would be a Procedure.

#### 8.7.1 Communication, Performed

| **QDM Context**              | **QI-Core R4**                                                                                                                                                  | **Comments**                                                                                  |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| **Communication, Performed** | [Communication](StructureDefinition-qicore-communication.html)                                                     |                                                                                               |
|                              | [Communication.status](StructureDefinition-qicore-communication-definitions.html#Communication.status)             | consider constraining to in-progress, completed, on-hold                                      |
| **QDM Attributes**           |                                                                                                                    |                                                                                               |
| Code                         | [Communication.reasonCode](StructureDefinition-qicore-communication-definitions.html#Communication.reasonCode)     |                                                                                               |
| id                           | [Communication.id](StructureDefinition-qicore-communication-definitions.html#Communication.id)                     |                                                                                               |
| category                     | [Communication.category](StructureDefinition-qicore-communication-definitions.html#Communication.category)         | alert, notification, reminder, instruction                                                    |
| medium                       | [Communication.medium](StructureDefinition-qicore-communication-definitions.html#Communication.medium)             |                                                                                               |
| sent dateTime                | [Communication.sent](StructureDefinition-qicore-communication-definitions.html#Communication.sent)                 |                                                                                               |
| received dateTime            | [Communication.received](StructureDefinition-qicore-communication-definitions.html#Communication.received)         |                                                                                               |
| author dateTime              | N/A                                                                                                                | No timing exists in FHIR to address timing of negation (i.e., Communication.status = not-done |
| relatedTo                    | [Communication.basedOn](StructureDefinition-qicore-communication-definitions.html#Communication.basedOn)           | An order, proposal or plan fulfilled in whole or in part by this Communication.               |
|                              | [Communication.inResponseTo](StructureDefinition-qicore-communication-definitions.html#Communication.inResponseTo) | Response to a communication                                                                   |
| sender                       | [Communication.sender](StructureDefinition-qicore-communication-definitions.html#Communication.sender)             |                                                                                               |
| recipient                    | [Communication.recipient](StructureDefinition-qicore-communication-definitions.html#Communication.recipient)       |                                                                                               |
| Negation Rationale           | See Below |
{: .grid}

##### 8.7.1.1 Negation Rationale for Communication, Performed

Use [QICoreCommunicationNotDone](StructureDefinition-qicore-communicationnotdone.html), which contains:
* [Communication.modifierExtension:notDone](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.modifierExtension:notDone) - Value Boolean fixed to "true"
* [Communication.status](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.status) - Fixed as "not-done"
* [Communication.statusReason](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Communication.extension:recorded](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.extension:recorded) - When this was made available
* [Communication.reasonCode](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.reasonCode) - Use [Communication.reasonCode.coding.extension:notDoneValueSet](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.reasonCode.coding.extension:notDoneValueSet) to indicate the specific Communication that was not performed

### 8.8 Diagnosis

QDM defines Condition/Diagnosis/Problem as a practitioner’s
identification of a patient’s disease, illness, injury, or condition.
This category contains a single datatype to represent all of these
concepts: Diagnosis. A practitioner determines the diagnosis by means of
examination, diagnostic test results, patient history, and/or family
history. Diagnoses are usually considered unfavorable, but they may also
represent neutral or favorable conditions that affect a patient’s plan
of care (e.g., pregnancy).

| **QDM Context**                     | **QI-Core R4**                                                                                                                                                  | **Comments**                                                                 |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| **Condition - Diagnosis - Problem** | [Condition](StructureDefinition-qicore-condition.html)                                                                                 |                                                                              |
|                                     | [Condition.clinicalStatus](StructureDefinition-qicore-condition-definitions.html#Condition.clinicalStatus)         | defines active/inactive                                                      |
|                                     | [Condition.verificationStatus](StructureDefinition-qicore-condition-definitions.html#Condition.verificationStatus) | confirmed, unconfirmed provisional, differential, refuted, entered-in-error, |
|                                     | [Condition.category](StructureDefinition-qicore-condition-definitions.html#Condition.category)                     | problem-list-item, encounter-diagnosis, health-concern                       |
| **QDM Attributes**                  |                                                                                                                                                                 |                                                                              |
| code                                | [Condition.code](StructureDefinition-qicore-condition-definitions.html#Condition.code)                             |                                                                              |
| id                                  | [Condition.id](StructureDefinition-qicore-condition-definitions.html#Condition.id)                                 |                                                                              |
| Prevalence Period                   | [Condition.onset\[x\]](StructureDefinition-qicore-condition-definitions.html#Condition.onset[x])                   | May be dateTime, Age, Period Range, string                                   |
|                                     | [Condition.abatement\[x\]](StructureDefinition-qicore-condition-definitions.html#Condition.abatement[x])           | May be dateTime, Age, Period Range, string                                   |
| Author dateTime                     | [Condition.recordedDate](StructureDefinition-qicore-condition-definitions.html#Condition.recordedDate)             |                                                                              |
| Severity                            | [Condition.severity](StructureDefinition-qicore-condition-definitions.html#Condition.severity)                     | severe, moderate, mild                                                       |
| Anatomical Location Site            | [Condition.bodySite](StructureDefinition-qicore-condition-definitions.html#Condition.bodySite)                     |                                                                              |
| Recorder                            | [Condition.recorder](StructureDefinition-qicore-condition-definitions.html#Condition.recorder)                     | Individual who recorded the record and takes responsibility for its content  |
|                                     | [Condition.asserter](StructureDefinition-qicore-condition-definitions.html#Condition.asserter)                     | Individual who is making the condition statement                             |
{: .grid}

### 8.9 Device

QDM defines Device as an instrument, apparatus, implement, machine, contrivance,
implant, in-vitro reagent, or other similar or related article, including a
component part or accessory, intended for use in the diagnosis, cure,
mitigation, treatment, or prevention of disease and not dependent on being
metabolized to achieve any of its primary intended purposes.

FHIR defines the [Device Resource](http://hl7.org/fhir/R4/device.html) as a
type of a manufactured item that is used in the provision of healthcare without
being substantially changed through that activity. The device may be a medical
or non-medical device.

FHIR and US Core further differentiate devices into two "classes":
* Devices that interact with the human body but do not stay in it are referred
to as non-implantable medical devices.
* Implantable devices are those which stay in the human body with a medical
objective for an extended period of time, or even a lifetime.

[Definition reference: Imam W. How to use ISO 13485:2016 to manage implantable
devices, *ISO 13485 Blog*. July 4, 2016. Available at: https://advisera.com/13485academy/blog/2017/07/04/how-to-use-iso-134852016-to-manage-implantable-medical-devices/.
Accessed 28 January 2020.]

The FHIR [Device Resource](http://hl7.org/fhir/R4/device.html) addresses both
implantable and non-implantable devices. US Core only references [Implantable
Device](http://hl7.org/fhir/us/core/StructureDefinition-us-core-implantable-device.html).
QI-Core inherits Implantable Device from US Core and builds directly from FHIR
for the QI-Core Device Resource.

#### 8.9.1 Device, Applied
QDM originally designed Device, Applied to allow access to documentation of
device usage. However, evaluation over time indicates that all documentation
about usage of a device occurs as an observation. Thus, information about an
implanted pacemaker status check, utilization of a patient-use Continuous
Positive Airway Pressure (CPAP) device, results from a glucometer, or use of a
wheelchair or cane should use the QDM datatype, Assessment, Performed, or
QI-Core Observation. Current use of Device, Applied is synonymous with
Procedure, Performed, i.e., placement of or adjustment to a device.

|**QDM Context**|**QI-Core R4**|**Comments**|
|---|---|---|
|**Device, Applied**|[Procedure](StructureDefinition-qicore-procedure.html)| |
||[Procedure.status](StructureDefinition-qicore-procedure-definitions.html#Procedure.status)|Constrain to "active"|
||[Procedure.usedCode](StructureDefinition-qicore-procedure-definitions.html#Procedure.usedCode)|Specify the device (direct reference code or value set) used as part of the procedure|
|**QDM Attributes**|||
|Code|[Procedure.code](StructureDefinition-qicore-procedure-definitions.html#Procedure.code)||
|id|[Procedure.id](StructureDefinition-qicore-procedure-definitions.html#Procedure.id)||
|Anatomical Location Site|[Procedure.bodySite](StructureDefinition-qicore-procedure-definitions.html#Procedure.bodySite)||
|Reason|[Procedure.reasonCode](StructureDefinition-qicore-procedure-definitions.html#Procedure.reasonCode)||
| Negation Rationale              | See Below |
|Relevant Period|[Procedure.performed\[x\] Period](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])||
|Author dateTime| N/A | Only used when negated |
|Performer|[Procedure.performer.actor](StructureDefinition-qicore-procedure-definitions.html#Procedure.performer.actor)||
{: .grid}

##### 8.9.1.1 Negation Rationale for Device, Applied

Use [QICoreProcedureNotDone](StructureDefinition-qicore-procedurenotdone.html), which contains:
* [Procedure.status](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.status) - Fixed as "not-done"
* [Procedure.statusReason](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Procedure.extension:recorded](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.extension:recorded) - When this was made available
* [Procedure.code](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.code) - Use [Procedure.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.code.coding.extension:notDoneValueSet) to indicate the specific Procedure that was not performed

#### 8.9.2 Device, Order – Non-Patient-use Devices

| **QDM Context**         | **FHIR R4**                                 | **Comments**                                                                                       |
| ----------------------- | -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| **Device Request**      | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                             |                                                                                  |
|                         | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)         | Constrain to active, on-hold, completed                                                                                    |
| **Device, Order**       | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)         | Constrain to "order" (include children)                                                                                    |
| **QDM Attributes**      |                               |                                                                                  |
| Code                    | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)             |                                                                                  |
| id                      | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                 |                                                                                  |
| Reason                  | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                      |                                                                         |
| Author dateTime         | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                      | FHIR allows dateTime or Period for desired time or schedule for use.                                                                                 |
| Negation Rationale              | See Below |
| Requester               | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                        |                                                                                  |
{: .grid}

##### 8.9.2.1 Negation Rationale for Device, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

#### 8.9.3 Device, Order – Personal Use Devices

| **QDM Context**         | **FHIR R4**                                    | **Comments**                                                                                          |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Device Request**      | [DeviceRequest](StructureDefinition-qicore-devicerequest.html)                               |                                                                                  |
|                         | [DeviceRequest.status](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.status)            | Constrain to active, on-hold, completed                                                                                    |
| **Device, Order**       | [DeviceRequest.intent](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.intent)            | Constrain to "Order" (include children)                                                                                    |
| **QDM Attributes**      |                               |                                                                                  |
| Code                    | [DeviceRequest.code\[x\]](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.code[x])       |                                                                                  |
| id                      | [DeviceRequest.id](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.id)                    |                                                                                  |
| Reason                  | [DeviceRequest.reasonCode](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.reasonCode)                         |                                                                                  |
| Author dateTime         | [DeviceRequest.authoredOn](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.authoredOn)                         | FHIR allows dateTime or Period for deseired time or schedule for use.                                                                     |
| Negation Rationale              | See Below |
| Requester               | [DeviceRequest.requester](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.requester)      |                                                                                  |
{: .grid}

##### 8.9.3.1 Negation Rationale for Device, Order – Personal Use Devices

Use [QICoreDeviceNotRequested](StructureDefinition-qicore-devicenotrequested.html), which contains:
* [DeviceRequest.modifierExtension:doNotPerform](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.modifierExtension:doNotPerform) - Value Boolean fixed to "true"
* [DeviceRequest.status](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.status) - Fixed as "completed"
* [DeviceRequest.extension:doNotPerformReason](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.extension:doNotPerformReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [DeviceRequest.authoredOn](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.authoredOn) - When this was made available
* [DeviceRequest.code\[x\]](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.code[x]) - Use [DeviceRequest.code\[x\].coding.extension:doNotPerformValueSet](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.code[x].coding.extension:doNotPerformValueSet) to indicate the specific DeviceRequest that was not performed

#### 8.9.4 Device, Recommended – Non-Patient-use Devices

| **QDM Context**         | **FHIR R4**                                    | **Comments**                                                                                          |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Device Request**      | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                             |                                                                                  |
|                         | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)         | Constrain to active, on-hold, completed                                                                                    |
| **Device, Order**       | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)         | Constrain to "order" (include children)                                                                                    |
| **QDM Attributes**      |                               |                                                                                  |
| Code                    | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)             |                                                                                  |
| id                      | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                 |                                                                                  |
| Reason                  | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                      |                                                                         |
| Author dateTime         | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                      | FHIR allows dateTime or Period for desired time or schedule for use.                                                                                 |
| Negation Rationale              | See Below |
| Requester               | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                        |                                                                                  |
{: .grid}

##### 8.9.4.1 Negation Rationale for Device, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

#### 8.9.5 Device, Recommended – Personal Use Devices

| **QDM Context**         | **FHIR R4**                                    | **Comments**                                                                                          |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Device Request**      | [DeviceRequest](StructureDefinition-qicore-devicerequest.html)                               |                                                                                  |
|                         | [DeviceRequest.status](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.status)            | Constrain to active, on-hold, completed                                                                                    |
| **Device, Order**       | [DeviceRequest.intent](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.intent)            | Constrain to "Order" (include children)                                                                                    |
| **QDM Attributes**      |                               |                                                                                  |
| Code                    | [DeviceRequest.code\[x\]](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.code[x])        |                                                                                  |
| id                      | [DeviceRequest.id](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.id)                    |                                                                                  |
| Reason                  | [DeviceRequest.reasonCode](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.reasonCode)                         |                                                                                  |
| Author dateTime         | [DeviceRequest.authoredOn](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.authoredOn)                         | FHIR allows dateTime or Period for deseired time or schedule for use.                                                                     |
| Negation Rationale              | See Below |
| Requester               | [DeviceRequest.requester](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.requester)      |                                                                                  |
{: .grid}

##### 8.9.5.1 Negation Rationale for Device, Recommended – Personal Use Devices

Use [QICoreDeviceNotRequested](StructureDefinition-qicore-devicenotrequested.html), which contains:
* [DeviceRequest.modifierExtension:doNotPerform](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.modifierExtension:doNotPerform) - Value Boolean fixed to "true"
* [DeviceRequest.status](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.status) - Fixed as "completed"
* [DeviceRequest.extension:doNotPerformReason](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.extension:doNotPerformReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [DeviceRequest.authoredOn](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.authoredOn) - When this was made available
* [DeviceRequest.code\[x\]](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.code[x]) - Use [DeviceRequest.code\[x\].coding.extension:doNotPerformValueSet](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.code[x].coding.extension:doNotPerformValueSet) to indicate the specific DeviceRequest that was not performed

### 8.10 Diagnostic Study

#### 8.10.1 Diagnostic Study, Order

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Diagnostic Study, Order**                                       | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.10.1.1 Negation Rationale for Diagnostic Study, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

#### 8.10.2 Diagnostic Study, Performed

QDM defines Diagnostic Study as any kind of medical test performed as a
specific test or series of steps to aid in diagnosing or detecting
disease (e.g., to establish a diagnosis, measure the progress or
recovery from disease, confirm that a person is free from disease). The
QDM differentiates diagnostic studies from laboratory tests in that
diagnostic studies are those that are not performed in organizations
that perform testing on samples of human blood, tissue, or other
substance from the body. Diagnostic studies may make use of digital
images and textual reports. Such studies include but are not limited to
imaging studies, cardiology studies (electrocardiogram, treadmill stress
testing), pulmonary-function testing, vascular laboratory testing, and
others.

Thus far, consensus opinion suggests that the FHIR Observation Resource
best fits the diagnostic study use case for querying clinical data to
retrieve information about the event and/or the result of the study.
Individual studies may use the US Core DiagnosticReport-note
(<http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html>)
to provide information about an individual study (e.g., a cardiac
ultrasound, MRI, etc.) although some have considered use of other
reporting resources and artifacts. Since new studies regularly become
available and the nature of existing studies change over time, a
complete list of studies to reference a desired result cannot be
assured. Therefore, a quality measure or clinical decision support (CDS)
artifacts seeking a specific result value should use the Observation
resource to request a retrieve of the result value desired. This
practice will enable implementers to determine which is the best source
for the desired observation. LOINC observable entities may indicate
specific methods for determination of results. Measure and CDS
developers can reference direct reference codes or value sets using the
such LOINC codes to specify the type of testing considered acceptable to
provide sufficient fidelity to their requests.

| **QDM Context**                 | **QI-Core  R4**                                                                                                                                                                       | **Comments**                                                                                                                                                                                                                                       |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Diagnostic Study, Performed** | [Observation](StructureDefinition-qicore-observation.html)                                                       |                                                                                                                                                                                                                                                    |
|                                 | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)                                         | A larger event of which this particular Observation is a component or step. For example, an observation as part of a procedure.                                                                                                                    |
|                                 | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected, appended                                                                                                                                                                                         |
| QDM Attributes                  |                                                                                                                                                      |                                                                                                                                                                                                                                                    |
| code                            | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                                             |                                                                                                                                                                                                                                                    |
| id                              | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                                 |                                                                                                                                                                                                                                                    |
| method                          | [Observation.method](StructureDefinition-qicore-observation-definitions.html#Observation.method)                                         |                                                                                                                                                                                                                                                    |
| facility location               | N/A                                                                                                                                                                                   |                                                                                                                                                                                                                                                    |
|                                 | [Observation.bodySite](StructureDefinition-qicore-observation-definitions.html#Observation.bodySite)                                     |                                                                                                                                                                                                                                                    |
| Negation Rationale              | See Below |
| reason                          | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | the Observation.basedOn concept indicates the plan, proposal or order that the observation fulfills. This concept is not consistent with the QDM concept of "reason" for the study to be performed.                                                |
| result                          | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])                                   |                                                                                                                                                                                                                                                    |
|                                 | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation)                         |                                                                                                                                                                                                                                                    |
| result dateTime                 | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         |                                                                                                                                                                                                                                                    |
| Relevant dateTime               | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                  |                                                                                                                                                                                                                                                    |
| Relevant Period                 | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                    |                                                                                                                                                                                                                                                    |
| Status                          | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected, appended                                                                                                                                                                                         |
| Author dateTime                 | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         | Issued - the date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified. Consider if QI-Core should include an extension to manage timing of the dataAbsentReason. |
| Component                       | [Observation.component](StructureDefinition-qicore-observation-definitions.html#Observation.component)                                   | Components not present in US Core-R4 DiagnosticReport but the report references Observation for results; thus it seems reasonable to re-use observation concepts for the components of a DiagnosticReport                                          |
|                                 | [Observation.component.id](StructureDefinition-qicore-observation-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                                                                    |
| Component code                  | [Observation.component.code](StructureDefinition-qicore-observation-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                                                                    |
| Component result                | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                                                                    |
|                                 | [Observation.component.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                                                                    |
|                                 | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                                                                    |
| Performer                       | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                                                                    |
{: .grid}

##### 8.10.2.1 Negation Rationale for Diagnostic Study, Performed

Use [QICoreObservationNotDone](StructureDefinition-qicore-observationnotdone.html), which contains:
* [Observation.modifierExtension:notDone](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.modifierExtension:notDone) - Value Boolean fixed to "true"
* [Observation.status](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.status) - Fixed as "final"
* [Observation.extension:notDoneReason](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Observation.issued](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.issued) - When this was made available
* [Observation.code](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.code) - Use [Observation.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.code.coding.extension:notDoneValueSet) to indicate the specific Observation that was not performed

#### 8.10.3 Diagnostic Study, Recommended

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Diagnostic Study, Recommended**                                 | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.10.3.1 Negation Rationale for Diagnostic Study, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed


### 8.11 Encounter

QDM defines Encounter as an identifiable grouping of healthcare-related
activities characterized by the entity relationship between the subject
of care and a healthcare provider; such a grouping is determined by the
healthcare provider. A patient encounter represents interaction between
a healthcare provider and a patient with a face-to-face patient visit to
a clinician’s office, or any electronically remote interaction with a
clinician for any form of diagnostic treatment or therapeutic event.

#### 8.11.1 Encounter Timing

Implementation considerations must be considered when referencing
encounter periods (start to end time).  Some clinical sites may leave
Encounters "open" until all documentation has been completed which may
take 72 hours or more.  However, the actual encounter may have lasted
for a much shorter time period (e.g., 15 minutes for an ambulatory
encounter). This issue is addressed in The Office of the National
Coordinator for Health IT (ONC) Issue Tracking System as item
[QDM-235](https://oncprojectracking.healthit.gov/support/projects/QDM/issues/QDM-235?filter=recentlyviewed).
Two approaches clinical sites have used to manage this issue include:

* Include a patient check-in and check-out time as part of the visit
documentation. These times represent when the patient arrives and
leaves, respectively, and these times are used for the Encounter
relevant period. However, patient arrival at a location does not
necessarily mean the start of the encounter (e.g. a patient arrives
an hour earlier than he or she is actually seen by a practitioner).

* Default an Encounter end as 23:59 on the date of the Encounter date
if it is left open to allow completion of documentation and update
the end time if the practitioner closing the chart enters a specific
time that the encounter ended.

Undoubtedly, other clinical sites have implemented other solutions to
documenting end times for ambulatory visits. Quality measure and
clinical decision support (CDS) artifact authors should consider such
issues when testing the validity and reliability of retrieved responses
to data queries.

#### 8.11.2 Encounter-Related Diagnoses and Procedures

Encounter.diagnosis refers to the list of diagnosis/diagnoses relevant
to the encounter. The [Encounter.diagnosis.use
value](http://hl7.org/fhir/R4/valueset-diagnosis-role.html)
differentiates if the diagnosis is the admission diagnosis (AD), the
discharge diagnosis (DD), the chief complaint (CC), a comorbidity
diagnosis (CM), a pre-op diagnosis (pre-op), a post-op diagnosis
(post-op) or a billing diagnosis (billing).

Some quality measures used to evaluate care provided in hospital
settings use concepts to define *principal diagnosis* and *present on
admission*:

* *Principal diagnosis* is defined as the condition that, after study,
was determined to be the principal cause of the admission. QDM
version 5.5 addresses that concept using the US Core concepts
Encounter.diagnosis.use value=*billing* with an *diagnosis.rank=1.*

* *Present on admission* (POA) is an indicator assigned to Inpatient
Encounter diagnoses and is used in quality and patient safety
measures. QDM version 5.5 references this indicator as a component
of each Encounter, Performed *diagnosis* The US Core and FHIR
Encounter resources do not address *present on admission.* However,
the [FHIR Claim](http://hl7.org/fhir/claim.html) resource includes a
[claim.diagnosis.onAdmission](http://hl7.org/fhir/claim-definitions.html#Claim.diagnosis.onAdmission)
element referencing [similar terms](http://hl7.org/fhir/valueset-ex-diagnosis-on-admission.html)
as the US UB-04 claim form to indicate *present on admission* – yes
(y), no (n), unknown (u), and undetermined (w). QI-Core includes an
extension on Encounter.diagnosis to reference the onAdmission
element, thus enabling specification of an Encounter.diagnosis that
is present on admission.

* *Principal procedure* is the procedure performed for definitive
treatment rather than diagnostic or exploratory purposes, or which
is necessary to take care of a complication.    
\[<https://manual.jointcommission.org/releases/TJC2015B/DataElem0685.html>\] *Principal procedure* defines a procedures relationship to an encounter
(most often an inpatient encounter). It has not relationship to the
inherent nature of the procedure. Therefore, QI-Core includes an
extension modeling Encounter.procedure in the same way as
Encounter.diagnosis. The Encounter.procedure has a *code* to indicate
the procedure code and a *rank* to indicate its ordinality such that
*rank*=1 identifies the procedure as a *principal procedure.*

* *Elective procedure* is another concept used in quality measurement,
especially in hospital measures. A specific measure may have
interest in evaluating care provided for elective procedures (e.g.,
hip surgery due to osteoarthritis) while excluding emergency,
non-planned procedures (e.g., hip surgery due to acute fracture).
The procedure code does not necessarily allow differentiation of the
two concepts. A ServiceRequest.priority does have the ability to
differentiate the urgency with which the *request* (or order) should
be fulfilled. However, there is no element within the FHIR Procedure
resource to address the issue. Encounter.priority allows
specification of whether the encounter is elective. Since the
Encounter.procedure can be linked to the ServiceRequest with its
priority, there is no need to add a specific extension in QI-Core
for Encounter.procedure.priority. Therefore, there is no direct
mapping from the QDM Procedure priority attribute to QI-Core and
measures considering the concept should reference QDM's Encounter,
Order with its priority.

#### 8.11.3 Encounter, Order

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Encounter, Order**                                              | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Facility Location                                                 | [ServiceRequest.locationCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.locationCode)                       |                                                              |
| Priority                                                          | [ServiceRequest.modifierExtension:isElective](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.modifierExtension:isElective)|      |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.11.3.1 Negation Rationale for Encounter, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

#### 8.11.4 Encounter, Performed

| **QDM Context**                    | **QI-Core R4**  | **Comments**  |
| ---------------------------------- | --------------- | ------------- |
| **Encounter, Performed**           | [Encounter](StructureDefinition-qicore-encounter.html)                 |                                                                                             |
|                                    | [Encounter.status](StructureDefinition-qicore-encounter-definitions.html#Encounter.status)           | consider constraint to - arrived, triaged, in-progress, on-leave, finished                                                                                             |
| **QDM Attribute**                  |                                               |                                                                                             |
| Code                               | [Encounter.type](StructureDefinition-qicore-encounter-definitions.html#Encounter.type)             | type of service by CPT                                                                                      |
| id                                 | [Encounter.id](StructureDefinition-qicore-encounter-definitions.html#Encounter.id)                   |                                                                                             |
| Relevant Period                    | [Encounter.period](StructureDefinition-qicore-encounter-definitions.html#Encounter.period)           | start and end time of encounter                                                                                      |
| Diagnoses                          |                                               |                                                                                             |
| Diagnosis (code)                   | [Encounter.diagnosis.condition](StructureDefinition-qicore-encounter-definitions.html#Encounter.diagnosis.condition)          | can be used for coded diagnoses                                                                                      |
| PresentOnAdmissionIndicator (code) |                                               |                                                                                             |
| Rank (Integer)                     | [Encounter.diagnosis.rank](StructureDefinition-qicore-encounter-definitions.html#Encounter.diagnosis.rank)                    | for each diagnosis role                                                                                              |
| Procedures                         | [qicore-encounter-procedure](StructureDefinition-qicore-encounter-procedure.html)                                              | QIcore-encounter-procedure                                                                  |
|                                    | [Encounter.extension.procedure.value\[x\]](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:procedure.value[x])                                                |References the procedure code                                                                                             |
|                                    | [Encounter.extension:rank.value\[x\]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])                                           |References the rank; for principal procedure, the rank =1                              |                                                                                             |
|                                    | [Encounter.procedure.procedure](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:procedure)                                               |A reference to the procedure that was performed                                                                                             |
| Length of Stay                     | [Encounter.length](StructureDefinition-qicore-encounter-definitions.html#Encounter.length)           |                                                                                             |
| Negation Rationale                 | Not Addressed                                 |   There is no current use case for an eCQM to request a reason for failure to perform an encounter.                |
| Author dateTime                    | Not Addressed                                 |                                                                                             |
| Admission Source                   | [Encounter.hospitalization.admitSource](StructureDefinition-qicore-encounter-definitions.html#Encounter.hospitalization.admitSource)                   |                                                                                             |
| Discharge Disposition              | [Encounter.hospitalization.dischargeDisposition](StructureDefinition-qicore-encounter-definitions.html#Encounter.hospitalization.dischargeDisposition) | E.g., home, hospice, long-term care, etc.                                                                            |
|                                    | Encounter.hospitalizaton.destination                                   |                                                                                             |
| Facility Locations                 |                                               |                                                                                             |
| code                               | [Encounter.location.location](StructureDefinition-qicore-encounter-definitions.html#Encounter.location.location)              |                                                                                             |
| location period                    | [Encounter.location.period](StructureDefinition-qicore-encounter-definitions.html#Encounter.location.period)                  |                                                                                             |
| Participant                        | [Encounter.participant.individual](StructureDefinition-qicore-encounter-definitions.html#Encounter.participant.individual)    |                                                                                             |
|                                    |[Encounter.serviceProvider](StructureDefinition-qicore-encounter-definitions.html#Encounter.serviceProvider)|Encounter.serviceProvider identifies the organization that is primarily responsible for the Encounter’s services. |
{: .grid}

#### 8.11.5 Encounter, Recommended

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Encounter, Recommended**                                        | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Facility Location                                                 | [ServiceRequest.locationCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.locationCode)                       |                                                              |
| Priority                                                          | [ServiceRequest.modifierExtension:isElective](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.modifierExtension:isElective)|      |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.11.5.1 Negation Rationale for Encounter, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

### 8.12 Family History

QDM defines Family History as a diagnosis or problem experienced by a
family member of the patient. Typically, a family history will not
contain very much detail, but the simple identification of a diagnosis
or problem in the patient’s family history may be relevant to the care
of the patient.

| **QDM Context**    | **QI-Core R4**                                                                                                                                                                        | **Comments**                    |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **Family History** | [FamilyMemberHistory](StructureDefinition-qicore-familymemberhistory.html)                                                                                   |                                 |
|                    | [FamilyMemberHistory.status](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.status)                 | Constrain to partial, completed |
| **QDM Attributes** |                                                                                                                                                                                       |                                 |
| code               | [FamilyMemberHistory.condition.code](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.condition.code) |                                 |
| id                 | [FamilyMemberHistory.id](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.id)                         |                                 |
| Author dateTime    | [FamilyMemberHistory.date](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.date)                     |                                 |
| relationship       | [FamilyMemberHistory.relationship](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.relationship)     |                                 |
| recorder           | N/A                                                                                                                                                                                   |                                 |
{: .grid}

### 8.13 Immunization

QDM defines Immunization as vaccines administered to patients in
healthcare settings but does not include non-vaccine agents. The [FHIR
Immunization
Recommendation](http://hl7.org/fhir/immunizationrecommendation.html)
resource is specifically designed to provide an immunization forecast
from a forecasting engine to a provider, basically to carry clinical
decision support recommendations specific to immunizations and,
therefore, is not consistent with the intent of the QDM datatype
"Immunization, Order" or "Immunization, Administered." The FHIR
[Immunization
Evaluation](http://hl7.org/fhir/immunizationevaluation.html) references
an appraisal of an immunization that was administered to determine if it
is valid with respect to the expected immunization schedule. The
[US Core
Immunization](http://hl7.org/fhir/us/core/StructureDefinition-us-core-immunization.html)
profile is most consistent with the QDM datatype *Immunization,
Administered*.  The mapping tables provided include mapping from QDM
*Immunization, Administered* and a reference to the FHIR [Immunization
Evaluation](http://hl7.org/fhir/immunizationevaluation.html) resource.
Note, the mapping table includes additional metadata about immunizations
that QDM does not address, but that may be relevant to quality measures
or clinical decision support (CDS) artifacts.

#### 8.13.1 Immunization, Administered

| **QDM Context**                | **US Core R4**                                                                                                                                                    | **Comments**                                       |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| **Immunization, Administered** | [Immunization](StructureDefinition-qicore-immunization.html)                                                                            |                                                    |
|                                | [Immunization.status](StructureDefinition-qicore-immunization-definitions.html#Immunization.status)                 | Constrain to Completed, entered-in-error, not-done |
| **QDM Attributes**             |                                                                                                                                                                  |                                                    |
| code                           | [Immunization.vaccineCode](StructureDefinition-qicore-immunization-definitions.html#Immunization.vaccineCode)       |                                                    |
| id                             | [Immunization.id](StructureDefinition-qicore-immunization-definitions.html#Immunization.id)                         |                                                    |
| Dosage                         | [Immunization.doseQuantity](StructureDefinition-qicore-immunization-definitions.html#Immunization.doseQuantity)     |                                                    |
| Negation Rationale              | See Below |
| Route                          | [Immunization.route](StructureDefinition-qicore-immunization-definitions.html#Immunization.route)                   |                                                    |
| Reason                         | [Immunization.reasonCode](StructureDefinition-qicore-immunization-definitions.html#Immunization.reasonCode)         |                                                    |
| Relevant dateTime              | [Immunization.occurrence\[x\]](StructureDefinition-qicore-immunization-definitions.html#Immunization.occurrence[x]) |                                                    |
| author dateTime                | [Immunization.recorded](StructureDefinition-qicore-immunization-definitions.html#Immunization.recorded)             |                                                    |
| Performer                      | [Immunization.performer.actor](StructureDefinition-qicore-immunization-definitions.html#Immunization.performer)     |                                                    |
{: .grid}

##### 8.13.1.1 Immunization, Administered

Use [QICoreMedicationNotRequested](StructureDefinition-qicore-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - Value Boolean fixed to "true"
* [MedicationRequest.status](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.status) - Fixed as "completed"
* [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - When this was made available
* [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x]) - Use [MedicationRequest.medication\[x\].coding.extension:notDoneValueSet](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x].coding.extension:notDoneValueSet) to indicate the specific MedicationRequest that was not performed

#### 8.13.2 Immunization, Order

This QDM context references the QI-Core MedicationRequest profile as
there is no other FHIR resource to reference an order for an
immunization. The mapping uses the QI-Core MedicationRequest resource
with the MedicationRequest.intent = *order* and
MedicationRequest.setting set to the setting most appropriate for the
intended meaning of the quality measure or clinical decision support
(CDS) expression.

| **QDM Context**         | **QI-Core R4**                                                                                                                                                                                                                  | **Comments**                                                                                                                                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Immunization, Order** | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                                                             |                                                                                                                                                                                          |
|                         | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                 | Constrain to active, completed, on-hold                                                                                                                                                  |
|                         | [MedicationRequest.statusReason](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.statusReason)                                                     | The reason for ordering or not ordering the medication                                                                                                                                   |
|                         | [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                                 | Constrain to "order" for Medication, Order - note that QDM does not include Medication, Recommended - should that concept be desired, use MedicationRequest.intent constrained to "plan" |
| **QDM Attributes**      |                                                                                                                                                                                    |                                                                                                                                                                                          |
| code                    | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                 | RxNorm                                                                                                                                                                                   |
| id                      | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                         |                                                                                                                                                                                          |
| active dateTime         | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period    | QDM defines active dateTime as when the order indicates the first immunization administration should occur. Active dateTime is most often used to specify immunizations for which administration is intended at a specific time in the future. FHIR allows specification of the period during which the immunization should occur (start dateTime to end dateTime)                                                                                                                                                                                         |
| author dateTime         | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                         |                                                                                                                                                                                          |
| dosage                  | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Range, quantity                                                                                                                                                                          |
| route                   | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest.html#MedicationRequest.dosageInstruction.route)                                           |                                                                                                                                                                                          |
| reason                  | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| supply                  | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)                             | Amount to be dispensed in one fill                                                                                                                                                       |
| Negation Rationale      | See Below |
|                         | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication.                                                                                                                                  |
| Requester               | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           | Note - MedicationRequest.performer indicates the performer expected to administer the medication                                                                                         |
{: .grid}

##### 8.13.2.1 Negation Rationale for Immunization, Order

Use [QICoreMedicationNotRequested](StructureDefinition-qicore-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - Value Boolean fixed to "true"
* [MedicationRequest.status](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.status) - Fixed as "completed"
* [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - When this was made available
* [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x]) - Use [MedicationRequest.medication\[x\].coding.extension:notDoneValueSet](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x].coding.extension:notDoneValueSet) to indicate the specific MedicationRequest that was not performed

### 8.14 Individual Characteristics

QDM’s approach to defining information about participants In the
healthcare process by defining Individual Characteristics. These
properties of a patient, clinician, provider, or facility include
demographics, behavioral factors, social or cultural factors, available
resources, and preferences. Behaviors reference responses or actions
that affect (either positively or negatively) health or healthcare.
Included in this category are mental health issues, adherence issues
unrelated to other factors or resources, coping ability, grief issues,
and substance use/abuse. Social/cultural factors are characteristics of
an individual related to family/caregiver support, education, and
literacy (including health literacy), primary language, cultural beliefs
(including health beliefs), persistent life stressors, spiritual and
religious beliefs, immigration status, and history of abuse or neglect.
Resources are means available to a patient to meet health and healthcare
needs, which might include caregiver support, insurance coverage,
financial resources, and community resources to which the patient is
already connected and from which the patient is receiving benefit.
Preferences are choices made by patients and their caregivers relative
to options for care or treatment (including scheduling, care experience,
and meeting of personal health goals) and the sharing and disclosure of
their health information.

FHIR more effectively represents these concepts in the Level 3
Administration Module – base data that is linked into other modules for
clinical content, finance/billing, workflow, etc. The Administration
Module specifies information about the patient, related person,
practitioner and organization that is the basis of healthcare-related
interactions such as encounters. QDM version 5.5 adopted a similar
approach to such information by adding a new concept called *Entities.
Entities*  represent concepts that can be used to specify details about
an actor (or performer) participant in any activity represented by a QDM
datatype. These *entities* are analogous to the FHIR resources *Patient,
RelatedPerson, Practitioner,* and *Organization,* respectively called
*Patient, CarePartner, Practitioner* and *Organization* in QDM. The
mapping tables show these direct relationships to FHIR resources.
However, to maintain backward compatibility with prior QDM versions, QDM
5.5 retains the concept of Patient Characteristics for some metadata
about a patient; most of these characteristics map directly to metadata
elements in the FHIR Patient resource. QDM 5.5 removed the Provider
Characteristics QDM *datatype* in favor of the Practitioner and
Organization entities since there had been little, if any, use of these
QDM elements.

Accommodating patient-related metadata requires QI-Core extensions for
several elements including:

  - Clinical Trial – Patients may be excluded from some quality measures
    or clinical decision support (CDS) workflows if they are
    participating in clinical trials. It is often necessary to determine
    the nature of the trial as exclusions may only apply if the clinical
    trial addresses the same clinical condition as the measure or CDS
    artifact, or if treatments potentially used in the clinical trial or
    the measure or CDS intervention conflict.

QDM 5.5 also added a new QDM *datatype Related Person* to allow
reference to an individual who has a personal or non-healthcare-specific
professional relationship with a patient. Modeled the same as the
*CarePartner* entity, the *Related Person* is an individual from whose
record clinical information should be retrieved to support care provided
to the index patient. 

  - Example 1: An infant’s gestational age at the time of birth may be
    calculated as the difference between the days between the mother’s
    estimated date of delivery (EDD) and the actual birth date. The
    mother’s EDD might be entered directly on the infant’s record as an
    observable entity about a *Related Person* (the infant’s mother).
    Alternatively, a cross-context query might request the information
    from the *Related Person’s* (mother’s) record.

  - Example 2: An organ recipient risk factor may include a donor’s
    positive Hepatitis C antibody result. The result relates to the
    donor (Related Person) whether that result is present on the
    recipient’s record or if the a cross-context query to the donor’s
    record retrieves the information.

#### 8.14.1 QDM Entities

| **QDM Entities & Attributes** | **QI-Core R4**                                                                                                                                                                      | **Comment**    |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| **Patient**                   | [Patient](StructureDefinition-qicore-patient.html)                                                                                                         |                |
| identifier                    | [Patient.identifier.value](StructureDefinition-qicore-patient-definitions.html#Patient.identifier.value)                                           |                |
| id                            | [Patient.id](StructureDefinition-qicore-patient-definitions.html#Patient.id)                                                           |                |
| **Care Partner**              | [RelatedPerson](StructureDefinition-qicore-relatedperson.html)                                                                                             | Related Person |
| identifier                    | [RelatedPerson.identifier](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.identifier)                         |                |
| id                            | [RelatedPerson.id](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.id)                                         |                |
| relationship                  | [RelatedPerson.relationship](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.relationship)                     |                |
| **Practitioner**              | [Practitioner](StructureDefinition-qicore-practitioner.html)                                                                                               |                |
| identifier                    | [Practitioner.identifier.value](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.identifier.value)        |                |
| id                            | [Practitioner.id](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.id)                                            |                |
| role                          | [PractitionerRole.code:code](StructureDefinition-qicore-practitionerrole-definitions.html#PractitionerRole.code:code)                                                                                      |                |
| specialty                     | [PractitionerRole.specialty:specialty](StructureDefinition-qicore-practitionerrole-definitions.html#PractitionerRole.specialty:specialty)            |                |
| qualification                 | [Practitioner.qualification.code](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.qualification.code) |                |
| **Organization**              | [Organization](StructureDefinition-qicore-organization.html)                                                                                               |                |
| identifier                    | [Organization.identifier.value](StructureDefinition-qicore-organization-definitions.html#Organization.identifier.value)                |                |
| id                            | [Organization.id](StructureDefinition-qicore-organization-definitions.html#Organization.id)                                            |                |
| type                          | [Organization.type](StructureDefinition-qicore-organization-definitions.html#Organization.type)                             |                |
{: .grid}

#### 8.14.2 Patient Characteristics

| **QDM Attribute**                    | **US Core R4**                                                                                                                                                                   | **Comments**                                                                                                    |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| **Race**                             |                                                                                                                                                                                 | See US CoreRaceExtension for details                                                                                                                |
| code                                 | [Patient.extension:race](StructureDefinition-qicore-patient-definitions.html#Patient.extension:race)                                         |                                                                                                                 |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| **Ethnicity**                        |                                                                                                                                                                                 |                                                                                                                 |
| code                                 | [Patient.extention:ethnicity](StructureDefinition-qicore-patient-definitions.html#Patient.extension:ethnicity)                               | See US CoreEthnicityExtension for details                                                                                                                |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| **Sex**                              |                                                                                                                                                                                 |                                                                                                                 |
| code                                 | [Patient.extension:birthsex](StructureDefinition-qicore-patient-definitions.html#Patient.extension:birthsex)                                 |                                                                                                                 |
| code                                 | [Patient.gender](StructureDefinition-qicore-patient-definitions.html#Patient.gender)                                 | Administrative Gender                                                                                           |
| id                                   |                                                                                                                                                |                                                                                                                 |
| **Birthdate**                        |                                                                                                                                                |                                                                                                                 |
| Birth dateTime                       | [Patient.birthdate](StructureDefinition-qicore-patient-definitions.html#Patient.birthDate)                                         | Fixed code 21112-8                                                                                                                |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| **Clinical Trial Participant**       |                                                                                                                                                                                 | Clinical Trial Participant should be handled as an Observation (i.e., Assessment, Performed) in QDM rather than a Patient Characteristic                                                                                                                |
| **Expired**                          |                                                                                                                                                                                 |                                                                                                                 |
| code                                 | [Patient.deceased\[x\] boolean](StructureDefinition-qicore-patient-definitions.html#Patient.deceased[x])                                   |                                                                                                                 |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| cause                                |                                                                                                                                                                                 | Expiration cause requires use of Observation                                                                    |
| expiration dateTime                  | [Patient.deceased\[x\] dateTime](StructureDefinition-qicore-patient-definitions.html#Patient.deceased[x])                                                                       |                                                               |
| **Payer**                            | [Coverage](StructureDefinition-qicore-coverage.html)                                                                                                                          |                                                                                                                 |
| code                                 | [Coverage.payor](StructureDefinition-qicore-coverage-definitions.html#Coverage.payor)                                              | QI-Core currently maps to policy holder which actually references the person who owns the policy, not the payor. |
| Relevant Period                      | [Coverage.period](StructureDefinition-qicore-coverage-definitions.html#Coverage.period)                                            |                                                                                                                 |
| id                                   | [Coverage.id](StructureDefinition-qicore-coverage-definitions.html#Coverage.id)                                                    |                                                                                                                 |
| **Patient Characteristic (generic)** |                                                                                                                                                                                 |                                                                                                                 |
| N/A                                  |                                                                                                                                                                                 | Requires definition for modeling a characteristic to QI-Core and FHIR                                           |
{: .grid}

#### 8.14.3 QDM new *datatype* (QDM v5.5) - Related Person

| **QDM Attribute**             | **QI-Core R4**                                                                                                                                                  | **Comments** |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **Related Person**            | [RelatedPerson](StructureDefinition-qicore-relatedperson.html)                                                                                                  |              |
| identifier                    | [RelatedPerson.identifier](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.identifier)     |              |
| id                            | [RelatedPerson.id](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.id)                     |              |
| linkedPatientId               | N/A                                                                                                                               | Not present in QI-Core    |
| code                          | [RelatedPerson.relationship](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.relationship) |              |
{: .grid}

### 8.15 Intervention

QDM defines Intervention as a course of action intended to achieve a result in
the care of persons with health problems that does not involve
direct physical contact with a patient. Examples include patient
education and therapeutic communication.

#### 8.15.1 Procedure Vs Intervention

FHIR references both of these concepts using the *Procedure* resource,
specifically noting a process that involves verification of the
patient's comprehension or to change the patient's mental state would be
a Procedure. Therefore, both QDM *datatypes*, Procedure and Intervention
are included in this section of the QDM to QI-Core mapping especially
since all of the QDM attributes for each of these QDM *datatypes* are
identical.

#### 8.15.2 Intervention, Performed

| **QDM Context**         | **QI-Core R4**                                              | **Comments**                   |
| ----------------------- | ----------------------------------------------------------- | ------------------------------ |
| **Intervention, Performed** | [Procedure](StructureDefinition-qicore-procedure.html)                   |                                                                                                           |
|                         | [Procedure.category](StructureDefinition-qicore-procedure-definitions.html#Procedure.category)        | Helps differentiate "intervention" from "procedure"                      |
| **QDM Attributes**      |                                             |                                                                                                           |
| status                  | [Procedure.status](StructureDefinition-qicore-procedure-definitions.html#Procedure.status)            | constrain to "completed"                                                                                                               |
| Code                    | [Procedure.code](StructureDefinition-qicore-procedure-definitions.html#Procedure.code)                |                                                                                                           |
| id                      | [Procedure.id](StructureDefinition-qicore-procedure-definitions.html#Procedure.id)                    |                                                                                                           |
|                         |[Procedure.basedOn](StructureDefinition-qicore-procedure-definitions.html#Procedure.basedOn)|A reference to a resource that contains details of the request for this procedure.
| Method                  | N/A                            | Procedure.method does not exist in FHIR. Rather than create an extension, QI-Core's approach is to assume the Procedure.code includes reference to the method.                                                                                             |
| Rank                    | [Encounter.extension.extension:rank.value\[x\]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])                                | Referenced as attributes of Encounter ([Encounter.extension.extension:rank.value[x]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])). |
| Priority                | [qicore-encounter-procedure](StructureDefinition-qicore-encounter-procedure.html)      | This QDM attribute is intended to reference elective from non-elective procedures.<br/><br/>QI-Core references procedure.priority based on the relationship of the procedure to the Encounter; hence, Encounter.procedure (which is an extension). <br/><br/>The elective nature of a procedure can also be referenced based on the elective nature of an Encounter ([Encounter.priority](StructureDefinition-qicore-encounter-definitions.html#Encounter.priority)) for which the respective procedure is a principal procedure.<br/><br/>The concept may also be addressed as an Encounter, Order or Procedure, Order (both using [ServiceRequest](StructureDefinition-qicore-servicerequest.html)) and [ServiceRequest.priority](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.priority).                     |
| Anatomical Location Site                             | [Procedure.bodySite](StructureDefinition-qicore-procedure-definitions.html#Procedure.bodySite)        |                                                                                                           |
| Reason                  | [Procedure.reasonCode](StructureDefinition-qicore-procedure-definitions.html#Procedure.reasonCode)                                 |                                                                                                           |
| Result                  | [Observation](StructureDefinition-qicore-observation.html) that includes the element [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.           | [Procedure.report](StructureDefinition-qicore-procedure-definitions.html#Procedure.report) references [DiagnosticReport-note](StructureDefinition-qicore-diagnosticreport-note.html), DocumentReference, Composition (histology result, pathology report, surgical report, etc.); the latter two are not QI-Core resources. However, based on feedback regarding the use of the [Observation](StructureDefinition-qicore-observation.html) resource, a procedure result might be better referenced as an [Observation](StructureDefinition-qicore-observation.html) that includes the element [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.  |
|                         | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)      |Reference to a resource that contains details of the request for this procedure.                                                                                                           |
| Negation Rationale              | See Below |
| Relevant dateTime       | [Procedure.performed\[x\] dateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                  |                                                                                                           |
| Relevant Period         | [Procedure.performed\[x\] Period](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                    |                                                                                                           |
| Incision dateTime       | [Procedure.extension:incisionDateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.extension:incisionDateTime) |                                                                                                           |
| Author dateTime         | N/A   | The concept "author" requires a reference to a report about the procedure or about an indication the procedure was not performed. Therefore, the procedure resource does not have a reference to author dateTime. Author dateTime can reference a report about the procedure or an observation describing that result (e.g., Observation with metadata Observation.partOf procedure). However, Procedure.statusReason needs to address a dateTime that it is recorded.   |
| Components              | N/A                            | Procedure does not include components and the concept of components references a observation that is a result of the procedure ([Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)) for which that observation has components consistent with the Observation component modeling recommendation in FHIR.                                                                          |
| Component code          | N/A                            | N/A                                                                                                       |
| Component result        | N/A                            | N/A                                                                                                       |
| Performer               | [Procedure.performer.actor](StructureDefinition-qicore-procedure-definitions.html#Procedure.performer.actor)      |                                                                                                           |
{: .grid}

##### 8.15.2.1 Negation Rationale for Intervention, Performed

Use [QICoreProcedureNotDone](StructureDefinition-qicore-procedurenotdone.html), which contains:
* [Procedure.status](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.status) - Fixed as "not-done"
* [Procedure.statusReason](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Procedure.extension:recorded](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.extension:recorded) - When this was made available
* [Procedure.code](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.code) - Use [Procedure.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.code.coding.extension:notDoneValueSet) to indicate the specific Procedure that was not performed

#### 8.15.3 Intervention, Order

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Intervention, Order**                                           | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.15.3.1 Negation Rationale for Intervention, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

#### 8.15.4 Intervention, Recommended

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Intervention, Recommended**                                     | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.15.4.1 Negation Rationale for Intervention, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

### 8.16 Laboratory Test

#### 8.16.1 Laboratory Test, Order

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Laboratory Test, Order**                                        | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.16.1.1 Negation Rationale for Laboratory Test, Performed

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

#### 8.16.2 Laboratory Test, Performed

QDM defines Laboratory Test as a medical procedure that involves testing
a sample of blood, urine, or other body fluids or specimens. Tests can
help determine a diagnosis, plan treatment, check to see if treatment is
working, or monitor the disease over time. This QDM data category for
Laboratory Test is only used for information about the subject of
record.

Thus far, consensus opinion suggests that the US Core Observation-Lab
Profile best fits the laboratory test use case for querying clinical
data to retrieve information about the event and/or the result of the
study. Individual studies may use the US Core DiagnosticReport-lab
(<http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html>)
to provide information about an individual laboratory test although some
have considered use of other reporting resources and artifacts. Each
laboratory test may be ordered individually or in a panel. Many use
panels for convenience for ordering laboratory tests. Since new
laboratory panels regularly become available and the myriad of potential
laboratory panels available, a complete list cannot be assured.
Therefore, a quality measure or clinical decision support (CDS)
artifacts seeking a specific result value should use the US Core
Observation-Lab profile to request a retrieve of the result value
desired. This practice will enable implementers to determine which is
the best source for the desired observation. LOINC observable entities
may indicate specific methods for determination of results. Measure and
CDS developers can reference direct reference codes or value sets using
the such LOINC codes to specify the type of testing considered
acceptable to provide sufficient fidelity to their requests.

| **QDM Context**    | **US Core R4**           | **US Core R3 Observation-Lab**                  |**Comments**                           |
| ------------------ | ----------------------- | ----------------------------------------------- | ------------------------------------- |
| **Laboratory Test, Performed** | Observation-lab         | [Observation-Lab](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html)               |                            |
|         | Observation.status      | [Observation.status](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.status)     | Constrain status to -  final, amended, corrected                          |
| **QDM Attribute**  |             |                  |                            |
| code   | Observation.code        | [Observation.code](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.code)         |                            |
| id     | Observation.id          | [Observation.id](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.id)             |                            |
| method             | Observation.method      | [Observation.method](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.method)     |                            |
|        | Observation.bodySite    | [Observation.bodySite](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.bodySite)             |                            |
| Negation Rationale  | See Below |
| reason             | Observation.basedOn     | [Observation.basedOn](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.basedOn)   | the observation fulfills a plan, proposal or order - trace for authorization. Possibly not a fit for the intent in QDM (e.g., observation "reason" = a diagnosis)  Is an extension needed?         |
| result             | value\[x\]              | [Observation.value\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])           |                            |
|        | Observation.interpretation          | [Observation.interpretation](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])       |                            |
|        | Observation.specimen    | [Observation.specimen](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])             |                            |
| result dateTime    | Observation.issued      | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])   |                            |
| Relevant dateTime  | Observation.effective\[x\] dateTime             | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.effective[x])   |                            |
| Relevant Period    | Observation.effective\[x\] Period   | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.effective[x])   |                            |
| Status             | Observation.status      | [Observation.status](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.status)     | Constrain status to -  final, amended, corrected               |
| Author dateTime    | Observation.issued      | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.issued)     | Issued - the date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified. Consider if QI-Core should include an extension to manage timing of the dataAbsentReason. |
| Reference Range High           | Observation.referenceRange.high     | [Observation.referenceRange.high](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.referenceRange.high)   |                            |
| Reference Range Low            | Observation.referenceRange.low      | [Observation.referenceRange.low](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.referenceRange.low)     |                            |
| Component          | Observation.component   | [Observation.component](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.effective[x])        |                            |
|        | Observation.Component.id            | [Observation.component.id](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.id)     |                            |
| Component code     | Observation.component.code          | [Observation.component.code](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.code)             |                            |
| Component result   | Observation.component.value\[x\]    | [Observation.component.value\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.value[x])   |                            |
|        | Observation.component.interpretation            | [Observation.component.interpretation](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.interpretation)     |                            |
|        | Observation.component.dataAbsentReason          | [Observation.component.dataAbsentReason](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.dataAbsentReason) |                            |
| Component reference range high | Observaton.component.referenceRange             | [Observation.component.referenceRange](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.referenceRange)     |                            |
| Component reference range low  | Observation.component.referenceRange            | [Observation.component.referenceRange](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.referenceRange)     |                            |
| Performer          | Observation.performer   | [Observation.performer](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.performer)           |                            |
{: .grid}

##### 8.16.2.1 Negation Rationale for Laboratory Test, Performed

Use [QICoreObservationNotDone](StructureDefinition-qicore-observationnotdone.html), which contains:
* [Observation.modifierExtension:notDone](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.modifierExtension:notDone) - Value Boolean fixed to "true"
* [Observation.status](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.status) - Fixed as "final"
* [Observation.extension:notDoneReason](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Observation.issued](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.issued) - When this was made available
* [Observation.code](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.code) - Use [Observation.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.code.coding.extension:notDoneValueSet) to indicate the specific Observation that was not performed

#### 8.16.3 Laboratory Test, Recommended

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Laboratory Test, Recommended**                                  | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.16.3.1 Negation Rationale for Laboratory Test, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

### 8.17 Medication

QDM defines Medication as clinical drugs or chemical substances intended
for use in the medical diagnosis, cure, treatment, or prevention of
disease. Medications are defined as direct referenced values or value
sets containing values derived from code systems such as RxNorm. QDM
defines five contexts for Medication, each of which is listed below
referencing the US Core or FHIR resource which provides the expected
context:

#### 8.17.1 Medication, Active

This QDM context correlates with a medication on a patient’s active medication
list. In QI-Core STU3, Medication, Active was mapped to MedicationStatement.
However, consistent with US Core R4 Update, medication list should use
MedicationRequest and not MedicationStatement. The mapping table provides
guidance about how to use MedicationRequest.requester to specify medications
ordered directly, those reported by a physician and those reported by the
patient for a medication list.

The rationale is that the MedicationStatement.status allows use of both active
and not taken. That means there is no assurance the patient is actually taking
the medication. The MedicationRequest.intent should always be order even if the
medication is patient reported and the order is not processed as an
e-prescription. The reporter is specified as MedicationRequest.reported[x]
which is a reportedBoolean and uses reportedReference (patient, practitioner,
practitionerRole, relatedPerson, organization).

| **QDM Context**            | **QI-Core R4**                                                                                                                                                                                                                                   | **Comments**                                                                                                                                                  |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Active**     | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                                                                               |                                                                                                                                                               |
|                            | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                                   | Constrain to "active"                                                                                                                                         |
|                            | [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                                                   | Constrain to "order"                                                                                                                                                              |
|                            | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                                                               | inpatient, outpatient, community, patient-specified                                                                                                           |
| **QDM Attribute**          |                                                                                                                                                                                                                                                  |                                                                                                                                                               |
| code                       | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                               |                                                                                                                                                               |
| id                         | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                                           |                                                                                                                                                               |
| dosage                     | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x])                                                  | Amount of medication per dose                              |
| frequency                  | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)                                               |                                                     |
| route                      | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)                                                                       |                                                                                                                                                               |
|                            | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                                           |                                                                                                                                                               |
| relevant dateTime          | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime                                                        |                                                                                                                                                               |
| relevant period            | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period |                                                      |
|                            | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                                       | Author dateTime not referenced in QDM                                                                                                                         |
| recorder                   | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                   | To address all medications on a medication list, use MedicationRequest with status = active; intent = order; and requester = organization (for prescribed medications for which an order exists), practitioner (for medications entered by clinicians but not ordered), and patient or RelatedPerson (for patient/related person reported)|
{: .grid}

#### 8.17.2 Medication, Administered

This QDM context correlates with a record of a patient consuming or
otherwise being administered a medication. It references individual
medication administration events and, therefore, may not reference
frequency of administration. Note that a separate QDM and US Core
profile address Immunization, Administered.

| **QDM Context**              | **QI-Core R4**                                                                                                                                                                                             | **Comments**                                                            |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| **Medication, Administered** | [MedicationAdministration](StructureDefinition-qicore-medicationadministration.html)                                                                          |                                                                         |
|                              | [MedicationAdministration.status](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.status)                       | Constrain status to "In-progress" or "completed"                        |
|                              | [MedicationAdministration.category](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.category)                   | Allows specification of Inpatient, Outpatient, Community                |
| **QDM Attributes**           |                                                                                                                                                               |                                                                         |
| code                         | [MedicationAdministration.medication\[x\]](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.medication[x])       |ֵ Example uses SNOMED substance codes                                     |
| id                           | [MedicationAdministration.id](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.id)                               |                                                                         |
| dosage                       | [MedicationAdministration.dosage.dose](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.dosage.dose)             | Simple Quantity - Amount of medication for one administration           |
| route                        | [MedicationAdministration.dosage.route](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.dosage.route)           |                                                                         |
| frequency                    | [MedicationAdministration.request](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.request)                     | Reference to original MedicationRequest with content about prescription |
|                              | [MedicationAdministration.dosage.rate\[x\]](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.dosage.rate[x])     | Identifies the speed with which the medication was or will be introduced into the patient (e.g., infusion rate).                              |
|                              | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)        | Timing schedule (e.g., every 8 hours). [MedicationAdministration.request](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.request) provides reference to the applicable [MedicationRequest ](StructureDefinition-qicore-medicationrequest.html)for this information.                                    |
| reason                       | [MedicationAdministration.reasonCode](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.reasonCode)               | None, given as ordered, emergency                                       |
| relevant dateTime            | [MedicationAdministration.effective\[x\] dateTime](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.effective[x])|                                                                         |
| relevant Period              | [MedicationAdministration.effective\[x\] Period](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.effective[x])  |                                                                         |
| author dateTime              | N/A                                                                                                                                                              |                                                                         |
| Negation Rationale           | See Below |
| Performer                    | [MedicationAdministration.performer.actor](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.performer.actor)     |                                                                         |
{: .grid}

##### 8.17.2.1 Negation Rationale for Medication, Administered

Use [QICoreMedicationAdministrationNotDone](StructureDefinition-qicore-mednotadministered.html), which contains:
* [MedicationAdministration.status](StructureDefinition-qicore-mednotadministered-definitions.html#MedicationAdministration.status) - Fixed as "not-done"
* [MedicationAdministration.statusReason](StructureDefinition-qicore-mednotadministered-definitions.html#MedicationAdministration.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationAdministration.extension:recorded](StructureDefinition-qicore-mednotadministered-definitions.html#MedicationAdministration.extension:recorded) - When this was made available
* [MedicationAdministration.medication\[x\]](StructureDefinition-qicore-mednotadministered-definitions.html#MedicationAdministration.medication[x]) - Use [MedicationAdministration.medication\[x\].coding.extension:notDoneValueSet](StructureDefinition-qicore-mednotadministered-definitions.html#MedicationAdministration.medication[x].coding.extension:notDoneValueSet) to indicate the specific MedicationAdministration that was not performed

#### 8.17.3 Medication, Discharge

This QDM context specifically references the discharge medication list
provided to a patient at the time of discharge from an inpatient
setting. The list may include reference to new prescriptions sent to a
pharmacy for dispensing and self-administration after discharge. It may
also include over-the-counter medications and those medications already
present in the patient’s home for which new prescriptions are not
necessary.  The QDM Medication, Discharge concept is mapped to
MedicationRequest as a request to the patient to take the medication
with MedicationRequest.intent = *plan* and MedicationRequest.setting =
*discharge.*

MedicationRequest.intent should always be *order* even if the medication is
patient reported and the order is not processed as an e-prescription.
The reporter is specified as MedicationRequest.reported[x] which is a
reportedBoolean and uses reportedReference (patient, practitioner,
practitionerRole, relatedPerson, organization).

This change should also be used to reference the mapping from QDM Medication,
Order which can address order or recommended.

| **QDM Context**                        | **QI-Core R4**                                                                                                                                                                                                                  | **Comments**                                                                                                                                                                             |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Discharge**              | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                               |                                                                                                                                                                                          |
| Medication, Discharge active           | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                 | Constrain to active, completed, on-hold                                                                                                                                                  |
|                                        | [MedicationRequest.statusReason](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.statusReason)                                                     |                                                                                                                                                                                          |
| **QDM Attributes**                     |                                                                                                                                                                                                |                                                                                                                                                                                          |
| code                                   | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                 | RxNorm                                                                                                                                                                                   |
| id                                     | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                         |                                                                                                                                                                                          |
| dosage                                 | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Range, quantity                                                                                                                                                                          |
| supply                                 | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)                             | Amount to be dispensed in one fill                                                                                                                                                       |
| days supplied                          | [MedicationRequest.dispenseRequest.expectedSupplyDuration](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.expectedSupplyDuration) | Duration                                                                                                                                                                                 |
| frequency                              | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)                             | Timing schedule (e.g., every 8 hours)                                                                                                                                                    |
| refills                                | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) | Integer                                                                                                                                                                                  |
| route                                  | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)                               |                                                                                                                                                                                      |
| setting                                | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                                             | Constrain category to "Community"                                                                                                                   |
| reason                                 | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| relevant dateTime                      | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime                                                                         |                                               |
| relevant Period                        | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period   |                                                                                                                                                                                          |
| author dateTime                        | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                         |                                                                                                                                                                                          |
| Negation Rationale                     | See Below |
| Prescriber                             | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           | Note - MedicationRequest.performer indicates the performer expected to administer the medication                                                                                         |
{: .grid}

##### 8.17.3.1 Negation Rationale for Medication, Discharge

Use [QICoreMedicationNotRequested](StructureDefinition-qicore-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - Value Boolean fixed to "true"
* [MedicationRequest.status](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.status) - Fixed as "completed"
* [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - When this was made available
* [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x]) - Use [MedicationRequest.medication\[x\].coding.extension:notDoneValueSet](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x].coding.extension:notDoneValueSet) to indicate the specific MedicationRequest that was not performed

#### 8.17.4 Medication, Dispensed

This QDM context maps to the QI-Core MedicationDispense resource,
indicating information about medications that have been dispensed.

| **QDM Context**               | **QI-Core R4**                                                                                                                                                                                                                  | **Comments**                                                                                                                     |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Dispensed**     | [MedicationDispense](StructureDefinition-qicore-medicationdispense.html)                                                                                                           |                                                                                                                                  |
|                               | [MedicationDispense.status](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.status)                                                              | Constrain MedicationDispense.status to active, completed, on-hold                                                                |
| **QDM Attributes**            |                                                                                                                                                                                    |                                                                                                                                  |
| code                          | [MedicationDispense.medication\[x\]](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.medication[x])                                              |                                                                                                                                  |
| id                            | [MedicationDispense.id](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.id)                                                                      |                                                                                                                                  |
| dosage                        | [MedicationDispense.dosageInstruction](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction)                                        | ordered, calculated                                                                                                              |
| supply                        | [MedicationDispense.quantity](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.quantity)                                                          |                                                                                                                                  |
| days supplied                 | [MedicationDispense.daysSupply](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.daysSupply)                                                      |                                                                                                                                  |
| frequency                     | [MedicationDispense.dosageInstruction.timing](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction.timing)                          | See dosageInstruction                                                                                                            |
| refills                       | [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)                            | Reference authorizing prescription ([MedicationRequest](StructureDefinition-qicore-medicationrequest.html)) which contains Medication.Request.dispsenseRequest.numberOfRepeatsAllowed |
|                               | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) | Timing schedule (e.g., every 8 hours). [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription) provides reference to the applicable [MedicationRequest](StructureDefinition-qicore-medicationrequest.html) for this information.            |
| route                         | [MedicationDispense.dosageInstruction.route](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction.route)                            | See dosageInstruction                                                                                                            |
| setting                       | [MedicationDispense.category](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.category)                                                          | Inpatient, Outpatient, Community, Discharge                                                                                      |
| reason                        | [MedicationDispense.statusReason\[x\]](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.statusReason[x])                                          | The reason for ordering or not ordering the medication                                                                           |
| relevant dateTime             | [MedicationDispense.whenHandedOver](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.whenHandedOver)                                              | When provided to patient or representative                                                                                       |
| relevant Period               | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period     | The anticipated time from starting to stopping an ordered or dispensed medication can also be computed in an expression and derived from the duration attribute             |
| author dateTime               |                                                                                                                                                                                    |                                                                                                                                  |
| Negation Rationale            | See Below |
| Prescriber                    | [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)                            | Reference authorizing prescription (MedicationRequest) which contains Medication.Request.requester                               |
|                               | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           |                                                                                                                                  |
| Dispenser                     | [MedicationDispense.performer.actor](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.performer.actor)                                            |                                                                                                                                  |
{: .grid}

##### 8.17.4.1 Negation Rationale for Medication, Dispensed

Use [QICoreMedicationDispenseNotDone](StructureDefinition-qicore-medicationnotdispensed.html), which contains:
* [MedicationDispense.status](StructureDefinition-qicore-medicationnotdispensed-definitions.html#MedicationDispense.status) - Fixed as "declined"
* [MedicationDispense.statusReason\[x\]](StructureDefinition-qicore-medicationnotdispensed-definitions.html#MedicationDispense.statusReason[x]) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationDispense.extension:recorded](StructureDefinition-qicore-medicationnotdispensed-definitions.html#MedicationDispense.extension:recorded) - When this was made available
* [MedicationDispense.medication\[x\]](StructureDefinition-qicore-medicationnotdispensed-definitions.html#MedicationDispense.medication[x]) - Use [MedicationDispense.medication\[x\].coding.extension:notDoneValueSet](StructureDefinition-qicore-medicationnotdispensed-definitions.html#MedicationDispense.medication[x].coding.extension:notDoneValueSet) to indicate the specific MedicationDispense that was not performed

#### 8.17.5 Medication, Order

This QDM context references the QI-Core MedicationRequest resource with
MedicationRequest.intent = *order* and MedicationRequest.setting
as the most appropriate for the intended meaning of the quality
measure or clinical decision support (CDS) expression.

| **QDM Context**                        | **QI-Core R4**                                                                                                                                                                                                                  | **Comments**                                                                                                                                                                             |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Order**                  | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                               |                                                                                                                                                                                          |
| Medication, Order active               | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                 | Constrain to active, completed, on-hold                                                                                                                                                  |
|                                        | [MedicationRequest.statusReason](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.statusReason)                                                     |                                                                                                                                                                                          |
| Request context (order vs. recommended)| [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                                 | Constrain to "order" - note that QDM does not include Medication, Recommended - should that concept be desired, use [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent) constrained to "plan" |
| **QDM Attributes**                     |                                                                                                                                                                                                |                                                                                                                                                                                          |
| code                                   | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                 | RxNorm                                                                                                                                                                                   |
| id                                     | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                         |                                                                                                                                                                                          |
| dosage                                 | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Range, quantity                                                                                                                                                                          |
| supply                                 | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)                             | Amount to be dispensed in one fill                                                                                                                                                       |
| days supplied                          | [MedicationRequest.dispenseRequest.expectedSupplyDuration](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.expectedSupplyDuration) | Duration                                                                                                                                                                                 |
| frequency                              | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)                             | Timing schedule (e.g., every 8 hours)                                                                                                                                                    |
| refills                                | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) | Integer                                                                                                                                                                                  |
| route                                  | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)                                                                                                                                           |                                                                                                                                                                                          |
| setting                                | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                                             | Constrain category to: Inpatient, Outpatient, Community                                                                    |
| reason                                 | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| relevant dateTime                      | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime         |                                                                                                                                                                                          |
| relevant Period                        | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period     | The anticipated time from starting to stopping an ordered or dispensed medication can also be computed in an expression and derived from the duration attribute             |
| author dateTime                        | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                         |                                                                                                                                                                                          |
| Negation Rationale                     | See Below |
| Prescriber                             | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           | Note - MedicationRequest.performer indicates the performer expected to administer the medication                                                                                         |
{: .grid}

##### 8.17.5.1 Negation Rationale for Medication, Order

Use [QICoreMedicationNotRequested](StructureDefinition-qicore-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - Value Boolean fixed to "true"
* [MedicationRequest.status](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.status) - Fixed as "completed"
* [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - When this was made available
* [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x]) - Use [MedicationRequest.medication\[x\].coding.extension:notDoneValueSet](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x].coding.extension:notDoneValueSet) to indicate the specific MedicationRequest that was not performed


### 8.18 Participation

QDM defines Participation as a patient’s coverage by a program such as
an insurance or medical plan or a payment agreement. Such programs can
include patient-centered medical home, disease-specific programs, etc.
Definitions modeled similar to the FHIR R4
[Coverage](http://hl7.org/fhir/coverage.html) resource.

| **QDM Context**         | **QI-Core R4**                                                                                                                       | **Comments**          |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | --------------------- |
| **Participation**       | [Coverage](StructureDefinition-qicore-coverage.html)                                    |                       |
|                         | [Coverage.status](StructureDefinition-qicore-coverage-definitions.html#Coverage.status) | Constrain to "active" |
| **QDM Attributes**      |                                                                                                     |                       |
| code                    | [Coverage.type](StructureDefinition-qicore-coverage-definitions.html#Coverage.type)     |                       |
| id                      | [Coverage.id](StructureDefinition-qicore-coverage-definitions.html#Coverage.id)         |                       |
| Participation Period    | [Coverage.period](StructureDefinition-qicore-coverage-definitions.html#Coverage.period) |                       |
| Recorder                |                                                                                                                                      |                       |
{: .grid}

### 8.19 Physical Exam

QDM defines Physical Exam as the evaluation of the patient’s body and/or
mental status exam to determine its state of health. The techniques of
examination can include palpation (feeling with the hands or fingers),
percussion (tapping with the fingers), auscultation (listening), visual
inspection or observation, inquisition and smell. Measurements may
include vital signs (blood pressure, pulse, respiration) as well as
other clinical measures (such as expiratory flow rate and size of lesion).
Physical exam includes psychiatric examinations.

US Core defines a resources for vital signs (referencing the [FHIR Vital Signs Profile](http://hl7.org/fhir/R4/observation-vitalsigns.html))
and three additional profiles – [Pediatric-BMI-for Age](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age.html),
[Pediatric Weight for Height](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height.html)
and [Pulse Oximetry](http://hl7.org/fhir/us/core/StructureDefinition-us-core-pulse-oximetry.html). Other observations that meet the QDM
definition of Physical Exam, Performed use the FHIR Observation resource.

Note: QDM 5.5 removed the "method" attribute from "Physical Exam, Order" and
"Physical Exam, Recommended"

#### 8.19.1 Physical Exam, Order

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Physical Exam, Order**                                          | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Anatomical Location Site                                          | [ServiceRequest.bodySite](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.bodySite)                               |                                                              |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.19.1.1 Negation Rationale for Physical Exam, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

##### 8.19.1.2 Codes for Negation of Certain Physical Exam, Order

To capture specific types of "Physical Exam, Order" as QICoreObservationNotDone, use the following ServiceRequest.codes:

1.	Pediatric BMI for Age – 59576-9
1.	Pediatric Weight for Height – 77606-2
1.	Pulse Oximetry – 3151-8
1.	Vital Signs (panel) – 85353-1
1.	Vital Signs – Respiratory Rate – 9279-1
1.	Vital Signs – Heart Rate – 8867-4
1.	Vital Signs – Oxygen Saturation – 2708-6
1.	Vital Signs – Body Temperature – 8310-5
1.	Vital Signs – Body Height – 8302-2
1.	Vital Signs – Head Circumference – 9843-4
1.	Vital Signs – Body Weight – 29463-7
1.	Vital Signs – Body Mass Index (BMI) – 39156-5
1.	Vital Signs – Blood Pressure Systolic and Diastolic – 85354-9
1.	Vital Signs – Systolic Blood Pressure – 8480-6
1.	Vital Signs – Diastolic Blood Pressure – 8462-4

#### 8.19.2 Physical Exam, Performed

| **QDM Context**                        | **QI-Core R4**                                                                                                                                                                        | **Comments**                                                                                                                                                                                                                          |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Physical Exam, Performed - General** | [Observation](StructureDefinition-qicore-observation.html)                                                                               |                                                                                                                                                                                                                                       |
|                                        | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected                                                                                                                                                                                      |
|                                        | [Observation.category](StructureDefinition-qicore-observation-definitions.html#Observation.category)                                     | Constrain to "exam" \[Observations generated by physical exam findings including direct observations made by a clinician and use of simple instruments and the result of simple maneuvers performed directly on the patient's body.\] |
| **QDM Attributes**                     |                                                                                                                                          |                                                                                                                                                                                                                                       |
| code                                   | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                                             |                                                                                                                                                                                                                                       |
| id                                     | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                                 |                                                                                                                                                                                                                                       |
| Anatomical location site               | [Observation.bodySite](StructureDefinition-qicore-observation-definitions.html#Observation.bodySite)                                     |                                                                                                                                                                                                                                       |
| relatedTo                              | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | A plan, proposal or order that is fulfilled in whole or in part by this event. For example, a MedicationRequest may require a patient to have laboratory test performed before it is dispensed.                                       |
|                                        | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)                                         | A larger event of which this particular Observation is a component or step. For example, an observation as part of a procedure.                                                                                                       |
| Negation Rationale              | See Below |
| reason                                 | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | the observation fulfills a plan, proposal or order - trace for authorization. Possibly not a fit for the intent in QDM (e.g., observation "reason" = a diagnosis)  Is an extension needed?                                            |
| result                                 | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])                                   |                                                                                                                                                                                                                                       |
|                                        | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation)                         |                                                                                                                                                                                                                                       |
| Relevant dateTime                      | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                  |                                                                                                                                                                                                                                       |
| Relevant Period                        | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                    |                                                                                                                                                                                                                                       |
| Author dateTime                        | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         |                                                                                                                                                                                                                                       |
| Component                              | [Observation.component](StructureDefinition-qicore-observation-definitions.html#Observation.component)                                   |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.id](StructureDefinition-qicore-observation-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                                                       |
| Component code                         | [Observation.component.code](StructureDefinition-qicore-observation-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                                                       |
| Component result                       | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                                                       |
| Performer                              | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                                                       |
{: .grid}

##### 8.19.2.1 Negation Rationale for Physical Exam, Performed

Use [QICoreObservationNotDone](StructureDefinition-qicore-observationnotdone.html), which contains:
* [Observation.modifierExtension:notDone](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.modifierExtension:notDone) - Value Boolean fixed to "true"
* [Observation.status](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.status) - Fixed as "final"
* [Observation.extension:notDoneReason](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Observation.issued](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.issued) - When this was made available
* [Observation.code](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.code) - Use [Observation.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-observationnotdone-definitions.html#Observation.code.coding.extension:notDoneValueSet) to indicate the specific Observation that was not performed

##### 8.19.2.2 Codes for Negation of Certain Physical Exam, Performed

To capture specific types of "Physical Exam, Performed" as QICoreObservationNotDone, use the following Observation.codes:

1.	Pediatric BMI for Age – 59576-9
1.	Pediatric Weight for Height – 77606-2
1.	Pulse Oximetry – 3151-8
1.	Vital Signs (panel) – 85353-1
1.	Vital Signs – Respiratory Rate – 9279-1
1.	Vital Signs – Heart Rate – 8867-4
1.	Vital Signs – Oxygen Saturation – 2708-6
1.	Vital Signs – Body Temperature – 8310-5
1.	Vital Signs – Body Height – 8302-2
1.	Vital Signs – Head Circumference – 9843-4
1.	Vital Signs – Body Weight – 29463-7
1.	Vital Signs – Body Mass Index (BMI) – 39156-5
1.	Vital Signs – Blood Pressure Systolic and Diastolic – 85354-9
1.	Vital Signs – Systolic Blood Pressure – 8480-6
1.	Vital Signs – Diastolic Blood Pressure – 8462-4

#### 8.19.3 Physical Exam, Recommended

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Physical Exam, Recommended**                                    | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Anatomical Location Site                                          | [ServiceRequest.bodySite](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.bodySite)                               |                                                              |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.19.3.1 Negation Rationale for Physical Exam, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

##### 8.19.3.2 Codes for Negation of Certain Physical Exam, Recommended

To capture specific types of "Physical Exam, Recommended" as QICoreObservationNotDone, use the following ServiceRequest.codes:

1.	Pediatric BMI for Age – 59576-9
1.	Pediatric Weight for Height – 77606-2
1.	Pulse Oximetry – 3151-8
1.	Vital Signs (panel) – 85353-1
1.	Vital Signs – Respiratory Rate – 9279-1
1.	Vital Signs – Heart Rate – 8867-4
1.	Vital Signs – Oxygen Saturation – 2708-6
1.	Vital Signs – Body Temperature – 8310-5
1.	Vital Signs – Body Height – 8302-2
1.	Vital Signs – Head Circumference – 9843-4
1.	Vital Signs – Body Weight – 29463-7
1.	Vital Signs – Body Mass Index (BMI) – 39156-5
1.	Vital Signs – Blood Pressure Systolic and Diastolic – 85354-9
1.	Vital Signs – Systolic Blood Pressure – 8480-6
1.	Vital Signs – Diastolic Blood Pressure – 8462-4


### 8.20 Procedure

QDM defines Procedure as an act whose immediate and primary outcome
(post-condition) is the alteration of the physical condition of the subject. A
*procedure* may be a surgery or other type of physical manipulation of a
person’s body in whole or in part for purposes of making observations and
diagnoses or providing treatment.

#### 8.20.1 Procedure Vs Intervention

FHIR references both of these concepts using the Procedure resource, specifically
noting a process that involves verification of the patient’s comprehension or
to change the patient’s mental state would be a Procedure.

#### 8.20.2 Procedure Vs Task

Some use cases have considered differentiating a FHIR Procedure Resource
from a FHIR core Task Resource. For example, should a request to perform
medication reconciliation be classified as a Task or a Procedure? The
FHIR [Procedure Resource](http://hl7.org/fhir/procedure.html) Boundaries
and Relationships (Section 9.3.2) provides some distinction between a
[Task](http://hl7.org/fhir/task.html) and a
[Procedure](http://hl7.org/fhir/procedure.html):

*A [Task](http://hl7.org/fhir/task.html) is
a workflow step such as cancelling an order, fulfilling an order,
signing an order, merging a set of records, admitting a patient.
Procedures are actions that are intended to result in a physical or
mental change to or for the subject (e.g. surgery, physiotherapy,
training, counseling).
A [Task](http://hl7.org/fhir/task.html) resource
often exists in parallel with clinical resources. For example,
a [Task](http://hl7.org/fhir/task.html) might
request fulfillment of
a [ServiceRequest](http://hl7.org/fhir/servicerequest.html) ordering
a Procedure.*

Based on the guidance provided above, the workflow step to reconcile
medication lists may be considered a Task to perform the Procedure that
includes reviewing the medication list with the patient to assure it is
correct and to education the patient about proper medication usage.

QDM 5.5 does not address Task; therefore, there is no direct mapping
from QDM Intervention or Procedure to the FHIR Task resource.  The
mapping presented is from QDM to QI-Core referencing the FHIR Procedure
resource.

#### 8.20.3 Procedure Priority

QDM 5.5 includes a new attribute for Procedure: *priority* with the
following definition:

*Priority indicates the urgency of the procedure or the encounter
referenced. In \[electronic clinical quality measures\] (eCQMs) the
priority attribute will help specify elective from urgent encounters
(e.g., hospital admissions) or procedures. Priority is a codeable concept
(i.e., may use a direct reference code or a value set). For example,
priority is used to express an elective procedure or encounter from an
emergency procedure or encounter.*

As noted in the QDM to QI-Core Mapping for Encounter-Related Diagnoses
and Procedures, a specific measure may have interest in evaluating care
provided for elective procedures (e.g., hip surgery due to
osteoarthritis) while excluding emergency, non-planned procedures (e.g.,
hip surgery due to acute fracture). The procedure code does not
necessarily allow differentiation of the two concepts. A
[ServiceRequest.priority](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.priority) does have the ability to differentiate the
urgency with which the *request* (or order) should be fulfilled.
However, there is no element within the FHIR Procedure resource to
address the issue. [Encounter.priority](StructureDefinition-qicore-encounter-definitions.html#Encounter.priority) allows specification of whether
the encounter is elective. An encounter with [Encounter.priority](StructureDefinition-qicore-encounter-definitions.html#Encounter.priority) =
*elective* and an
[Encounter.extension.extension:rank.value[x]](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x]) = 1 addresses the need to specify an elective
encounter with a principal procedure. Therefore, based on the current
use case QI-Core has not added an extension to address
Procedure.priority and, as a result, there is no direct mapping from the
QDM Procedure priority attribute to QI-Core.

#### 8.20.4 Procedure, Performed

| **QDM Context**         | **QI-Core R4**                                              | **Comments**                   |
| ----------------------- | ----------------------------------------------------------- | ------------------------------ |
| **Procedure, Performed**| [Procedure](StructureDefinition-qicore-procedure.html)                   |                                                                                                           |
|                         | [Procedure.category](StructureDefinition-qicore-procedure-definitions.html#Procedure.category)        | Helps differentiate "intervention" from "procedure"                                                                                                       |
| **QDM Attributes**      |                                             |                                                                                                           |
| status                  | [Procedure.status](StructureDefinition-qicore-procedure-definitions.html#Procedure.status)            | constrain to "completed"                                                                                                               |
| Code                    | [Procedure.code](StructureDefinition-qicore-procedure-definitions.html#Procedure.code)                |                                                                                                           |
| id                      | [Procedure.id](StructureDefinition-qicore-procedure-definitions.html#Procedure.id)                    |                                                                                                           |
|                         |[Procedure.basedOn](StructureDefinition-qicore-procedure-definitions.html#Procedure.basedOn)|A reference to a resource that contains details of the request for this procedure.
| Method                  | N/A                            | Procedure.method does not exist in FHIR. Rather than create an extension, QI-Core's approach is to assume the Procedure.code includes reference to the method.                                                                                             |
| Rank                    | [Encounter.extension.extension:rank.value\[x\]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])                                | Referenced as attributes of Encounter ([Encounter.extension.extension:rank.value[x]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])). |
| Priority                | [qicore-encounter-procedure](StructureDefinition-qicore-encounter-procedure.html)      | This QDM attribute is intended to reference elective from non-elective procedures.<br/><br/>QI-Core references procedure.priority based on the relationship of the procedure to the Encounter; hence, Encounter.procedure (which is an extension). <br/><br/>The elective nature of a procedure can also be referenced based on the elective nature of an Encounter ([Encounter.priority](StructureDefinition-qicore-encounter-definitions.html#Encounter.priority)) for which the respective procedure is a principal procedure.<br/><br/>The concept may also be addressed as an Encounter, Order or Procedure, Order (both using [ServiceRequest](StructureDefinition-qicore-servicerequest.html)) and [ServiceRequest.priority](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.priority).                     |
| Anatomical Location Site                             | [Procedure.bodySite](StructureDefinition-qicore-procedure-definitions.html#Procedure.bodySite)        |                                                                                                           |
| Reason                  | [Procedure.reasonCode](StructureDefinition-qicore-procedure-definitions.html#Procedure.reasonCode)                                 |                                                                                                           |
| Result                  | [Observation](StructureDefinition-qicore-observation.html) that includes the element [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.           | [Procedure.report](StructureDefinition-qicore-procedure-definitions.html#Procedure.report) references [DiagnosticReport-note](StructureDefinition-qicore-diagnosticreport-note.html), DocumentReference, Composition (histology result, pathology report, surgical report, etc.); the latter two are not QI-Core resources. However, based on feedback regarding the use of the [Observation](StructureDefinition-qicore-observation.html) resource, a procedure result might be better referenced as an [Observation](StructureDefinition-qicore-observation.html) that includes the element [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.  |
|                         | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)      |Reference to a resource that contains details of the request for this procedure.                                                                                                           |
| Negation Rationale              | See Below |
| Relevant dateTime       | [Procedure.performed\[x\] dateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                  |                                                                                                           |
| Relevant Period         | [Procedure.performed\[x\] Period](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                    |                                                                                                           |
| Incision dateTime       | [Procedure.extension:incisionDateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.extension:incisionDateTime) |                                                                                                           |
| Author dateTime         | N/A   | The concept "author" requires a reference to a report about the procedure or about an indication the procedure was not performed. Therefore, the procedure resource does not have a reference to author dateTime. Author dateTime can reference a report about the procedure or an observation describing that result (e.g., Observation with metadata Observation.partOf procedure). However, Procedure.statusReason needs to address a dateTime that it is recorded.   |
| Components              | N/A                            | Procedure does not include components and the concept of components references a observation that is a result of the procedure ([Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)) for which that observation has components consistent with the Observation component modeling recommendation in FHIR.                                                                          |
| Component code          | N/A                            | N/A                                                                                                       |
| Component result        | N/A                            | N/A                                                                                                       |
| Performer               | [Procedure.performer.actor](StructureDefinition-qicore-procedure-definitions.html#Procedure.performer.actor)      |                                                                                                           |
{: .grid}

##### 8.20.4.1 Negation Rationale for Procedure, Performed

Use [QICoreProcedureNotDone](StructureDefinition-qicore-procedurenotdone.html), which contains:
* [Procedure.status](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.status) - Fixed as "not-done"
* [Procedure.statusReason](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Procedure.extension:recorded](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.extension:recorded) - When this was made available
* [Procedure.code](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.code) - Use [Procedure.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.code.coding.extension:notDoneValueSet) to indicate the specific Procedure that was not performed

#### 8.20.5 Procedure, Order

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Procedure, Order**                                              | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.20.5.1 Negation Rationale for Procedure, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

#### 8.20.6 Procedure, Recommended

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Procedure, Recommended**                                        | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, on-hold, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| Negation Rationale              | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### 8.20.6.1 Negation Rationale for Procedure, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Value Boolean fixed to "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed as "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - When this was made available
* [ServiceRequest.code](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code) - Use [ServiceRequest.code.coding.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.coding.extension:notDoneValueSet) to indicate the specific ServiceRequest that was not performed

### 8.21 Substance

#### 8.21.1 Substance, Administered; Substance, Order; Substance Recommended

QDM defines Substance as a homogeneous material with definite
composition that includes allergens, biological materials, chemicals,
foods, drugs and materials. QDM distinguishes between medications from
non-medication substances by separately listing medication datatypes.
Substance may or may not have a code or be classified by a code system
such RxNorm. Examples of a substance may include environmental agents
(e.g., pollen, dust) and food (e.g., vitamins). Where a substance can be
addressed using medication terminology (e.g. egg albumin) used the
Medication mappings listed in this QDM-to-QI-Core section.

FHIR defines substance as a homogeneous material with a definite
composition. Medications are classified as substances. However, to
reference other substances, especially using the
[SubstanceDefinition](http://hl7.org/fhir/substancespecification.html#SubstanceSpecification)
resource is challenging since the resource is still undergoing
development.

Ideally, use of a substance-related resource should be driven by use
cases and examples. Two such use cases currently exist in the quality
measure community::

* Determination that blood products (a biological product in FHIR
resources) are ordered or are administered within specific time
relationships to other data elements – The FHIR Resource,
[BiologicallyDerivedProduct](http://hl7.org/fhir/biologicallyderivedproduct.html),
possibly using Procedure and ServiceRequest might have promise.
However, the resource is still in development. Therefore, until
further information is available, rather than expressing the QDM
*datatype* Substance, Administration to address administration of
blood transfusion, quality measure and clinical decision support
(CDS) authors should consider using the procedure resource with a
code representing transfusion.
* Determination that human breast milk is used exclusively to feed
newborn infants during the initial stay in the hospital after birth
– Currently, FHIR includes a
[NutritionOrder](http://hl7.org/fhir/nutritionorder.html) resource
to reference a request for a specific diet, or supplements to a
diet. However, a resource for documenting administration of
nutrition-related substances is still in development. Therefore, for
this use case a quality measure or a clinical decision support (CDS)
author could reference a NutritionOrder for an exclusive breast milk
diet for the infant; however, such an expression could not reference
clinical intake and output records to determine if anything other
than human breast milk was administered to the infant. Moreover,
classification of human breast milk requires clarification as to
whether it is a
[BiologicallyDerivedProduct](http://hl7.org/fhir/biologicallyderivedproduct.html),
or if it should be referenced as a
[Substance](http://hl7.org/fhir/substance.html).

To provide some context and guidance, this QDM-to-QI-Core mapping
includes reference to the QDM *datatypes* Substance, Order and
Substance, Recommended using the
[NutritionOrder](http://hl7.org/fhir/nutritionorder.html) resource. As
noted in the second example provided, the resource is relatively new and
it allows expressions to address only the type of diet ordered, not the
foods or substances administered to a patient.

The CQI Workgroup suggests use of the Procedure resource for QDM's Substance, Administered for nutritional and other
non-medication substances. Indicate the procedure (e.g., oral feeding) and the Procedure.UsedCode to indicate the direct
reference code or value set indicating the expected nutritional element expected. There is no current known eCQM use
case or common practice for documenting NutritionOrder "negation rationale". Further, the only expressed use cases for
substance other than those that are modeled similar to medications are nutritional substance administered (human breast
milk) and biologically-derived product administration (blood) - both of these use cases can use the Procedure resources
as noted. Further work in base FHIR will advise how to reference specific administration details in QI-Core.

| **QDM Context**                                    | **FHIR R4**                                                                                                                                                         | **Comments**                                          |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| **Substance, Order/Recommended - For Diet Orders** | [NutritionOrder](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder)                                                                                                           | Limited to orders for diets or diets with supplements |
| Substance Order/Recommended Activity               | [NutritionOrder.status](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.status)                                                                  | Constrain to Active, on-hold, Completed               |
| Substance, Order                                   | [NutritionOrder.intent](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.intent)                                                                  | Constrain to "order" and child concepts                                  |
| Substance, Recommended                             | [NutritionOrder.intent](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.intent)                                                                  | Constrain to "plan"               |
| **QDM Attributes**                                 |                                                                                                                                    |                                                       |
| ORAL DIET                                          | [NutritionOrder.oralDiet](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet)                                                              |                                                       |
| code (to represent a diet order)                   | [NutritionOrder.oralDiet.type](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet.type)                                                    |                                                       |
|                                                    | [NutrientOrder.oralDiet.nutrient.modifier](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet.nutrient.modifier)                           |                                                       |
| id                                                 | [NutritionOrder.id](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.id)                                                                                                                       |                                                       |
| dosage                                             | N/A                                                                                                                                                                 |                                                       |
| frequency                                          | [NutritionOrder.Diet.schedule](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet.schedule)                                                |                                                       |
| negation rationale                                 | N/A                                                                                                                                                                 |                                                       |
| author dateTime                                    | [NutritionOrder.dateTime](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.dateTime)                                                              |                                                       |
| relevant period                                    | N/A                                                                                                                                                                 |                                                       |
| reason                                             | N/A                                                                                                                                                                 |                                                       |
| supply                                             | N/A                                                                                                                                                                 |                                                       |
| refills                                            | N/A                                                                                                                                                                 |                                                       |
| route                                              | [NutritionOrder.oralDiet](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet)                                                              |                                                       |
| Requester                                          | [NutritionOrder.orderer](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.orderer)                                                                |                                                       |
| ENTERAL FORMULA                                    | [NutritionOrder.enteralFormula](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula)                                                  |                                                       |
| code (to represent a diet order)                   | [NutritionOrder.enteralFormula.baseFormulaType](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.baseFormulaType)                  |                                                       |
| Additive to diet order                             | [NutritionOrder.enteralFormula.additiveType](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.additiveType)                        |                                                       |
| id                                                 | N/A                                                                                                                                                                 |                                                       |
| dosage                                             | [NutritionOrder.enterealFormula.administration.quantity](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.quantity) |                                                       |
| frequency                                          | [NutritionOrder.enteralFormula.administration.rate\[x\]](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.rate[x])    |                                                       |
| negation rationale                                 | N/A                                                                                                                                                                 |                                                       |
| author dateTime                                    | [NutritionOrder.dateTime](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.dateTime)                                                              |                                                       |
| relevant period                                    | [NutritionOrder.enteralFormula.administration.schedule](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.schedule)  |                                                       |
| reason                                             | N/A                                                                                                                                                                 |                                                       |
| supply                                             | N/A                                                                                                                                                                 |                                                       |
| refills                                            | [NutritionOrder.enteralFormula](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula)                                                  |                                                       |
| route                                              | [NutritionOrder.enteralFormula.routeofAdministration](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.routeofAdministration)      |                                                       |
| Requester                                          | [NutritionOrder.orderer](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.orderer)                                                                |                                                       |
{: .grid}

### 8.22 Symptom

QDM defines Symptom as an indication that a person has a condition or
disease. Some examples include headache, fever, fatigue, nausea,
vomiting, and pain. Symptoms are subjective manifestations of the
disease perceived by the patient. As an example to differentiate symptom
from finding, the patient’s subjective symptom of fever is distinguished
from the temperature (a finding). For a finding, there is either a
source of a temperature-measuring device together with a recorder
of the device (electronically) or an individual (healthcare provider,
patient, etc.).

Note: Definitions regarding symptom on the FHIR condition resource
Boundaries and Relationships (Section 9.2.2:
<http://hl7.org/fhir/condition.html>):

* \[The Condition\] resource is not typically used to record
information about subjective and objective information that might
lead to the recording of a Condition resource. Such signs and
symptoms are typically captured using
the [Observation](http://hl7.org/fhir/observation.html) resource;
although in some cases a persistent symptom, e.g. fever, headache
may be captured as a condition before a definitive diagnosis can be
discerned by a clinician. By contrast, headache may be captured as
an Observation when it contributes to the establishment of a
meningitis Condition.

* Use the [Observation](http://hl7.org/fhir/observation.html) resource
when a symptom is resolved without long term management, tracking,
or when a symptom contributes to the establishment of a condition.

* Use Condition when a symptom requires long term management,
tracking, or is used as a proxy for a diagnosis or problem that is
not yet determined.

Based on the FHIR referenced provided above, the QDM *datatype* Symptom
maps to the FHIR Observation resource.

| **QDM Context**    | **QI-Core R4**                                                                                                                                                | **Comments**                                                                     |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| **Symptom**        | [Observation](StructureDefinition-qicore-observation.html)                                                                           |                                                                                  |
|                    | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                 | restrict to preliminary, final, amended, corrected                               |
|                    | [Observation.category](StructureDefinition-qicore-observation-definitions.html#Observation.category)             | add symptom concept                                                              |
| **QDM Attributes** |                                                                                                                              |                                                                                  |
| Code               | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])           | Use codable concept                                                              |
| id                 | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                         |                                                                                  |
| severity           | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation) | Definition suggests high, low, normal - perhaps consider severe, moderate, mild. |
| prevalence period  | [Observation.effective\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])   | dateTime, period, timing, instant                                                |
| recorder           | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)           |                                                                                  |
{: .grid}
