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
the QDM concepts map directly to US-Core R4, FHIR R4 resources or
extensions represented in QI-Core.

This version of QI Core updates mappings from QI-Core to QDM based on
US-Core R4 and FHIR R4 and QDM version 5.5. Reviewers can evaluate the
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
|                     | [AllergyIntolerance.clinicalStatus](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.clinicalStatus)                   |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.type](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.clinicalStatus)                             | Defines difference between Allergy and Intolerance                                                                                                                                                                                               |
|                     | [AllergyIntolerance.clinicalStatus](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.clinicalStatus)                   | unconfirmed, confirmed, refuted, entered-in-error                                                                                                                                                                                                |
|                     | [AllergyIntolerance.extension:reasonRefuted](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.onset[x])                |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.category](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.category)                               | Food, medication, environment, biologic                                                                                                                                                                                                          |
| **QDM Attributes**  |                                                                                                                                                                                                      |                                                                                                                                                                                                                                                  |
| Code                | [AllergyIntolerance.code](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.code)                                       | RxNorm                                                                                                                                                                                                                                           |
| id                  | [AllergyIntolerance.id](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.id)                                           |                                                                                                                                                                                                                                                  |
| Prevalence Period   | [AllergyIntolerance.onset\[x\]](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.onset[x])                             | QI-Core AllergyIntolerance includes a timing reference for onset and last occcurrence but resolutionAge is no longer available. Therefore, QI-Core allows reference to QDMs Allergy/Intolerance "prevalence period" start time but not end time. |
|                     | [AllergyIntolerance.onset\[x\]](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.onset[x])                             |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.lastOccurrence](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.onset[x])                         |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.extension:resolutionAge](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.extension:resolutionAge) |                                                                                                                                                                                                                                                  |
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

### 8.4 Observations

A number of QDM “datatypes” (i.e., information class with its
corresponding context of use) are basically observations. These include:

  - Assessment, Performed

  - Care Experience

  - Diagnostic Study, Performed

  - Physical Exam, Performed

  - Symptom

This section addresses all of these QDM concepts since they use US-Core
and FHIR Observation resources.  The mapping uses US-Core R4 where
US-Core specifically defines a profile to reference the concept (e.g.,
US Core Laboratory Result Observation Profile). In some cases, US-Core
references some aspects of a “QDM datatype,” (e.g., US Core Smoking
Status Observation Profile) but no other related observations. In such
cases, the QDM mapping table provides a generic mapping to the FHIR
Observation resource and a specific reference for relevant profiles
defined in US-Core.

Note, when considering use of components for observations, refer to FHIR
Observation.component for guidance (section 10.1.4.3.2
<https://www.hl7.org/fhir/observation.html>):

*Observation.component is used for any supporting result that cannot
reasonably be interpreted and used outside the scope of the Observation
it is a component of. Component observations may make up the separate
and individual parts of the observation or may provide qualifying
information to Observation.code and may only be able to be understood in
relation to the Observation.code (for example, see
the [$stats operation](https://www.hl7.org/fhir/observation-operation-stats.html)).
Therefore **all** code-value and component.code-component.value pairs
need to be taken into account to correctly understand the meaning of the
observation. Components should only be used when there is only one
method, one observation, one performer, one device, and one time. Some
use cases for using this structure include:*

1.  *Observations that are commonly produced and interpreted together.
    For example, systolic and diastolic blood pressure are represented
    as a single [Blood pressure panel](https://www.hl7.org/fhir/observation-example-bloodpressure.html).*

2.  *Assessment tool results that are commonly produced and interpreted
    together. For example, a newborn [Apgar score](https://www.hl7.org/fhir/observation-example-5minute-apgar-score.html)
    that is a single Observation with five components.*

3.  *Representing multiple answers to a question
    ([relationship and boundaries](https://www.hl7.org/fhir/questionnaireresponse.html#bnr) between
    Observation and Questionnaire/QuestionnaireResponse). For example,
    reporting the [types of alcohol](https://www.hl7.org/fhir/observation-example-alcohol-type.html) consumed
    by a patient*

*On the other hand, any observations that are clinically relevant
outside the context of being a component of another observation should
be represented by separate Observation resources. For example
a [Body Mass Index (BMI)](https://www.hl7.org/fhir/observation-example-bmi-using-related.html)
Observation should not contain components for height and weight because
they are clinically relevant observations on their own and should be
represented by separate Observation resources.* 

This QDM to QI-Core Mapping is updated from QDM 5.4 to QDM 5.5.

#### 8.4.1 Assessment, Performed

QDM defines Assessment as a resource used to define specific
observations that clinicians use to guide treatment of the patient. An
assessment can be a single question, or observable entity with an
expected response, an organized collection of questions intended to
solicit information from patients, providers or other individuals, or a
single observable entity that is part of such a collection of questions.
US-Core defines a specific resource for smoking status assessment; other
observations that meet the QDM definition of assessment use the FHIR
Observation resource:

##### 8.4.1.1 Assessment, Performed

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
| negation rationale                            | [Observation.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.dataAbsentReason)                     | Initial table indicates extensible but detailed link indicates SHALL - <https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-observation-lab-definitions.html#Observation.dataAbsentReason> |
| reason                                        | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | The observation fulfills a plan, proposal or order - trace for authorization. Not a perfect  fit for the intent in QDM (e.g., observation "reason" = a diagnosis)  Is an extension needed?                  |
| result                                        | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])                                   |                                                                                                                                                                            |
|                                               | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation)                         |                                                                                                                                                                                                             |
| Relevant dateTime                             | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                  |                                                                                                                                                                                                             |
| Relevant Period                               | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                    |                                                                                                                                                                                                             |
| Author dateTime                               | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         | Consider if authorDatetime (intended for negation rationale) fits with observation.issued or FHIR provenance for docuemtnation of the dataAbsentReason.                                                     |
| Component                                     | [Observation.component](StructureDefinition-qicore-observation-definitions.html#Observation.component)                                   |                                                                                                                                                                                                             |
|                                               | [Observation.component.id](StructureDefinition-qicore-observation-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                             |
| Component code                                | [Observation.component.code](StructureDefinition-qicore-observation-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                             |
| Component result                              | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                             |
|                                               | [Observation.component.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                             |
|                                               | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                             |
| Performer                                     | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                             |
{: .grid}

##### 8.4.1.2 Assessment, Performed: Smoking Status

| **QDM Context**                           | **USCore R4**                                                                                                                                                           | **Comments**                                                                                                                                            |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Assessment, Performed: Smoking Status** | [uscore-smokingstatus](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus.html)                                                                      | Modeled as in USCore - Smoking Status                                                                                                                   |
|                                           | [Observation.status](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected                                                                                                        |
| **QDM Attributes**                        |                                                                                                                                         |                                                                                                                                                         |
| code                                      | [Observation.code](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.code)                                             | Fixed LOINC code 72166-2                                                                                                                                |
| id                                        | [Observation.id](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.id)                                                 |                                                                                                                                                         |
| method                                    | [Observation.method](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.method)                                         |                                                                                                                                                         |
| relatedTo                                 | [Observation.basedOn](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.basedOn)                                       |                                                                                                                                                         |
| negation rationale                        | [Observation.dataAbsentReason](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.dataAbsentReason)                     |                                                                                                                                                         |
| reason                                    |                                                                                                                                       |                                                                                                                                                         |
| result                                    | [Observation.valueCodeableConcept](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.valueCodeableConcept)             |                                                                                                                                                         |
| Relevant dateTime                         | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.effective[x])                           |                                                                                                                                                         |
| Relevant Period                           | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.effective[x])                           |                                                                                                                                                         |
| Author dateTime                           | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.issued)                                        | Consider if authorDatetime (intended for negation rationale) fits with observation.issued or FHIR provenance for docuemtnation of the dataAbsentReason. |
| Component                                 | [Observation.component](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.component)                                   |                                                                                                                                                         |
|                                           | [Observation.component.id](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.component.id)                             |                                                                                                                                                         |
| Component code                            | [Observation.component.code](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.component.code)                         |                                                                                                                                                         |
| Component result                          | [Observation.component.value\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.component.value[x])               |                                                                                                                                                         |
|                                           | [Observation.component.dataAbsentReason](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                         |
| Performer                                 | [Observation.performer](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.performer)                                   |                                                                                                                                                         |
{: .grid}

#### 8.4.2 Care Experience

QDM defines *Care Experience* as the experience a patient has when
receiving care or a provider has when providing care. QDM represents two
kinds of care experience: Patient Care Experience and Provider Care
Experience. While generally interpreted as patient or provider
satisfaction, experience may also represent understanding, involvement
and other factors about the care received or given. Most often
organizations obtain such information using questionnaires. Use cases
are welcome to help provide examples for us of this concept. The Care
Experience concept best fits with the FHIR Observation resource.

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
|                              |                                                                                                                                     |                                                             |
| **QDM Context**              | **FHIR R4**                                                                                                                                                          | **Comments**                                                |
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

#### 8.4.3 Diagnostic Study, Performed

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
Individual studies may use the US-Core DiagnosticReport-note
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
| negation rationale              | [Observation.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.dataAbsentReason)                     | The Observation.status value set does not include a "not-done" option. Therefore, the Observation.dataAbsentReason with status="unknown" or "cancelled" might be used.  Consider extension for status="not-done"                                   |
|                                 | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         | Issued - the date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified. Consider if QI-Core should include an extension to manage timing of the dataAbsentReason. |
| reason                          | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | the Observation.basedOn concept indicates the plan, proposal or order that the observation fulfills. This concept is not consistent with the QDM concept of "reason" for the study to be performed.                                                |
| result                          | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])                                   |                                                                                                                                                                                                                                                    |
|                                 | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation)                         |                                                                                                                                                                                                                                                    |
| result dateTime                 | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         |                                                                                                                                                                                                                                                    |
| Relevant dateTime               | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                  |                                                                                                                                                                                                                                                    |
| Relevant Period                 | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                    |                                                                                                                                                                                                                                                    |
| Status                          | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected, appended                                                                                                                                                                                         |
| Author dateTime                 | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         | Issued - the date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified. Consider if QI-Core should include an extension to manage timing of the dataAbsentReason. |
| Component                       | [Observation.component](StructureDefinition-qicore-observation-definitions.html#Observation.component)                                   | Components not present in US-Core-R4 DiagnosticReport but the report references Observation for results; thus it seems reasonable to re-use observation concepts for the components of a DiagnosticReport                                          |
|                                 | [Observation.component.id](StructureDefinition-qicore-observation-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                                                                    |
| Component code                  | [Observation.component.code](StructureDefinition-qicore-observation-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                                                                    |
| Component result                | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                                                                    |
|                                 | [Observation.component.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                                                                    |
|                                 | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                                                                    |
| Performer                       | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                                                                    |
{: .grid}

#### 8.4.4 Laboratory Test, Performed

QDM defines Laboratory Test as a medical procedure that involves testing
a sample of blood, urine, or other body fluids or specimens. Tests can
help determine a diagnosis, plan treatment, check to see if treatment is
working, or monitor the disease over time. This QDM data category for
Laboratory Test is only used for information about the subject of
record.

Thus far, consensus opinion suggests that the US-Core Observation-Lab
Profile best fits the laboratory test use case for querying clinical
data to retrieve information about the event and/or the result of the
study. Individual studies may use the US-Core DiagnosticReport-lab
(<http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html>)
to provide information about an individual laboratory test although some
have considered use of other reporting resources and artifacts. Each
laboratory test may be ordered individually or in a panel. Many use
panels for convenience for ordering laboratory tests. Since new
laboratory panels regularly become available and the myriad of potential
laboratory panels available, a complete list cannot be assured.
Therefore, a quality measure or clinical decision support (CDS)
artifacts seeking a specific result value should use the US-Core
Observation-Lab profile to request a retrieve of the result value
desired. This practice will enable implementers to determine which is
the best source for the desired observation. LOINC observable entities
may indicate specific methods for determination of results. Measure and
CDS developers can reference direct reference codes or value sets using
the such LOINC codes to specify the type of testing considered
acceptable to provide sufficient fidelity to their requests.

| **QDM Context**                | **USCore R4**                                               | **US Core R3 Observation-Lab**                                                                                                                                            | **Comments**                                                                                                                                                                                                                                       |
| ------------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Laboratory Test, Performed** | Observation-lab                                             | [Observation-Lab](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html)                                                                           |                                                                                                                                                                                                                                                    |
|                                | Observation.status                                          | [Observation.status](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected                                                                                                                                                                                                   |
| **QDM Attribute**              |                                                             |                                                                                                                                          |                                                                                                                                                                                                                                                    |
| code                           | Observation.code                                            | [Observation.code](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.code)                                             |                                                                                                                                                                                                                                                    |
| id                             | Observation.id                                              | [Observation.id](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.id)                                                 |                                                                                                                                                                                                                                                    |
| method                         | Observation.method                                          | [Observation.method](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.method)                                         |                                                                                                                                                                                                                                                    |
|                                | Observation.bodySite                                        | [Observation.bodySite](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.bodySite)                                     |                                                                                                                                                                                                                                                    |
| negation rationale             | Observation.dataAbsentReason                                | [Observation.dataAbsentReason](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.dataAbsentReason)                     | NOTE: Differential view indicates Extensible                                                                                                                                                                                                       |
|                                | Observation.issued                                          | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.issued)                                         | Issued - the date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified. Consider if QI-Core should include an extension to manage timing of the dataAbsentReason. |
| reason                         | Observation.basedOn                                         | [Observation.basedOn](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.basedOn)                                       | the observation fulfills a plan, proposal or order - trace for authorization. Possibly not a fit for the intent in QDM (e.g., observation "reason" = a diagnosis)  Is an extension needed?                                                         |
| result                         | value\[x\]                                                  | [Observation.value\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])                                   |                                                                                                                                                                                                                                                    |
|                                | Observation.interpretation                                  | [Observation.interpretation](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])                               |                                                                                                                                                                                                                                                    |
|                                | Observation.specimen                                        | [Observation.specimen](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])                                     |                                                                                                                                                                                                                                                    |
| result dateTime                | Observation.issued                                          | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])                                       |                                                                                                                                                                                                                                                    |
| Relevant dateTime              | Observation.effective\[x\] dateTime                         | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.effective[x])                           |                                                                                                                                                                                                                                                    |
| Relevant Period                | Observation.effective\[x\] Period                           | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.effective[x])                           |                                                                                                                                                                                                                                                    |
| Status                         | Observation.status                                          | [Observation.status](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected                                                                                                                                                                                                   |
| Author dateTime                | Observation.issued                                          | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.issued)                                         | Issued - the date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified. Consider if QI-Core should include an extension to manage timing of the dataAbsentReason. |
| Reference Range High           | Observation.referenceRange.high                             | [Observation.referenceRange.high](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.referenceRange.high)               |                                                                                                                                                                                                                                                    |
| Reference Range Low            | Observation.referenceRange.low                              | [Observation.referenceRange.low](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.referenceRange.low)                 |                                                                                                                                                                                                                                                    |
| Component                      | Observation.component                                       | [Observation.component](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.effective[x])                                |                                                                                                                                                                                                                                                    |
|                                | Observation.Component.id                                    | [Observation.component.id](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                                                                    |
| Component code                 | Observation.component.code                                  | [Observation.component.code](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                                                                    |
| Component result               | Observation.component.value\[x\]                            | [Observation.component.value\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                                                                    |
|                                | Observation.component.interpretation                        | [Observation.component.interpretation](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                                                                    |
|                                | Observation.component.dataAbsentReason                      | [Observation.component.dataAbsentReason](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                                                                    |
| Component reference range high | Observaton.component.referenceRange                         | [Observation.component.referenceRange](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.referenceRange)     |                                                                                                                                                                                                                                                    |
| Component reference range low  | Observation.component.referenceRange                        | [Observation.component.referenceRange](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.component.referenceRange)     |                                                                                                                                                                                                                                                    |
| Performer                      | Observation.performer                                       | [Observation.performer](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                                                                    |
{: .grid}

#### 8.4.5 Physical Exam, Performed

QDM defines Physical Exam as the evaluation of the patient's body and/or
mental status exam to determine its state of health. The techniques of
examination can include palpation (feeling with the hands or fingers),
percussion (tapping with the fingers), auscultation (listening), visual
inspection or observation, inquisition and smell. Measurements may
include vital signs (blood pressure, pulse, respiration) as well as
other clinical measures (such as expiratory flow rate and size of
lesion). Physical exam includes psychiatric examinations. 

US-Core defines a resources for vital signs (referencing the [FHIR Vital
Signs Profile](http://hl7.org/fhir/R4/observation-vitalsigns.html)), and
two additional profiles – [Pediatric-BMI-for
Age](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age.html)
and [Pediatric Weight for
Height](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height.html).
Other observations that meet the QDM definition of Physical Exam,
Performed use the FHIR Observation resource

##### 8.4.5.1 Physical Exam, Performed: General

| **QDM Context**                        | **QI-Core R4**                                                                                                                                                                        | **Comments**                                                                                                                                                                                                                          |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Physical Exam, Performed - General** | [Observation](StructureDefinition-qicore-observation.html)                                                       |                                                                                                                                                                                                                                       |
|                                        | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected                                                                                                                                                                                      |
|                                        | [Observation.category](StructureDefinition-qicore-observation-definitions.html#Observation.category)                                     | Constrain to "exam" \[Observations generated by physical exam findings including direct observations made by a clinician and use of simple instruments and the result of simple maneuvers performed directly on the patient's body.\] |
| **QDM Attributes**                     |                                                                                                                                                      |                                                                                                                                                                                                                                       |
| code                                   | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                                             |                                                                                                                                                                                                                                       |
| id                                     | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                                 |                                                                                                                                                                                                                                       |
| method                                 | [Observation.method](StructureDefinition-qicore-observation-definitions.html#Observation.method)                                         |                                                                                                                                                                                                                                       |
|                                        | [Observation.bodySite](StructureDefinition-qicore-observation-definitions.html#Observation.bodySite)                                     |                                                                                                                                                                                                                                       |
| relatedTo                              | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | A plan, proposal or order that is fulfilled in whole or in part by this event. For example, a MedicationRequest may require a patient to have laboratory test performed before it is dispensed.                                       |
|                                        | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)                                         | A larger event of which this particular Observation is a component or step. For example, an observation as part of a procedure.                                                                                                       |
| negation rationale                     | [Observation.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.dataAbsentReason)                     |                                                                                                                                                                                                                                       |
|                                        | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         | Consider if authorDatetime (intended for negation rationale) fits with observation.issued or FHIR provenance for docuemtnation of the dataAbsentReason.                                                                               |
| reason                                 | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | the observation fulfills a plan, proposal or order - trace for authorization. Possibly not a fit for the intent in QDM (e.g., observation "reason" = a diagnosis)  Is an extension needed?                                            |
| result                                 | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])                                   |                                                                                                                                                                                                                                       |
|                                        | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation)                         |                                                                                                                                                                                                                                       |
| Relevant dateTime                      | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                  |                                                                                                                                                                                                                                       |
| Relevant Period                        | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                    |                                                                                                                                                                                                                                       |
| Author dateTime                        | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         | Consider if authorDatetime (intended for negation rationale) fits with observation.issued or FHIR provenance for docuemtnation of the dataAbsentReason.                                                                               |
| Component                              | [Observation.component](StructureDefinition-qicore-observation-definitions.html#Observation.component)                                   |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.id](StructureDefinition-qicore-observation-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                                                       |
| Component code                         | [Observation.component.code](StructureDefinition-qicore-observation-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                                                       |
| Component result                       | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                                                       |
| Performer                              | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                                                       |
{: .grid}

##### 8.4.5.2 Physical Exam, Performed - Pediatric Weight for Height

| **QDMContext**                  | **USCore R3**                                                                                                                                               | **Comments**                                                                                                                                            |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Physical Exam, Performed**    | [pediatric-weight-for-height](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height.html)                                             | Inherited from USCore R3 Pediatric Weight for Height                                                                                                    |
| **Pediatric Weight for Height** | [Observation.status](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.basedOn)                      | Constrain status to -  final, amended, corrected                                                                                                        |
|                                 | [Observation.category](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.code.id)                    |                                                                                                                                                         |
| **QDM Attributes**              |                                                                                                                            |                                                                                                                                                         |
| code                            | [Observation.code](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.code)                           |                                                                                                                                                         |
|                                 | [WtPercentile.code](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.code.coding:WtPercentile.code) |                                                                                                                                                         |
| id                              | [Observation.code.id](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.code.id)                     |                                                                                                                                                         |
| method                          | [Observation.method](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.method)                       |                                                                                                                                                         |
| relatedTo                       | [Observation.basedOn](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.basedOn)                     |                                                                                                                                                         |
| negation rationale              | [Observation.dataAbsentReason](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.code.id)            |                                                                                                                                                         |
|                                 | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.issued)                       | Consider if authorDatetime (intended for negation rationale) fits with observation.issued or FHIR provenance for docuemtnation of the dataAbsentReason. |
| reason                          | [Observation.basedOn](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.basedOn)                     |                                                                                                                                                         |
| result                          | [Observation.valueQuantity](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.valueQuantity)         | Quantity                                                                                                                                                |
|                                 | [Observation.interpretation](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.code.id)              |                                                                                                                                                         |
| Relevant dateTime               | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.code.id)              |                                                                                                                                                         |
| Relevant Period                 | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.effective[x])         |                                                                                                                                                         |
| Author dateTime                 | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.issued)                       | Consider if authorDatetime (intended for negation rationale) fits with observation.issued or FHIR provenance for docuemtnation of the dataAbsentReason. |
| Performer                       | [Observation.performer](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.performer)                 |                                                                                                                                                         |
{: .grid}

##### 8.4.5.3 Physical Exam, Performed - Pediatric BMI for Age

| **QDM Context**              | **USCore R3**                                                                                                                                           | **Comments**                                                                                                                                            |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Physical Exam, Performed** | [pediatric-bmi-for-age](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age.html)                                                     | Inherited from Pediatric BMI for Age                                                                                                                    |
| **Pediatric BMI for Age**    | [Observation.status](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.status)                         | Constrain status to -  final, amended, corrected                                                                                                        |
|                              | [Observation.category](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.category)                     |                                                                                                                                                         |
| **QDM Attributes**           |                                                                                                                        |                                                                                                                                                         |
| code                         | [Observation.code](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.code)                             |                                                                                                                                                         |
|                              | [BMIPercentile.code](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.code.coding:BMIPercentile.code) | LOINC                                                                                                                                                   |
| id                           | [Observation.id](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.id)                                 |                                                                                                                                                         |
| method                       | [Observation.method](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.method)                         |                                                                                                                                                         |
| relatedTo                    | [Observation.basedOn](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.basedOn)                       |                                                                                                                                                         |
| negation rationale           | [Observation.dataAbsentReason](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.dataAbsentReason)     |                                                                                                                                                         |
|                              | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.issued)                         | Consider if authorDatetime (intended for negation rationale) fits with observation.issued or FHIR provenance for docuemtnation of the dataAbsentReason. |
| reason                       | [Observation.basedOn](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.basedOn)                       |                                                                                                                                                         |
| result                       | [Observation.value\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.value[x])                   | Quantity                                                                                                                                                |
|                              | [Observation.value\[x\].code](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.value[x].code)         | %                                                                                                                                                       |
|                              | [Observation.interpretation](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.interpretation)         |                                                                                                                                                         |
| Relevant dateTime            | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.effective[x])           |                                                                                                                                                         |
| Relevant Period              | [Observation.effective\[x\]](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.effective[x])           |                                                                                                                                                         |
| Author dateTime              | [Observation.issued](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.issued)                         | Consider if authorDatetime (intended for negation rationale) fits with observation.issued or FHIR provenance for docuemtnation of the dataAbsentReason. |
| Performer                    | [Observation.performer](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.performer)                   |                                                                                                                                                         |
{: .grid}

##### 8.4.5.4 Physical Exam, Performed - Vital Signs

| **QDM Context**                       | **FHIR R4**                                                   | **Link**                                                                                                                                      | **Comments**                                                                                                                                                                               |
| ------------------------------------- | ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Physical Exam, Vital Signs**        | Vital Signs                                                   | [VitalSigns](http://hl7.org/fhir/R4/observation-vitalsigns.html)                                                                              | Inherited from FHIR R4 (as in USCore R3)                                                                                                                                                   |
|                                       | Vital Signs Panel                                             | [VitalsPanel](http://hl7.org/fhir/R4/vitalspanel.html)                                                                                        |                                                                                                                                                                                            |
|                                       | Observation.status                                            | [Observation.status](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.status)                                                  | Constrain status to -  final, amended, corrected                                                                                                                                           |
| **QDM Attributes**                    |                                                               |                                                                                                              |                                                                                                                                                                                            |
| code                                  | VitalsPanel.code.code                                         | [VitalsPanelCode.code](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.code.coding:VitalsPanelCode.code)                      | 9279-1                                                                                                                                                                                     |
| id                                    | id (logical id of resource)                                   | [Observation.id](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.id)                                                          |                                                                                                                                                                                            |
| method                                | Observation.method                                            | [Observation.method](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.method)                                                  |                                                                                                                                                                                            |
| anatomic location site                | Observation.bodySite                                          | [Observation.bodySite](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.bodySite)                                              |                                                                                                                                                                                            |
| negation rationale                    | Observation.dataAbsentReason                                  | [Observation.dataAbsentReason](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.dataAbsentReason)                              |                                                                                                                                                                                            |
| reason                                | Observation.basedOn                                           | [Observation.basedOn](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.basedOn)                                                | the observation fulfills a plan, proposal or order - trace for authorization. Possibly not a fit for the intent in QDM (e.g., observation "reason" = a diagnosis)  Is an extension needed? |
| result                                | value\[x\] - Only used in component vitalsigns measurements   |                                                                                                              |                                                                                                                                                                                            |
| Relevant dateTime                     | Vitalspanel-definitions - Observation.effective\[x\] dateTime | [Observation.effective\[x\]](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.effective[x])                                    |                                                                                                                                                                                            |
| Relevant Period                       | Vitalspanel-definitions - Observation.effective\[x\] Period   | [Observation.effective\[x\]](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.effective[x])                                    |                                                                                                                                                                                            |
| Author dateTime                       | Vitalspanel-definitions - Observation.issued                  | [Observation.issued](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.issued)                                                  | Observation.issued is closer to reported time. Author dateTime is missing.                                                                                                                 |
| Reference Range High                  | Vitalspanel-definitions - Observation.referenceRange.high     | [Observation.referenceRange.high](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.referenceRange.high)                        |                                                                                                                                                                                            |
| Reference Range Low                   | Vitals panel-definitions - Observation.referenceRange.low     | [Observation.referenceRange.low](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.referenceRange.low)                          |                                                                                                                                                                                            |
| Component                             | Vitalspanel-definitions Observation.component                 | [Observation.component](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.component)                                            |                                                                                                                                                                                            |
|                                       | Vitalspanel-definitions Component.id                          | [Observation.component.id](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.component.id)                                      |                                                                                                                                                                                            |
| Component code                        |                                                               | [Observation.component.code](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.component.code)                                  |                                                                                                                                                                                            |
| Component result                      | Vitalspanel.Observation.component.value\[x\]                  | [Observation.component.value\[x\]](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.component.value[x])                        |                                                                                                                                                                                            |
|                                       | Vitalspanel.Observation.component dataAbsentReason            | [Observation.component.dataAbsentReason](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.component.dataAbsentReason)          |                                                                                                                                                                                            |
| Component reference range high        | Vitalspanel.Observation.component.referenceRange              | [Observation.component.referenceRange](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.component.referenceRange)              |                                                                                                                                                                                            |
| Component reference range low         | Vitalspanel.Observation.component.referenceRange              | [Observation.component.referenceRange](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.component.referenceRange)              |                                                                                                                                                                                            |
|                                       | Vitalspanel-definitions Observation.componentInterpretation   | [Observation.component.interpretation](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.component.interpretation)              |                                                                                                                                                                                            |
| Performer                             | Vitalspanel-definitions Observation.performer                 | [Observation.performer](http://hl7.org/fhir/R4/vitalspanel-definitions.html#Observation.performer)                                            |                                                                                                                                                                                            |
| Individual Vital Sign Observations    |                                                               |                                                                                                                                               |                                                                                                                                                                                            |
| Respiratory Rate                      | Resprate definition Observation                               | [resprate](http://hl7.org/fhir/R4/resprate.html)                                                                                              |                                                                                                                                                                                            |
|                                       | ResprateCode.code                                             | [RespRateCode.code](http://hl7.org/fhir/R4/resprate-definitions.html#Observation.code.coding:RespRateCode.code)                               | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.value\[x\].code](http://hl7.org/fhir/R4/resprate-definitions.html#Observation.value[x].code)                                     | UCUM                                                                                                                                                                                       |
| Heart Rate                            | Heartrate definition                                          | [heartrate](http://hl7.org/fhir/R4/heartrate.html)                                                                                            |                                                                                                                                                                                            |
|                                       | HeartrateCode.code                                            | [HeartRateCode.code](http://hl7.org/fhir/R4/heartrate-definitions.html#Observation.code.coding:HeartRateCode.code)                            | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.value\[x\]](http://hl7.org/fhir/R4/heartrate-definitions.html#Observation.value[x].code)                                         | UCUM                                                                                                                                                                                       |
| Oxygen Saturation                     | Oxygensat definition                                          | [oxygensat](http://hl7.org/fhir/R4/oxygensat.html)                                                                                            |                                                                                                                                                                                            |
|                                       | OxygensatCode.code                                            | [OxygenSatCode.code](http://hl7.org/fhir/R4/oxygensat-definitions.html#Observation.code.coding:OxygenSatCode.code)                            | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.value\[x\].code](http://hl7.org/fhir/R4/oxygensat-definitions.html#Observation.value[x].code)                                    | UCUM                                                                                                                                                                                       |
| Body Temperature                      | BodyTemp definition                                           | <http://hl7.org/fhir/R4/bodytemp.html>                                                                                                        |                                                                                                                                                                                            |
|                                       | BodyTempCode.code                                             | [BodyTempCode.code](http://hl7.org/fhir/R4/bodytemp-definitions.html#Observation.code.coding:BodyTempCode.code)                               | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.value\[x\].code](http://hl7.org/fhir/R4/bodytemp-definitions.html#Observation.value[x].code)                                     | UCUM                                                                                                                                                                                       |
| Body Height                           | Bodyheight definition                                         | <http://hl7.org/fhir/R4/bodyheight.html>                                                                                                      |                                                                                                                                                                                            |
|                                       | BodyheightCode.code                                           | [BodyHeightCode.code](http://hl7.org/fhir/R4/bodyheight-definitions.html#Observation.code.coding:BodyHeightCode.code)                         | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.value\[x\].code](http://hl7.org/fhir/R4/bodyheight-definitions.html#Observation.value[x].code)                                   | UCUM                                                                                                                                                                                       |
| Head Circumference                    | Headcircum Definition                                         | [headcircum](http://hl7.org/fhir/R4/headcircum.html)                                                                                          |                                                                                                                                                                                            |
|                                       | HeadcircumCode.code                                           | [HeadCircumCode.code](http://hl7.org/fhir/R4/headcircum-definitions.html#Observation.code.coding:HeadCircumCode.code)                         | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.value\[x\].code](http://hl7.org/fhir/R4/headcircum-definitions.html#Observation.value[x].code)                                   | UCUM                                                                                                                                                                                       |
| Body Weight                           | Bodyweight definition                                         | [bodyweight](http://hl7.org/fhir/R4/bodyweight.html)                                                                                          |                                                                                                                                                                                            |
|                                       | BodyweightCode.code                                           | [BodyWeightCode.code](http://hl7.org/fhir/R4/bodyweight-definitions.html#Observation.code.coding:BodyWeightCode.code)                         | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.value\[x\].code](http://hl7.org/fhir/R4/bodyweight-definitions.html#Observation.value[x].code)                                   | UCUM                                                                                                                                                                                       |
| Body Mass Index                       | bmi definition                                                | [bmi](http://hl7.org/fhir/R4/bmi.html)                                                                                                        |                                                                                                                                                                                            |
|                                       | bmiCode.code                                                  | [VSCat.coding.code](http://hl7.org/fhir/R4/bmi-definitions.html#Observation.category:VSCat.coding.code)                                       | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.value\[x\].code](http://hl7.org/fhir/R4/bmi-definitions.html#Observation.value[x].code)                                          | UCUM                                                                                                                                                                                       |
| Blood Pressure Systolic and Diastolic | bp definition                                                 | [bp](http://hl7.org/fhir/R4/bp.html)                                                                                                          |                                                                                                                                                                                            |
|                                       | bpCode.code                                                   | [BPCode.code](http://hl7.org/fhir/R4/bp-definitions.html#Observation.code.coding:BPCode.code)                                                 | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [Observation.component.value\[x\]](http://hl7.org/fhir/R4/bp-definitions.html#Observation.component.value[x])                                 |                                                                                                                                                                                            |
| Systolic Blood Pressure (Component)   | SystolicBP Component definition                               | <http://hl7.org/fhir/R4/bp.html>                                                                                                              |                                                                                                                                                                                            |
|                                       | SBPCode.code                                                  | [SystolicBP.code.coding:SBPCode.code](http://hl7.org/fhir/R4/bp-definitions.html#Observation.component:SystolicBP.code.coding:SBPCode.code)   | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [SystolicBP.valueQuantity.code](http://hl7.org/fhir/R4/bp-definitions.html#Observation.component:SystolicBP.valueQuantity.code)               | UCUM                                                                                                                                                                                       |
| Diastollc Blood Pressure (Component)  | DiastolicBP Component definition                              | [bp](http://hl7.org/fhir/R4/bp.html)                                                                                                          |                                                                                                                                                                                            |
|                                       | DBPCode.code                                                  | [DiastolicBP.code.coding:DBPCode.code](http://hl7.org/fhir/R4/bp-definitions.html#Observation.component:DiastolicBP.code.coding:DBPCode.code) | LOINC                                                                                                                                                                                      |
|                                       | Observation.value\[x\].code                                   | [DiastolicBP.valueQuantity.code](http://hl7.org/fhir/R4/bp-definitions.html#Observation.component:DiastolicBP.valueQuantity.code)             | UCUM                                                                                                                                                                                       |
{: .grid}

#### 8.4.6 Symptom

QDM defines “symptom” as an indication that a person has a condition or
disease. Some examples include headache, fever, fatigue, nausea,
vomiting, and pain. Also, symptoms are subjective manifestations of the
disease perceived by the patient. As an example to differentiate symptom
from finding, the patient’s subjective symptom of fever is distinguished
from the temperature (a finding). For a finding, there is either a
source of either a temperature-measuring device together with a recorder
of the device (electronically) or an individual (healthcare provider,
patient, etc.).

Note: Definitions regarding symptom on the FHIR condition resource
Boundaries and Relationships (Section 9.2.2:
<http://hl7.org/fhir/condition.html>):

  - \[The Condition\] resource is not typically used to record
    information about subjective and objective information that might
    lead to the recording of a Condition resource. Such signs and
    symptoms are typically captured using
    the [Observation](http://hl7.org/fhir/observation.html)resource;
    although in some cases a persistent symptom, e.g. fever, headache
    may be captured as a condition before a definitive diagnosis can be
    discerned by a clinician. By contrast, headache may be captured as
    an Observation when it contributes to the establishment of a
    meningitis Condition.

  - Use the [Observation](http://hl7.org/fhir/observation.html)resource
    when a symptom is resolved without long term management, tracking,
    or when a symptom contributes to the establishment of a condition.

  - Use Condition when a symptom requires long term management,
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

### 8.5 Care Goal

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
| Relevant Period    | [Goal.startDate](StructureDefinition-qicore-goal-definitions.html#Goal.startDate)                 |              |
|                    | [Goal.targetDue](StructureDefinition-qicore-goal-definitions.html#Goal.target.due[x])             |              |
| statusDate         | [Goal.statusDate](StructureDefinition-qicore-goal-definitions.html#Goal.statusDate)               |              |
| relatedTo          | [Goal.addresses](StructureDefinition-qicore-goal-definitions.html#Goal.addresses)                 |              |
| Performer          | [Goal.expressedBy](StructureDefinition-qicore-goal-definitions.html#Goal.expressedBy)             |              |
{: .grid}

### 8.6 Communication

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

| **QDM Context**              | **QI-Core R4**                                                                                                                                                  | **Comments**                                                                                  |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| **Communication, Performed** | [Communication](StructureDefinition-qicore-communication.html)                                                                         |                                                                                               |
|                              | [Communication.status](StructureDefinition-qicore-communication-definitions.html#Communication.status)             | consider constraining to in-progress, completed, on-hold                                      |
| **QDM Attributes**           |                                                                                                                                                                 |                                                                                               |
| Code                         | [Communication.reasonCode](StructureDefinition-qicore-communication-definitions.html#Communication.reasonCode)     |                                                                                               |
| id                           | [Communication.id](StructureDefinition-qicore-communication-definitions.html#Communication.id)                     |                                                                                               |
| category                     | [Communication.category](StructureDefinition-qicore-communication-definitions.html#Communication.category)         | alert, notification, reminder, instruction                                                    |
| medium                       | [Communication.medium](StructureDefinition-qicore-communication-definitions.html#Communication.medium)             |                                                                                               |
| sent dateTime                | [Communication.sent](StructureDefinition-qicore-communication-definitions.html#Communication.sent)                 |                                                                                               |
| received dateTime            | [Communication.received](StructureDefinition-qicore-communication-definitions.html#Communication.received)          |                                                                                               |
| author dateTime              | N/A                                                                                                                                                             | No timing exists in FHIR to address timing of negation (i.e., Communication.status = not-done |
| relatedTo                    | [Communication.basedOn](StructureDefinition-qicore-communication-definitions.html#Communication.basedOn)           | An order, proposal or plan fulfilled in whole or in part by this Communication.               |
|                              | [Communication.inResponseTo](StructureDefinition-qicore-communication-definitions.html#Communication.inResponseTo) | Response to a communication                                                                   |
| sender                       | [Communication.sender](StructureDefinition-qicore-communication-definitions.html#Communication.sender)             |                                                                                               |
| recipient                    | [Communication.recipient](StructureDefinition-qicore-communication-definitions.html#Communication.recipient)       |                                                                                               |
| negation rationale           | [Communication.status](StructureDefinition-qicore-communication-definitions.html#Communication.status)             | Constrain status to "not-done"                                                                |
|                              | [Communication.statusReason](StructureDefinition-qicore-communication-definitions.html#Communication.statusReason) |                                                                                               |
{: .grid}

### 8.7 Condition – Diagnosis – Problem

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

### 8.8 Device

QDM defines Device as an instrument, apparatus, implement, machine,
contrivance, implant, in-vitro reagent, or other similar or related
article, including a component part or accessory, intended for use in
the diagnosis, cure, mitigation, treatment, or prevention of disease and
not dependent on being metabolized to achieve any of its primary
intended purposes.

FHIR defines the [Device Resource](http://hl7.org/fhir/R4/device.html)
as a type of a manufactured item that is used in the provision of
healthcare without being substantially changed through that activity.
The device may be a medical or non-medical device. Devices differ from
medications because they are not "used up" - they remain active in a
patient in an ongoing fashion. However, the specific boundary between
medications and devices is defined at the implementation level and this
standard does not enforce a boundary with the exception of devices that
are implanted in a patient.
The [Medication](http://hl7.org/fhir/R4/medication.html) resource
should not be used to represent implanted devices.

Documented evidence of a device may exist in a clinical record in
various ways:

  - A provider may document placement of a device as an intervention or
    procedure (e.g., the QDM datatypes Intervention, Performed, or
    Procedure, Performed).

      - QDM Example: Procedure, Performed: Pacemaker insertion.

  - The provider may document presence of the device as a finding,
    perhaps including the finding on the problem list. QDM Example:
    Diagnosis: Pacemaker present, or Assessment, Performed: Pacemaker
    present.

  - A provider may also document the device in a specific device use
    statement or assessment.

      - Example: QDM Device, Applied: Trans-telephonic monitoring of
        pacemaker assessment. Note that some current uses of the QDM
        datatype “Device, Applied” references the procedure to “apply”
        the device (i.e., to use for the patient, to use on the
        patient’s body, or to implant in the patient’s body). Each of
        these current uses actually reference a procedure to place the
        device which might more effectively reference the Procedure
        resource.

Thus, specific actions may reference the Device Resource, for example a
Procedure, an Observation, a Condition, a DeviceUseStatement, a
DeviceRequest, an AdverseEvent and others.

Given the variation in determining evidence of device usage, a measure
developer may need to include multiple queries (or retrieves) to assure
capture of all devices present in the measure population.

Note that the current use of the QDM datatype “Device, Applied” usually
references the procedure to “apply” the device (i.e., to use for the
patient, to use on the patient’s body, or to implant in the patient’s
body). Each of these current uses should address the concept using the
QDM datatypes, Intervention, Performed, or Procedure, Performed.

1.  The original intent of the QDM datatype “Device, Applied” was to
    reference the specific device or type of device of concern to the
    measure. And that reference might be as detailed a providing a
    device class as referenced in a Unique Device Identifier (UDI). The
    US-Core Device resource
    (<http://hl7.org/fhir/us/core/StructureDefinition-us-core-device.html>)
    does have metadata elements for:

    1.  full UDI carrier, Automatic Identification and Data Capture
        (AIDC)
        (<http://hl7.org/fhir/us/core/StructureDefinition-us-core-device-definitions.html#Device.udiCarrier.carrierAIDC>),
        and

    2.  full UDI carrier as the human readable form (HRF) of the barcode
        string on the device packaging
        (<http://hl7.org/fhir/us/core/StructureDefinition-us-core-device-definitions.html#Device.udiCarrier.carrierHRF>).

2.  The FHIR Resource DeviceUseStatement
    (<http://hl7.org/fhir/deviceusestatement.html>) is defined as "A
    record of a device being used by a patient where the record is the
    result of a report from the patient or another clinician." It is an
    event resource from a FHIR workflow perspective. Feedback at the
    Atlanta September WGM suggests that the QDM concept of Device,
    Applied best fits with the QI-Core Procedure Resource. 

#### 8.8.1 Device, Applied

<table class="list">
<thead>
<tr class="header">
<th><strong>QDM Context</strong></th>
<th><strong>QI-Core R4</strong></th>
<th><strong>Comments</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Device, Applied</strong></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure">Procedure</a></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.status">Procedure.status</a></td>
<td>Constrain to "completed" (to reference the QDM concept of negation rationale, use status = not=done)</td>
</tr>
<tr class="odd">
<td><strong>QDM Attributes</strong></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Code</td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.code">Procedure.code</a></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.category">Procedure.category</a></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.focalDevice.manipulated">Procedure.focalDevice.manipulated</a></td>
<td>The device that was manipulated (changed) during the procedure. (reference QI-Core Device)</td>
</tr>
<tr class="odd">
<td></td>
<td><ul>
<li><blockquote>
<p><a href="StructureDefinition-qicore-device-definitions.html#Device.udiCarrier.deviceIdentifier">Device.udiCarrier.deviceIdentifier</a></p>
</blockquote></li>
</ul></td>
<td>The device identifier (DI) is a mandatory, fixed portion of a UDI that identifies the labeler and the specific version or model of a device.</td>
</tr>
<tr class="even">
<td></td>
<td><ul>
<li><p><a href="StructureDefinition-qicore-device-definitions.html#Device.udiCarrier.carrierHRF">Device.udiCarrier.carrierHRF</a></p></li>
</ul></td>
<td>The full UDI carrier as the human readable form (HRF) representation of the barcode string as printed on the packaging of the device.</td>
</tr>
<tr class="odd">
<td></td>
<td><ul>
<li><blockquote>
<p><a href="StructureDefinition-qicore-device-definitions.html#Device.udiCarrier.carrierAIDC">Device.udiCarrier.carrierAIDC</a></p>
</blockquote></li>
</ul></td>
<td>The full UDI carrier of the Automatic Identification and Data Capture (AIDC) technology representation of the barcode string as printed on the packaging of the device - e.g., a barcode or RFID. Because of limitations on character sets in XML and the need to round-trip JSON data through XML, AIDC Formats <em>SHALL</em> be base64 encoded.</td>
</tr>
<tr class="even">
<td></td>
<td><ul>
<li><p><a href="StructureDefinition-qicore-device-definitions.html#Device.type">Device.type</a></p></li>
</ul></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.focalDevice.action">Procedure.focalDevice.action</a></td>
<td>The kind of change that happened to the device during the procedure.</td>
</tr>
<tr class="even">
<td></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.focalDevice.id">Procedure.focalDevice.id</a></td>
<td></td>
</tr>
<tr class="odd">
<td>id</td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.id">Procedure.id</a></td>
<td></td>
</tr>
<tr class="even">
<td>Anatomical Location Site</td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.bodySite">Procedure.bodySite</a></td>
<td></td>
</tr>
<tr class="odd">
<td>Reason</td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.reasonCode">Procedure.reasonCode</a></td>
<td></td>
</tr>
<tr class="even">
<td>Negation Rationale</td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.status">Procedure.status</a></td>
<td>Constrain to not=done for the QDM concept of negation rationale</td>
</tr>
<tr class="odd">
<td></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.statusReason">Procedure.statusReason</a></td>
<td></td>
</tr>
<tr class="even">
<td>Relevant dateTime</td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x]">Procedure.performed[x] dateTime</a></td>
<td></td>
</tr>
<tr class="odd">
<td>Relevant Period</td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x]">Procedure.performed[x] Period</a></td>
<td></td>
</tr>
<tr class="even">
<td>Author dateTime</td>
<td></td>
<td>Required for timing of negation rationale - Not currently present in QI-Core</td>
</tr>
<tr class="odd">
<td>Performer</td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.performer.actor">Procedure.performer.actor</a></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.recorder">Procedure.recorder</a></td>
<td>Individual who recorded the record and takes responsibility for its content.</td>
</tr>
<tr class="odd">
<td></td>
<td><a href="StructureDefinition-qicore-procedure-definitions.html#Procedure.asserter">Procedure.asserter</a></td>
<td>Individual who is making the procedure statement.</td>
</tr>
</tbody>
</table>

#### 8.8.2 Device, Order

| **QDM Context**         | **FHIR R4**                                                                                                                                                                  | **Comments**                                                                                                                                                                                                                                                                                                                                                      |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Device Request**      | [DeviceRequest](StructureDefinition-qicore-devicerequest.html)                                           |                                                                                                                                                                                                                                                                                                                                                                   |
|                         | [DeviceRequest.status](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.status)                                 | Constrain to active, on-hold, completed                                                                                                                                                                                                                                                                                                                           |
| **Device, Recommended** | [DeviceRequest.intent](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.intent)                                 | Constrain to "plan"                                                                                                                                                                                                                                                                                                                                               |
| **Device, Order**       | [DeviceRequest.intent](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.intent)                                 | Constrain to "Order" (include children)                                                                                                                                                                                                                                                                                                                           |
| **QDM Attributes**      |                                                                                                                                                                              |                                                                                                                                                                                                                                                                                                                                                                   |
| Code                    | [DeviceRequest.code\[x\]](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.code[x])                                                                          |                                                                                                                                                                                                                                                                                                                                                                   |
| id                      | [DeviceRequest.id](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.id)                                         |                                                                                                                                                                                                                                                                                                                                                                   |
| Reason                  | [DeviceRequest.reasonCode](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.reasonCode)                         | Reason or justification for the use of this device.                                                                                                                                                                                                                                                                                                               |
| Author dateTime         | [DeviceRequest.authoredOn](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.authoredOn)                         |                                                                                                                                                                                                                                                                                                                                                                   |
| Negation Rationale      | [DeviceRequest.extension:doNotPerform](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.extension:doNotPerform) | The attributes provided with the request qualify what is not to be done. For example, if an effectiveTime is provided, the "do not" request only applies within the specified time. If a performerType is specified then the "do not" request only applies to performers of that type. Qualifiers include: code, subject, occurrence, perormerType and performer. |
|                         | [DeviceRequest.occurrence\[x\]](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.occurrence[x])             | The timing schedule for the use of the device. The Schedule data type allows many different expressions, for example. "Every 8 hours"; "Three times a day"; "1/2 an hour before breakfast for 10 days from 23-Dec 2011:"; "15 Oct 2013, 17 Oct 2013 and 1 Nov 2013".                                                                                              |
|                         | DeviceRequest.extension:doNotPerform.reason                                                                                                                                  | ServiceRequest includes a reason code, but not a doNotPerformReason. Consider: [DeviceRequest.supportingInfo](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.supportingInfo) (Type is Reference)                                                                                                   |
| Requester               | [DeviceRequest.requester](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.requester)                           |                                                                                                                                                                                                                                                                                                                                                                   |
{: .grid}

### 8.9 Encounter

QDM defines Encounter as an identifiable grouping of healthcare-related
activities characterized by the entity relationship between the subject
of care and a healthcare provider; such a grouping is determined by the
healthcare provider. A patient encounter represents interaction between
a healthcare provider and a patient with a face-to-face patient visit to
a clinician’s office, or any electronically remote interaction with a
clinician for any form of diagnostic treatment or therapeutic event.

#### 8.9.1 Encounter Timing

Implementation considerations must be considered when referencing
encounter periods (start to end time).  Some clinical sites may leave
Encounters "open" until all documentation has been completed which may
take 72 hours or more.  However, the actual encounter may have lasted
for a much shorter time period (e.g., 15 minutes for an ambulatory
encounter). This issue is addressed in The Office of the National
Coordinator for Health IT (ONC) Issue Tracking System as item
[QDM-235](https://oncprojectracking.healthit.gov/support/projects/QDM/issues/QDM-235?filter=recentlyviewed).
Two approaches clinical sites have used to manage this issue include:

  - Include a patient check-in and check-out time as part of the visit
    documentation. These times represent when the patient arrives and
    leaves, respectively, and these times are used for the Encounter
    relevant period. However, patient arrival at a location does not
    necessarily mean the start of the encounter (e.g. a patient arrives
    an hour earlier than he or she is actually seen by a practitioner).

  - Default an Encounter end as 23:59 on the date of the Encounter date
    if it is left open to allow completion of documentation and update
    the end time if the practitioner closing the chart enters a specific
    time that the encounter ended.

Undoubtedly, other clinical sites have implemented other solutions to
documenting end times for ambulatory visits. Quality measure and
clinical decision support (CDS) artifact authors should consider such
issues when testing the validity and reliability of retrieved responses
to data queries.

#### 8.9.2 Encounter-Related Diagnoses and Procedures

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

  - *Principal diagnosis* is defined as the condition that, after study,
    was determined to be the principal cause of the admission. QDM
    version 5.5 addresses that concept using the US-Core concepts
    Encounter.diagnosis.use value=*billing* with an *diagnosis.rank=1.*

  - *Present on admission* (POA) is an indicator assigned to Inpatient
    Encounter diagnoses and is used in quality and patient safety
    measures. QDM version 5.5 references this indicator as a component
    of each Encounter, Performed *diagnosis* The US-Core and FHIR
    Encounter resources do not address *present on admission.* However,
    the [FHIR Claim](http://hl7.org/fhir/claim.html) resource includes a
    [claim.diagnosis.onAdmission](http://hl7.org/fhir/claim-definitions.html#Claim.diagnosis.onAdmission)
    element referencing [similar
    terms](http://hl7.org/fhir/valueset-ex-diagnosis-on-admission.html)
    as the US UB-04 claim form to indicate *present on admission* – yes
    (y), no (n), unknown (u), and undetermined (w). QI-Core includes an
    extension on Encounter.diagnosis to reference the onAdmission
    element, thus enabling specification of an Encounter.diagnosis that
    is present on admission.

  - *Principal procedure* is the procedure performed for definitive
    treatment rather than diagnostic or exploratory purposes, or which
    is necessary to take care of a complication.

 \[<https://manual.jointcommission.org/releases/TJC2015B/DataElem0685.html>\]

*Principal procedure* defines a procedures relationship to an encounter
(most often an inpatient encounter). It has not relationship to the
inherent nature of the procedure. Therefore, QI-Core includes an
extension modeling Encounter.procedure in the same way as
Encounter.diagnosis. The Encounter.procedure has a *code* to indicate
the procedure code and a *rank* to indicate its ordinality such that
*rank*=1 identifies the procedure as a *principal procedure.*

  - *Elective procedure* is another concept used in quality measurement,
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

#### 8.9.3 Encounter, Performed

| **QDM Context**                    | **QI-Core R4**                                                                                                                                                                                      | **Comments**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Encounter, Performed**           | [Encounter](StructureDefinition-qicore-encounter.html)                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                                    | [Encounter.status](StructureDefinition-qicore-encounter-definitions.html#Encounter.status)                                                             | consider constraint to - arrived, triaged, in-progress, on-leave, finished                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|                                    | [Encounter.type](StructureDefinition-qicore-encounter-definitions.html#Encounter.type)                                                                 | type of service by CPT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **QDM Attribute**                  |                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Code                               | [Encounter.class](StructureDefinition-qicore-encounter-definitions.html#Encounter.class)                                                               | ambulatory, ED, inpatient, etc.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| id                                 | [Encounter.id](StructureDefinition-qicore-encounter-definitions.html#Encounter.id)                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Relevant Period                    | [Encounter.period](StructureDefinition-qicore-encounter-definitions.html#Encounter.period)                                                             | start and end time of encounter                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Diagnoses                          |                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Diagnosis (code)                   | [Encounter.diagnosis.condition](StructureDefinition-qicore-encounter-definitions.html#Encounter.diagnosis.condition)                                   | can be used for coded diagnoses                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| PresentOnAdmissionIndicator (code) |                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Rank (Integer)                     | [Encounter.diagnosis.rank](StructureDefinition-qicore-encounter-definitions.html#Encounter.diagnosis.rank)                                             | for each diagnosis role                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Procedures                         |                                                                                                                                                                                                     | Currently referenced as Procedure.priority in QDM 5.5. Principal procedures are more appropriately managed as Encounter.procedures; Elective procedures are more appropriately managed using Encounter.priority = elective with Encounter.procedure.rank =1.                                                                                                                                                                                                                                                                                                                                                    |
|                                    | [Encounter.procedure.type](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:type)                                                                                                                                                                             |Whether the procedure was primary or secondary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                                    | [Encounter.procedure.rank](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank)                                                                                                                                                                        |The ranking of the procedure within the encounter                                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                                    | [Encounter.procedure.procedure](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:procedure)                                                                                                                                                                            |A reference to the procedure that was performed                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Length of Stay                     | [Encounter.length](StructureDefinition-qicore-encounter-definitions.html#Encounter.length)                                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Negation Rationale                 | Not Addressed                                                                                                                                                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Author dateTime                    | Not Addressed                                                                                                                                                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Admission Source                   | [Encounter.hospitalization.admitSource](StructureDefinition-qicore-encounter-definitions.html#Encounter.hospitalization.admitSource)                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Discharge Disposition              | [Encounter.hospitalization.dischargeDisposition](StructureDefinition-qicore-encounter-definitions.html#Encounter.hospitalization.dischargeDisposition) | E.g., home, hospice, long-term care, etc.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                                    | Encounter.hospitalizaton.destination                                                                                                                                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Facility Locations                 |                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| code                               | [Encounter.location.location](StructureDefinition-qicore-encounter-definitions.html#Encounter.location.location)                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| location period                    | [Encounter.location.period](StructureDefinition-qicore-encounter-definitions.html#Encounter.location.period)                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Participant                        | [Encounter.participant.individual](StructureDefinition-qicore-encounter-definitions.html#Encounter.participant.individual)                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
{: .grid}

### 8.10 Family History

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
| author dateTime    | [FamilyMemberHistory.date](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.date)                     |                                 |
| relationship       | [FamilyMemberHistory.relationship](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.relationship)     |                                 |
| recorder           | N/A                                                                                                                                                                                   |                                 |
{: .grid}

### 8.11 Immunization

QDM defines Immunization as vaccines administered to patients in
healthcare settings but does not include non-vaccine agents. The [FHIR
Immunization
Recommendation](http://hl7.org/fhir/immunizationrecommendation.html)
resource is specifically designed to provide an immunization forecast
from a forecasting engine to a provider, basically to carry clinical
decision support recommendations specific to immunizations and,
therefore, is not consistent with the intent of the QDM datatype
"Immunization, Order" or “Immunization, Administered.” The FHIR
[Immunization
Evaluation](http://hl7.org/fhir/immunizationevaluation.html) references
an appraisal of an immunization that was administered to determine if it
is valid with respect to the expected immunization schedule. The
[US-Core
Immunization](http://hl7.org/fhir/us/core/StructureDefinition-us-core-immunization.html)
profile is most consistent with the QDM datatype *Immunization,
Administered*.  The mapping tables provided include mapping from QDM
*Immunization, Administered* and a reference to the FHIR [Immunization
Evaluation](http://hl7.org/fhir/immunizationevaluation.html) resource.
Note, the mapping table includes additional metadata about immunizations
that QDM does not address, but that may be relevant to quality measures
or clinical decision support (CDS) artifacts.

To address the QDM datatype *Immunization, Order* see Medication, Order
which references MedicationRequest, the most consistent FHIR resource
with the intent.

#### 8.11.1 Immunization, Administered

| **QDM Context**                | **USCore R4**                                                                                                                                                    | **Comments**                                       |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| **Immunization, Administered** | [Immunization](StructureDefinition-qicore-immunization.html)                                                                            |                                                    |
|                                | [Immunization.status](StructureDefinition-qicore-immunization-definitions.html#Immunization.status)                 | Constrain to Completed, entered-in-error, not-done |
| **QDM Attributes**             |                                                                                                                                                                  |                                                    |
| code                           | [Immunization.vaccineCode](StructureDefinition-qicore-immunization-definitions.html#Immunization.vaccineCode)       |                                                    |
| id                             | [Immunization.id](StructureDefinition-qicore-immunization-definitions.html#Immunization.id)                         |                                                    |
| Dosage                         | [Immunization.doseQuantity](StructureDefinition-qicore-immunization-definitions.html#Immunization.doseQuantity)     |                                                    |
| Negation Rationale             | [Immunization.status](StructureDefinition-qicore-immunization-definitions.html#Immunization.status)                 | Constrain to not-done                              |
|                                | [Immunization.statusReason](StructureDefinition-qicore-immunization-definitions.html#Immunization.statusReason)     |                                                    |
| Route                          | [Immunization.route](StructureDefinition-qicore-immunization-definitions.html#Immunization.route)                   |                                                    |
| Reason                         | [Immunization.reasonCode](StructureDefinition-qicore-immunization-definitions.html#Immunization.reasonCode)         |                                                    |
| Relevant dateTime              | [Immunization.occurrence\[x\]](StructureDefinition-qicore-immunization-definitions.html#Immunization.occurrence[x]) |                                                    |
| author dateTime                | [Immunization.recorded](StructureDefinition-qicore-immunization-definitions.html#Immunization.recorded)             |                                                    |
| Performer                      | [Immunization.performer.actor](StructureDefinition-qicore-immunization-definitions.html#Immunization.performer)     |                                                    |
{: .grid}

### 8.12 Individual Characteristics

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

  - QI-Core also includes extensions to reference a patient military
    service, nationality or if the patient is a cadaveric donor (i.e.,
    has agreed to be an organ donor). None of these elements is included
    as metadata elements in FHIR or US-Core. While they might be
    referenced as observations about a patient, QI-Core includes them as
    specific patient metadata.

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

#### 8.12.1 QDM Entities

| **QDM Entities & Attributes** | **QI-Core R4**                                                                                                                                                                      | **Comment**    |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| **Patient**                   | [Patient](StructureDefinition-qicore-patient.html)                                                                                                         |                |
| identifier                    | [Patient.identifier](StructureDefinition-qicore-patient-definitions.html#Patient.identifier)                                           |                |
| id                            | [Patient.id](StructureDefinition-qicore-patient-definitions.html#Patient.id)                                                           |                |
| **Care Partner**              | [RelatedPerson](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-relatedperson)                                                                                             | Related Person |
| Identifier                    | [RelatedPerson.identifier](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.identifier)                         |                |
| id                            | [RelatedPerson.id](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.id)                                         |                |
| **Relationship**              | [RelatedPerson.relationship](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.relationship)                     |                |
| **Practitioner**              | [Practitioner](StructureDefinition-qicore-practitioner.html)                                                                                               |                |
| identifier                    | [Practitioner.identifierValue](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.identifier:npislice.value)        |                |
| id                            | [Practitioner id](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.id)                                            |                |
| role                          | [Practitioner role](StructureDefinition-qicore-practitionerrole.html)                                                                                      |                |
| specialty                     | [Practitioner specialty](StructureDefinition-qicore-practitionerrole-definitions.html#PractitionerRole.specialty:specialty)            |                |
| qualification                 | [Practitioner.qualificationIdentifier](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.qualification.identifier) |                |
| **Organization**              | [Organization](StructureDefinition-qicore-organization.html)                                                                                               |                |
| identifier                    | [Organization.identifier.value](StructureDefinition-qicore-organization-definitions.html#Organization.identifier.value)                |                |
| id                            | [Organization.id](StructureDefinition-qicore-organization-definitions.html#Organization.id)                                            |                |
| type                          | [Organization.type](StructureDefinition-qicore-organization-definitions.html#Organization.identifier.type)                             |                |
{: .grid}

#### 8.12.2 Patient Characteristics

| **QDM Attribute**                    | **USCore R4**                                                                                                                                                                   | **Comments**                                                                                                    |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| **Race**                             |                                                                                                                                                                                 |                                                                                                                 |
| code                                 | [Patient.race](StructureDefinition-qicore-patient-definitions.html#Patient.extension:race)                                         |                                                                                                                 |
| code                                 | Patient.ExtensionRace-DetailedRace                                                                                                                                              |                                                                                                                 |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| **Ethnicity**                        |                                                                                                                                                                                 |                                                                                                                 |
| code                                 | [Patient.ethnicity](StructureDefinition-qicore-patient-definitions.html#Patient.extension:ethnicity)                               |                                                                                                                 |
| code                                 | Patient.ExtensionEthnicity-Detailed                                                                                                                                             |                                                                                                                 |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| **Sex**                              |                                                                                                                                                                                 |                                                                                                                 |
| code                                 | [Patient.birthsex](StructureDefinition-qicore-patient-definitions.html#Patient.extension:birthsex)                                 |                                                                                                                 |
| code                                 | [Patient.administrativeGender](StructureDefinition-qicore-patient-definitions.html#Patient.gender)                                 |                                                                                                                 |
| id                                   |                                                                                                                                                |                                                                                                                 |
| **Birth date**                       |                                                                                                                                                |                                                                                                                 |
| Birth dateTime                       | [Patient.birthdate](StructureDefinition-qicore-patient-definitions.html#Patient.birthDate)                                         |                                                                                                                 |
| code                                 | [Birth date](StructureDefinition-qicore-patient-definitions.html#Patient.birthDate)                                                | Fixed Code 21112-8                                                                                              |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| **Clinical Trial Participant**       |                                                                                                                                                                                 |                                                                                                                 |
|                                      | [Patient.extension.clinicalTrial](StructureDefinition-qicore-patient-definitions.html#Patient.extension:clinicalTrial)             |                                                                                                                 |
|                                      | [Patient.extension.clinicalTrial.id](StructureDefinition-qicore-patient-definitions.html#Patient.extension:clinicalTrial.value[x]) |                                                                                                                 |
| Code                                 | [Patient.extension:clinicalTrial.url](StructureDefinition-qicore-patient-definitions.html#Patient.extension:clinicalTrial.url)     |                                                                                                                 |
| Relevant Period                      | Patient.extension.clinicalTrial.period.valuePeriod                                                                                                                              |                                                                                                                 |
| Reason                               | Patient.extension.clinicalTrial.reason.url                                                                                                                                      |                                                                                                                 |
|                                      | Patient.extension.clinicalTrial.reason.valueCodeableConcept                                                                                                                     |                                                                                                                 |
| **Expired**                          |                                                                                                                                                                                 |                                                                                                                 |
| code                                 | [Patient.Deceased\[x\]](StructureDefinition-qicore-patient-definitions.html#Patient.deceased[x])                                   |                                                                                                                 |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| cause                                |                                                                                                                                                                                 | Expiration cause requires use of Observation                                                                    |
| expiration dateTime                  |                                                                                                                                                                                 | Expiration dateTime requires use of Observation                                                                 |
| **Payer**                            |                                                                                                                                                                                 |                                                                                                                 |
| Payor                                | [Coverage](StructureDefinition-qicore-coverage.html)                                                                                                   |                                                                                                                 |
| code                                 | [Coverage.payor](StructureDefinition-qicore-coverage-definitions.html#Coverage.payor)                                              | QICore currently maps to policy holder which actually references the person who owns the policy, not the payor. |
| Relevant Period                      | [Coverage.period](StructureDefinition-qicore-coverage-definitions.html#Coverage.period)                                            |                                                                                                                 |
| id                                   | [Coverage.id](StructureDefinition-qicore-coverage-definitions.html#Coverage.id)                                                    |                                                                                                                 |
| **Patient Characteristic (generic)** |                                                                                                                                                                                 |                                                                                                                 |
| N/A                                  |                                                                                                                                                                                 | Requires definition for modeling a characteristic to QI-Core and FHIR                                           |
{: .grid}

#### 8.12.3 QDM new *datatype* (QDM v5.5) - Related Person

| **QDM Attribute**             | **QI-Core R4**                                                                                                                                                  | **Comments** |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **Related Person**            |                                                                                                                                                                 |              |
| Related Person                | [RelatedPerson](http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-relatedperson)                                                                         |              |
| RelatedPerson.Identifier      | [RelatedPerson.identifier](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.identifier)     |              |
| id                            | [RelatedPerson.id](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.id)                     |              |
| RelatedPerson.linkedPatientId | RelatedPerson.linkedPatientid                                                                                                                                   |              |
| Code                          | [RelatedPerson.relationship](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.relationship) |              |
{: .grid}

### 8.13 Intervention and Procedure

QDM defines Intervention and Procedure as:

  - *Intervention* is a course of action intended to achieve a result in
    the care of persons with health problems that does not involve
    direct physical contact with a patient. Examples include patient
    education and therapeutic communication.

  - *Procedure* is an act whose immediate and primary outcome
    (post-condition) is the alteration of the physical condition of the
    subject. A *procedure* may be a surgery or other type of physical
    manipulation of a person’s body in whole or in part for purposes of
    making observations and diagnoses or providing treatment.

#### 8.13.1 Procedure Vs Intervention

FHIR references both of these concepts using the *Procedure* resource,
specifically noting a process that involves verification of the
patient's comprehension or to change the patient's mental state would be
a Procedure. Therefore, both QDM *datatypes*, Procedure and Intervention
are included in this section of the QDM to QI-Core mapping especially
since all of the QDM attributes for each of these QDM *datatypes* are
identical.

#### 8.13.2 Procedure Vs Task

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

#### 8.13.3 Procedure Priority

QDM 5.5 includes a new attribute for Procedure: *priority* with the
following definition:

*Priority indicates the urgency of the procedure or the encounter
referenced. In \[electronic clinical quality measures\] (eCQMs) the
priority attribute will help specify elective from urgent encounters
(e.g., hospital admissions) or procedures. Priority is a codable concept
(i.e., may use a direct reference code or a value set). For example,
priority is used to express an elective procedure or encounter from an
emergency procedure or encounter.*

As noted in the QDM to QI-Core Mapping for Encounter-Related Diagnoses
and Procedures, a specific measure may have interest in evaluating care
provided for elective procedures (e.g., hip surgery due to
osteoarthritis) while excluding emergency, non-planned procedures (e.g.,
hip surgery due to acute fracture). The procedure code does not
necessarily allow differentiation of the two concepts. A
ServiceRequest.priority does have the ability to differentiate the
urgency with which the *request* (or order) should be fulfilled.
However, there is no element within the FHIR Procedure resource to
address the issue. Encounter.priority allows specification of whether
the encounter is elective. An encounter with Encounter.priority =
*elective* and an
Encounter.procedure.rank = 1 addresses the need to specify an elective
encounter with a principal procedure. Therefore, based on the current
use case QI-Core has not added an extension to address
Procedure.priority and, as a result, there is no direct mapping from the
QDM Procedure priority attribute to QI-Core.

| **QDM Context**                                      | **QI-Core R4**                                                                                                                                                                  | **Comments**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Procedure, Performed and Intervention, Performed** | [Procedure](StructureDefinition-qicore-procedure.html)                                                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Procedure, Performed Context                         | [Procedure.category](StructureDefinition-qicore-procedure-definitions.html#Procedure.category)                                     | Helps differentiate "intervention" from "procedure" from QDM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| QDM Attributes                                       |                                                                                                                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| status                                               | [Procedure.status](StructureDefinition-qicore-procedure-definitions.html#Procedure.status)                                         | constrain to "completed"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Code                                                 | [Procedure.code](StructureDefinition-qicore-procedure-definitions.html#Procedure.code)                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                                                      | [Procedure.category](StructureDefinition-qicore-procedure-definitions.html#Procedure.category)                                     | Helps differentiate "intervention" from "procedure" from QDM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| id                                                   | [Procedure.id](StructureDefinition-qicore-procedure-definitions.html#Procedure.id)                                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Method                                               | N/A                                                                                                                                                                             | Procedure.method does not exist in FHIR. Rather than create an extension, QI-Core's approach is to assume the Procedure.code includes reference to the method.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Rank                                                 |                                                                                                                                                                                 | Referenced as attributes of Encounter (Encounter.rank). Consider extension for Procedure.sequence to be consistent with the FHIR Claim resource includes a Claim.procedure.sequence used to uniquely identify procedure entries. Claim.procedure.type  provides a relative ranking with two example concepts - primary (the first procedure in a series to produce an overall patient outcome) and secondary the second procedure in a series required to product an overally patient outcome). However, type refers to procedures within a serier for which one is first. Such a sequence does not assure that the first procedure is the principal procedure for an encounter. |
| Priority                                             |                                                                                                                                                                                 | Referenced as Encounter.priority to determine the elective nature of a procedure (i.e., a principal procedure performed as part of an encounter in which Encounter.priority=elective.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Anatomical Location Site                             | [Procedure.bodySite](StructureDefinition-qicore-procedure-definitions.html#Procedure.bodySite)                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Reason                                               | [Procedure.reasonCode](StructureDefinition-qicore-procedure-definitions.html#Procedure.reasonCode)                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Result                                               | [Procedure.report](StructureDefinition-qicore-procedure-definitions.html#Procedure.report)                                         | Procedure.report references DiagnosticReport, DocumentReference, Composition (histology result, pathology report, surgical report, etc.). However, based on feedback regarding the use of the Observation resource, a procedure result might be better referenced as an Observation that includes the element Observation.partOf to reference the procedure to which it applies.                                                                                                                                                                                                                                                                                                 |
|                                                      | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Negation Rationale                                   | [Procedure.status](StructureDefinition-qicore-procedure-definitions.html#Procedure.status)                                         | constrain status to "Not-done"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|                                                      | [Procedure.statusReason](StructureDefinition-qicore-procedure-definitions.html#Procedure.statusReason)                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Relevant dateTime                                    | [Procedure.performed\[x\] dateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Relevant Period                                      | [Procedure.performed\[x\] Period](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Incision dateTime                                    | [Procedure.extension:incisionDateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.extension:incisionDateTime) |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Author dateTime                                      | N/A                                                                                                                                                                             | The concept "author" requires a reference to a report about the procedure or about an indication the procedure was not performed.  Therefore, the procedure resource does not have a reference to author dateTime. Author dateTime can reference a report about the procedure or an observation describing that result (e.g., Observation with metadata Observation.partOf procedure).                                                                                                                                                                                                                                                                                           |
| Components                                           | N/A                                                                                                                                                                             | Procedure does not include components and the concept of components references a observation that is a result of the procedure (Observation.partOf) for which that observation has components consistent with the Observation component modeling recommendation in FHIR.                                                                                                                                                                                                                                                                                                                                                                                                         |
| Component code                                       | N/A                                                                                                                                                                             | N/A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Component result                                     | N/A                                                                                                                                                                             | N/A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Performer                                            | [Procedure.performer](StructureDefinition-qicore-procedure-definitions.html#Procedure.performer)                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
{: .grid}

### 8.14 Medication

QDM defines Medication as clinical drugs or chemical substances intended
for use in the medical diagnosis, cure, treatment, or prevention of
disease. Medications are defined as direct referenced values or value
sets containing values derived from code systems such as RxNorm. QDM
defines five contexts for Medication, each of which is listed below
referencing the US-Core or FHIR resource which provides the expected
context:

#### 8.14.1 Medication, Active

This QDM context correlates with a medication on a patient’s active
medication list and thus it maps to MedicationStatement. Note that
MedicationStatement does not include reference to the QDM attributes
*route* or *frequency* or *recorder.* These attributes may be important
if the medication list is the only source of information about
medication usage and quality measures or clinical decision support (CDS)
expressions need to assess total daily dosage or cumulative dose over
time. Ordered medications (MedicationRequest) or dispensed medications
(MedicationDispense) or administered medications
(MedicationAdminstration) represent alternative mechanisms to determine
such information.

| **QDM Context**            | **QI-Core R4**                                                                                                                                                                                                                                   | **Comments**                                                                                                                                                  |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Active**     | [MedicationStatement](StructureDefinition-qicore-medicationstatement.html) |                                                                                                                                                               |
| Medication, Active context | [MedicationStatement.status](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.status)                                                                                   | Constrain to "active"                                                                                                                                         |
|                            | [MedicationStatement.category](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.category)                                                                               | inpatient, outpatient, community, patient-specified                                                                                                           |
|                            | [MedicationStatement.basedOn](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.basedOn)                                                                                 | A plan, proposal or order that is fulfilled in whole or in part by this event                                                                                 |
|                            | [MedicationStatement.derivedFrom](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.derivedFrom)                                                                         | Allows linking of the MedicationStatement to the underlying MedicationRequest or other information that supports or is used to derive the MedicationStatement |
| **QDM Attribute**          |                                                                                                                                                                                                                                                  |                                                                                                                                                               |
| code                       | [MedicationStatement.medication\[x\]](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.medication[x])                                                               |                                                                                                                                                               |
| id                         | [MedicationStatement.id](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.id)                                                                                           |                                                                                                                                                               |
| dosage                     | [MedicationStatement.dosage](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.dosage)                                                                                   | Dosage contains all information about how medication is taken (datatype) - incorporates frequency and route but may be a string                               |
| frequency                  | [MedicationStatement.dosage.timing](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.dosage.timing)                                                                     |                                                                                                                                                               |
| route                      | [MedicationStatement.dosage.route](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.dosage.route)                                                                       |                                                                                                                                                               |
|                            | [MedicationStatement.reasonCode](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.reasonCode)                                                                           |                                                                                                                                                               |
| relevant dateTIme          | [MedicationStatement.effective\[x\] dateTime](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.effective[x])                                                        |                                                                                                                                                               |
| relevant period            | [MedicationStatement.effective\[x\] period](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.effective[x])                                                          |                                                                                                                                                               |
|                            | [MedicationStatement.dateAsserted](StructureDefinition-qicore-medicationstatement-definitions.html#MedicationStatement.dateAsserted)                                                                       | Author dateTime not referenced in QDM                                                                                                                         |
| recorder                   |                                                                                                                                                                                                                                                  |                                                                                                                                                               |
{: .grid}

Note: the US Core R4 Update modifications include reference to
identifying an active medication list from MedicationRequest rather than
from MedicationStatement. The rationale provided is that
MedicationStatement status can include *both* active and not-taken
options. US Core project team members indicate that vendors are able to
develop a medication list from MedicationRequest when the status is
active, the intent is order and the requester is Organization
(for *e*prescriptions), Practitioner (for reported medications listed
by a practitioner) and Patient or Related Person (for reported
medications from a patient or a related person).  The final decision
about use of MedicationRequest Vs MedicationStatement is in flux and the
MedicationRequest option is provided here to be prepared for either
eventuality:

| **QDM Context**    | **QI-Core R4**                                                                                        | **Comments**                                                                                                                                                                                                                                                                                                                               |
| ------------------ | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Medication, Active | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                |                                                                                                                                                                                                                                                                                                                                            |
|                    | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                 | Constrain to "active"                                                                                                                                                                                                                                                                                                                      |
|                    | [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                 | Constrain to “order’                                                                                                                                                                                                                                                                                                                       |
|                    | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                             | inpatient, outpatient, community, patient-specified (used to specify if the medication active list is for inpatient, outpatient service, community (ambulatory) settings and most useful for identifying a discharge medication list using the community reference)                                                                        |
| **QDM Attribute**  |                                                                                                       |                                                                                                                                                                                                                                                                                                                                            |
| code               | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                 |                                                                                                                                                                                                                                                                                                                                            |
| id                 | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                         |                                                                                                                                                                                                                                                                                                                                            |
| Dosage             | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Amount of medication per dose.                                                                                                                                                                                                                                                                                                             |
| frequency          | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)                |                                                                                                                                                                                                                                                                                                                                            |
| route              | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)                 |                                                                                                                                                                                                                                                                                                                                            |
|                    | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                         |                                                                                                                                                                                                                                                                                                                                            |
| relevant dateTime  | NA                                                      |                                                                                                                                                                                                                                                                                                                                            |
| relevant period    | [MedicationRequest.dispenseRequest.validityPeriod](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.validityPeriod)          |                                                                                                                                                                                                                                                                                                                                            |
|                    | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                         | Author dateTime not referenced in QDM                                                                                                                                                                                                                                                                                                      |
| recorder           | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                           | To address all medications on a medication list, use MedicationRequest with status = active; intent = order; and requester = organization (for prescribed medications for which an order exists), practitioner (for medications entered by clinicians but not ordered), and patient or RelatedPerson (for patient/related person reported) |
{: .grid}

#### 8.14.2 Medication, Administered

This QDM context correlates with a record of a patient consuming or
otherwise being administered a medication. It references individual
medication administration events and, therefore, may not reference
frequency of administration. Note that a separate QDM and US-Core
profile address Immunization, Administered.

| **QDM Context**              | **QI-Core R4**                                                                                                                                                                                             | **Comments**                                                            |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| **Medication, Administered** | [MedicationAdministration](StructureDefinition-qicore-medicationadministration.html)                                                                          |                                                                         |
|                              | [MedicationAdministration.status](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.status)                       | Constrain status to "In-progress" or "completed"                        |
|                              | [MedicationAdministration.category](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.category)                   | Allows specification of Inpatient, Outpatient, Community                |
| **QDM Attributes**           |                                                                                                                                                                           |                                                                         |
| code                         | [MedicationAdministration.medication\[x\]](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.medication[x])       | ֵExample uses SNOMED substance codes                                    |
| id                           | [MedicationAdministration.id](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.id)                               |                                                                         |
| dosage                       | [MedicationAdministration.dosage.dose](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.dosage.dose)             | Simple Quantity - Amount of medication for one administration           |
|                              | [MedicationAdministration.dosage.rate\[x\]](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.dosage.rate[x])     | Simple Quantity                                                         |
| route                        | [MedicationAdministration.dosage.route](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.dosage.route)           |                                                                         |
| frequency                    | [MedicationAdministration.request](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.request)                     | Reference to original MedicationRequest with content about prescription |
|                              | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)        | Timing schedule (e.g., every 8 hours)                                   |
| reason                       | [MedicationAdministration.reasonCode](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.reasonCode)               | None, given as ordered, emergency                                       |
| relevant dateTime            | [MedicationAdministration.effective\[x} dateTime](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.effective[x]) |                                                                         |
| relevant Period              | [MedicationAdministration.effective\[x} Period](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.effective[x])   |                                                                         |
| author dateTime              |                                                                                                                                                                                                            |                                                                         |
| Negation rationale           | [MedicationAdministration.status](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.status)                       | Constrain status to "not-done"                                          |
|                              | [MedicationAdministration.statusReason](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.statusReason)           |                                                                         |
| Performer                    | [MedicationAdministration.performer.actor](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.performer.actor)     |                                                                         |
{: .grid}

#### 8.14.3 Medication, Dispensed

This QDM context maps to the FHIR MedicationDispense resource,
indicating information about medications that have been dispensed.

| **QDM Context**               | **QI-Core R4**                                                                                                                                                                                                                  | **Comments**                                                                                                                     |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Dispensed**     | [MedicationDispense](StructureDefinition-qicore-medicationdispense.html)                                                                                                           |                                                                                                                                  |
| Medication, Dispensed Context | [MedicationDispense.status](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.status)                                                              | Constrain MedicationDispense.status to active, completed, on-hold                                                                |
| **QDM Attributes**            |                                                                                                                                                                                                |                                                                                                                                  |
| code                          | [MedicationDispense.medication\[x\]](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.medication[x])                                              | SNOMED                                                                                                                           |
| id                            | [MedicationDispense.id](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.id)                                                                      |                                                                                                                                  |
| dosage                        | [MedicationDispense.dosageInstruction](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction)                                        | ordered, calculated                                                                                                              |
| supply                        | [MedicationDispense.quantity](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.quantity)                                                          |                                                                                                                                  |
| days supplied                 | [MedicationDispense.daysSupply](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.daysSupply)                                                      |                                                                                                                                  |
| frequency                     | [MedicationDispense.dosageInstruction.timing](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction.timing)                          | See dosageInstruction                                                                                                            |
| refills                       | [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)                            | Reference authorizing prescription (MedicationRequest) which contains Medication.Request.dispsenseRequest.numberOfRepeatsAllowed |
|                               | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) |                                                                                                                                  |
| route                         | [MedicationDispense.dosageInstruction.route](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction.route)                            | See dosageInstruction                                                                                                            |
| setting                       | [MedicationDispense.category](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.category)                                                          | Inpatient, Outpatient, Community, Discharge                                                                                      |
| reason                        | [MedicationDispense.statusReason\[x\[](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.statusReason[x])                                          | The reason for ordering or not ordering the medication                                                                           |
| relevant dateTime             | [MedicationDispense.whenHandedOver](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.whenHandedOver)                                              | When provided to patient or representative                                                                                       |
| relevant Period               | [MedicationDispense.extension:validityPeriod](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.extension:validityPeriod)                          |                                                                                                                                  |
| author dateTime               |                                                                                                                                                                                                                                 |                                                                                                                                  |
| Negation rationale            | [MedicationDispense.status](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.status)                                                              | Constrain MedicationDispense.status codes to "cancelled, declined                                                                |
|                               | [MedicationDispense.statusReason\[x\[](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.statusReason[x])                                                  | The reason for ordering or not ordering the medication                                                                           |
| Prescriber                    | [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)                            | Reference authorizing prescription (MedicationRequest) which contains Medication.Request.requester                               |
|                               | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           |                                                                                                                                  |
| Dispenser                     | [MedicationDispense.performer](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.performer)                                                        |                                                                                                                                  |
{: .grid}

#### 8.14.4 Medication, Order

This QDM context references the US-Core MedicationRequest resource with
the MedicationRequest.intent = *order* and MedicationRequest.setting set
to the setting most appropriate for the intended meaning of the quality
measure or clinical decision support (CDS) expression.

#### 8.14.5 Medication, Discharge

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

| **QDM Context**                        | **QI-Core R4**                                                                                                                                                                                                                  | **Comments**                                                                                                                                                                             |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Order**                  | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                               |                                                                                                                                                                                          |
| Medication, Order active               | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                 | Constrain to active, completed, on-hold                                                                                                                                                  |
|                                        | MedicationRequest.statusReason                                                                                                                                                                                                  |                                                                                                                                                                                          |
| Request context (order Vs recommended) | [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                                 | Constrain to "order" for Medication, Order - note that QDM does not include Medication, Recommended - should that concept be desired, use MedicationRequest.intent constrained to "plan" |
| **QDM Attributes**                     |                                                                                                                                                                                                |                                                                                                                                                                                          |
| code                                   | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                 | RsNorm                                                                                                                                                                                   |
| id                                     | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                         |                                                                                                                                                                                          |
| dosage                                 | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Range, quantity                                                                                                                                                                          |
| supply                                 | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)                             | Amount to be dispensed in one fill                                                                                                                                                       |
| days supplied                          | [MedicationRequest.dispenseRequest.expectedSupplyDuration](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.expectedSupplyDuration) | Duration                                                                                                                                                                                 |
| frequency                              | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)                             | Timing schedule (e.g., every 8 hours)                                                                                                                                                    |
| refills                                | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) | Integer                                                                                                                                                                                  |
| route                                  | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)                                                                                                                                           |                                                                                                                                                                                          |
| setting                                | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                                             | Constrain category to: Inpatient, Outpatient, Community (see Medication Discharge row for QDM Medication, Discharge)                                                                     |
| reason                                 | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| relevant dateTime                      |                                                                                                                                                                                                                                 |                                                                                                                                                                                          |
| relevant Period                        | [MedicationRequest.dispenseRequest.validityPeriod](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.validityPeriod)                 |                                                                                                                                                                                          |
| author dateTime                        | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                         |                                                                                                                                                                                          |
| Negation rationale                     | [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.doNotPerform)                                                     |                                                                                                                                                                                          |
|                                        | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| Prescriber                             | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           | Note - MedicationRequest.performer indicates the performer expected to administer the medication                                                                                         |
| Medication, Discharge                  |                                                                                                                                                                                                |                                                                                                                                                                                          |
| setting                                | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                                             | Constrain category to "Discharge" for QDM Medication, Discharge                                                                                                                          |
{: .grid}

#### 8.14.6 Immunization, Order

This QDM context references the US-Core MedicationRequest resource as
there is no other FHIR resource to reference an order for an
immunization. The mapping uses the US-Core MedicationRequest resource
with the MedicationRequest.intent = *order* and
MedicationRequest.setting set to the setting most appropriate for the
intended meaning of the quality measure or clinical decision support
(CDS) expression.

| **QDM Context**         | **QI-Core R4**                                                                                                                                                                                                                  | **Comments**                                                                                                                                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Immunization, Order** | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                               |                                                                                                                                                                                          |
|                         | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                 | Constrain to active, completed, on-hold                                                                                                                                                  |
|                         | MedicationRequest.statusReason                                                                                                                                                                                                  | The reason for ordering or not ordering the medication                                                                                                                                   |
|                         | [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                                 | Constrain to "order" for Medication, Order - note that QDM does not include Medication, Recommended - should that concept be desired, use MedicationRequest.intent constrained to "plan" |
| **QDM Attributes**      |                                                                                                                                                                                                |                                                                                                                                                                                          |
| code                    | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                 | RxNorm                                                                                                                                                                                   |
| id                      | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                         |                                                                                                                                                                                          |
| active dateTime         | [MedicationRequest.dispenseRequest.validityPeriod](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.validityPeriod)                 |                                                                                                                                                                                          |
| author dateTime         | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                         |                                                                                                                                                                                          |
| dosage                  | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Range, quantity                                                                                                                                                                          |
| route                   | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest.html#MedicationRequest.dosageInstruction.route)                                                                                                                                           |                                                                                                                                                                                          |
| reason                  | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| supply                  | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)                             | Amount to be dispensed in one fill                                                                                                                                                       |
| Negation rationale      | [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.doNotPerform)                                                     | Boolean                                                                                                                                                                                  |
|                         | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| Requester               | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           | Note - MedicationRequest.performer indicates the performer expected to administer the medication                                                                                         |
{: .grid}

### 8.15 Participation

QDM defines Participation as a patient’s coverage by a program such as
an insurance or medical plan or a payment agreement. Such programs can
include patient-centered medical home, disease-specific programs, etc.
Definitions modeled similar to the FHIR R4
[Coverage](http://hl7.org/fhir/coverage.html) resource.

| **QDM Context**         | **QI-Core R4**                                                                                                                       | **Comments**          |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | --------------------- |
| **Participation**       | [Coverage](StructureDefinition-qicore-coverage.html)                                    |                       |
| Participation  activity | [Coverage.status](StructureDefinition-qicore-coverage-definitions.html#Coverage.status) | Constrain to "active" |
| **QDM Attributes**      |                                                                                                     |                       |
| code                    | [Coverage.type](StructureDefinition-qicore-coverage-definitions.html#Coverage.type)     |                       |
| id                      | [Coverage.id](StructureDefinition-qicore-coverage-definitions.html#Coverage.id)         |                       |
| Participation Period    | [Coverage.period](StructureDefinition-qicore-coverage-definitions.html#Coverage.period) |                       |
| Recorder                |                                                                                                                                      |                       |
{: .grid}

### 8.16 Service Request

FHIR R4 uses the ServiceRequest resource to reference an order or
recommendation for many resources including Encounter, Procedure and
others. An order or recommendation to perform an observation is
basically a request for a procedure to be performed.  Starting with FHIR
R4, all *requests* associated with QDM concepts are handled by
ServiceRequest *except* MedicationRequest, DeviceRequest. QDM does not
reference other FHIR options such as CommunicationRequest,
CoverageEligibilityRequest, EnrollmentRequest, and SupplyRequest.
Therefore this section of the QDM to QI-Core mapping references each of
six observation-related QDM *datatypes* (assessment, care experience,
diagnostic study, laboratory test, physical exam, and symptom) as well
as intervention and procedure.  

| **QDM Context**                                                   | **QI-Core R4**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Service Request - Generic**                                     | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                 |                                                              |
| Service Request Activity (QDM implied active, on-hold, completed) | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, on-hold, completed                      |
| Recommended context                                               | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain to "plan"                                          |
| Order context                                                     | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain to "Order" (include children)                      |
|                                                                   | [ServiceRequest.category](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.category)                               | Helps differentiate "intervention" from "procedure" from QDM |
| **QDM Attributes**                                                |                                                                                                                                                         |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           |                                                              |
| Negation Rationale                                                | [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.doNotPerform)                       |                                                              |
|                                                                   | [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.extension:reasonRefused) |                                                              |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
| **Assessment, Order; Assessment, Recommended**                    |                                                                                                                                                    |                                                              |
| As in standard Service Request                                    |                                                                                                                                                         |                                                              |
| Diagnostic Study                                                  |                                                                                                                                                                                          |                                                              |
| As in standard Service Request                                    |                                                                                                                                                                                          |                                                              |
| **Encounter, Order**                                              |                                                                                                                                                                                          |                                                              |
| As in standard Service Request Plus:                              |                                                                                                                                                                                          |                                                              |
| Facility Location                                                 | [ServiceRequest.locationCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.locationCode)                       |                                                              |
| Priority                                                          | [ServiceRequest.priority](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.priority)                               |                                                              |
| **Intervention, Order; Intervention, Recommended**                |                                                                                                                                                                                          |                                                              |
| As in standard Service Request                                    |                                                                                                                                                                                          |                                                              |
| **Laboratory Test, Order; Laboratory Test, Recommended**          |                                                                                                                                                                                          |                                                              |
| As in standard Service Request                                    |                                                                                                                                                                                          |                                                              |
| **Physical Exam, Order; Physical Exam, Recommended**              |                                                                                                                                                                                          |                                                              |
| As in standard Service Request Plus:                              |                                                                                                                                                                                          |                                                              |
| Anatomical Location Site                                          | [ServiceRequest.bodySite](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.bodySite)                               |                                                              |
| **Procedure, Order; Procedure, Recommended**                      |                                                                                                                                                                                          |                                                              |
| ָAnatomical Location Site                                          | [ServiceRequest.bodySite](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.bodySite)                               |                                                              |
| Rank                                                              |                                                                                                                                                                                          |                                                              |
| Priority                                                          | [ServiceRequest.priority](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.priority)                               |                                                              |
{: .grid}

### 8.17 Substance

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

  - Determination that blood products (a biological product in FHIR
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

  - Determination that human breast milk is used exclusively to feed
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

#### 8.17.1 NutritionOrder

To provide some context and guidance, this QDM-to-QI-Core mapping
includes reference to the QDM *datatypes* Substance, Order and
Substance, Recommended using the
[NutritionOrder](http://hl7.org/fhir/nutritionorder.html) resource. As
noted in the second example provided, the resource is relatively new and
it allows expressions to address only the type of diet ordered, not the
foods or substances administered to a patient.

The CQI Workgroup seeks comment and advice regarding the best method for
addressing existing and new use cases regarding substance
administration.

| **QDM Context**                                    | **FHIR R4**                                                                                                                                                         | **Comments**                                          |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| **Substance, Order/Recommended - For Diet Orders** | [NutritionOrder](http://hl7.org/fhir/nutritionorder.html)                                                                                                           | Limited to orders for diets or diets with supplements |
| Substance Order/Recommended Activity               | [NutritionOrder.status](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.status)                                                                  | Constrain to Active, on-hold, Completed               |
| Substance, Order                                   | [NutritionOrder.intent](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.intent)                                                                  | Constrain to "plan"                                   |
| Substance, Recommended                             | [NutritionOrder.intent](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.intent)                                                                  | Constrain to "order" and child concepts               |
| **QDM Attributes**                                 |                                                                                                                                    |                                                       |
| ORAL DIET                                          | [NutritionOrder.oralDiet](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.oralDiet)                                                              |                                                       |
| code (to represent a diet order)                   | [NutritionOrder.oralDiet.type](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.oralDiet.type)                                                    |                                                       |
|                                                    | [NutrientOrder.oralDiet.nutrient.modifier](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.oralDiet.nutrient.modifier)                           |                                                       |
| id                                                 | [NutritionOrder.id](http://NutritionOrder.id)                                                                                                                       |                                                       |
| dosage                                             | N/A                                                                                                                                                                 |                                                       |
| frequency                                          | [NutritionOrder.Diet.schedule](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.oralDiet.schedule)                                                |                                                       |
| negation rationale                                 | N/A                                                                                                                                                                 |                                                       |
| author dateTime                                    | [NutritionOrder.dateTime](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.dateTime)                                                              |                                                       |
| relevant period                                    | N/A                                                                                                                                                                 |                                                       |
| reason                                             | N/A                                                                                                                                                                 |                                                       |
| supply                                             | N/A                                                                                                                                                                 |                                                       |
| refills                                            | N/A                                                                                                                                                                 |                                                       |
| route                                              | [NutritionOrder.oralDiet](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.oralDiet)                                                              |                                                       |
| Requester                                          | [NutritionOrder.orderer](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.orderer)                                                                |                                                       |
| ENTERAL FORMULA                                    | [NutritionOrder.enteralFormula](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.enteralFormula)                                                  |                                                       |
| code (to represent a diet order)                   | [NutritionOrder.enteralFormula.baseFormulaType](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.enteralFormula.baseFormulaType)                  |                                                       |
| Additive to diet order                             | [NutritionOrder.enteralFormula.additiveType](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.enteralFormula.additiveType)                        |                                                       |
| id                                                 | N/A                                                                                                                                                                 |                                                       |
| dosage                                             | [NutritionOrder.enterealFormula.administration.quantity](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.quantity) |                                                       |
| frequency                                          | [NutritionOrder.enteralFormula.administration.rate{x}](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.rate_x_)    |                                                       |
| negation rationale                                 | N/A                                                                                                                                                                 |                                                       |
| author dateTime                                    | [NutritionOrder.dateTime](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.dateTime)                                                              |                                                       |
| relevant period                                    | [NutritionOrder.enteralFormula.administration.schedule](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.schedule)  |                                                       |
| reason                                             | N/A                                                                                                                                                                 |                                                       |
| supply                                             | N/A                                                                                                                                                                 |                                                       |
| refills                                            | [NutritionOrder.enteralFormula](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.enteralFormula)                                                  |                                                       |
| route                                              | [NutritionOrder.enteralFormula.routeofAdministration](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.enteralFormula.routeofAdministration)      |                                                       |
| Requester                                          | [NutritionOrder.orderer](http://hl7.org/fhir/nutritionorder-definitions.html#NutritionOrder.orderer)                                                                |                                                       |
{: .grid}
