{:toc}

<div class="new-content" markdown="1">

This page is part of the Quality Improvement Core Framework (v5.0.0: [STU](https://confluence.hl7.org/display/HL7/HL7+Balloting) 5) based on [FHIR R4](http://hl7.org/fhir/R4/). This is the current published version. For a full list of available versions, see the [Directory of published versions](http://hl7.org/fhir/us/qicore/history.html).  

### Introduction

The CMS Quality Data Model (QDM) has been used to express electronic
clinical quality measures (eCQMs) in HQMF since 2012. QDM is a
conceptual data model that has evolved based on feedback, testing and
use. The current version (Version 5.6 for eCQM implementation 2023 and 2024) and QDM's complete history can be found
on the [eCQI Resource Center](https://ecqi.healthit.gov/qdm). Most of
the QDM concepts map directly to US Core R5, FHIR R4 resources or
extensions represented in QI-Core.

This version of QI Core updates mappings from QI-Core to QDM based on
US Core R5 and FHIR R4 and QDM version 5.6. Reviewers can evaluate the
comparisons, represented in the *Mappings* table for each QI-Core
resource. Each *mapping* table shows the QI-Core concept in the 
right-hand column and the corresponding QDM datatype(s) and attributes in
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
Center](https://ecqi.healthit.gov/qdm) for the full QDM 5.6
documentation.

### Change from QI-Core 4.1.1 to QI-Core 5.0.0
QI-Core builds upon US Core and new US Core STU5 profiles include a number of changes that impact expression of requests for information. These include new observation profiles, change to referencing conditions and diagnoses, and addition of a ServiceRequest profile. QI-Core addresses these changes as follows:

1.Condition
* a.	[QICore Condition Problems and Health Concerns Profile](StructureDefinition-qicore-condition-encounter-diagnosis.html) – this is basically a name change from the previously defined QICore Condition profile
* b.	[QICore Condition Encounter Diagnosis Profile](StructureDefinition-qicore-condition-encounter-diagnosis.html) – this new profile, based on US Core STU5 Condition Encounter Diagnosis Profile is based upon the core FHIR Condition Resource and meets the U.S. Core Data for Interoperability (USCDI) v2 ‘Encounter Diagnosis’ requirements. To promote interoperability and adoption through common implementation, this profile defines constraints and extensions on the Condition resource for the minimal set of data to record, search, and fetch information about an encounter diagnosis. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile. It provides the floor for standards development for specific uses cases.

2.Observations

QI-Core 5.0.0 includes 22 profiles based on the FHIR Observation resource, some including specific QI-Core constraints added to the US Core profiles, others used as specified by US Core. QI-Core also continues to include a generic QICore Observation profile to address findings not included in the specific profiles. The following list should help determine which QI-Core observation profile to use with each QDM datatype. The subsequent mapping tables provide more detail about how to address these new profiles when converting measures from QDM to QI-Core.

* a)	[QICore Observation Clinical Test Result](StructureDefinition-qicore-observation-clinical-test.html) – generally used with QDM “Diagnostic Study, Performed”
* b)	[QICore Observation Imaging Result](StructureDefinition-qicore-observation-imaging.html) – generally used with QDM “Diagnostic Study, Performed”
* c)	[QICore Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html) – generally used with QDM “Laboratory Test, Performed”
* d)	[QICore Observation Survey](StructureDefinition-qicore-observation-survey.html) – generally used with QDM “Assessment, Performed”
* e)	[US Core Observation Sexual Orientation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html) – generally used with QDM “Assessment, Performed”
* f)	[US Core Observation Social History Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-social-history.html) – generally used with QDM “Assessment, Performed”
* g)	[US Core Observation SDOH Assessment Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sdoh-assessment.html) – generally used with QDM “Assessment, Performed”
* h)	[US Core Smoking Status Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html) – generally used with QDM “Assessment, Performed”
* i)	[US Core Pediatric Head Occipital-frontal Circumference Percentile Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html) – generally used with QDM “Physical Exam, Performed”
* j)	[US Core Blood Pressure Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html) – generally used with QDM “Physical Exam, Performed”
* k)	[US Core BMI Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html) – generally used with QDM “Physical Exam, Performed”
* l)	[US Core Body Height Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html) – generally used with QDM “Physical Exam, Performed”
* m)	[US Core Body Temperature Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html) – generally used with QDM “Physical Exam, Performed”
* n)	[US Core Body Weight Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html) – generally used with QDM “Physical Exam, Performed”
* o)	[US Core Head Circumference Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html) – generally used with QDM “Physical Exam, Performed”
* p)	[US Core Heart Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html) – generally used with QDM “Physical Exam, Performed”
* q)	[US Core Pediatric BMI for Age Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html) – generally used with QDM “Physical Exam, Performed”
* r)	[US Core Pediatric Weight for Height Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html) – generally used with QDM “Physical Exam, Performed”
* s)	[US Core Pulse Oximetry Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html) – generally used with QDM “Physical Exam, Performed”
* t)	[US Core Respiratory Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html) – generally used with QDM “Physical Exam, Performed”
* u)	[QICore Observation Profile](StructureDefinition-qicore-observation.html) – generally used with QDM “Assessment, Performed” and only if the specific observation is not addressed by one of the more specific observation profiles. QDM “Care Experience” is an example of such an observation.

3.ServiceRequest – [QI-Core 5.0.0 ServiceRequest](StructureDefinition-qicore-servicerequest.html) adds constraints to the US Core STU5 ServiceRequest rather than the base FHIR 4.0.1 ServiceRequest.


### Adverse Event

QDM defines Adverse Event as any untoward medical occurrence associated
with the clinical care delivery, whether or not considered drug related.
The concepts aligns with the FHIR R4 resource Adverse Event
(<http://hl7.org/fhir/adverseevent-definitions.html#AdverseEvent>).
The FHIR resource provides clearer expressivity as compared with QDM.

QDM includes an attribute code that represents the specific type of event that occurred, consistent with AdverseEvent.event.

QDM does not include an attribute to address the additional elements available in QI-Core: AdverseEvent.suspectEntity (the suspected cause), or the AdverseEvent.resultingCondition. As an example to differentiate these elements:
* AdverseEvent.event = fall
* AdverseEvent.resultingCondition = fracture
* AdverseEvent.suspectEntity = area rug

QDM version 5.6 (and earlier versions) only address one of these elements, the event.
Therefore, QDM AdverseEvent code maps to AdverseEvent.event. Measure developers seeking to retrieve data about the cause of an AdverseEvent may be able to relate the occurrence timing of a potential causative event and the AdverseEvent.event timing. Further detail about the AdverseEvent will require use of FHIR or potentially a subsequent version of QDM after QDM 5.6.

| **QDM Context**    | **QI-Core R5**                                                                                                                                               | **Comments**                                               |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- |
| Adverse Event      | [AdverseEvent](StructureDefinition-qicore-adverseevent.html)                                                                         |                                                            |
|                    | [AdverseEvent.actuality](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.actuality)                          |    Although not specified in QDM, QI-Core provides the ability to differentiate between potential versus actual events                                                        |
| **QDM Attributes** |                                                                                                                                                              |                                                            |
| code               | [AdverseEvent.event](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.event)               | Type of the event itself in relation to the subject; reference SNOMED-CT event hierarchy to represent the event in an eCQM. Note: QDM does not include an attribute to address additional elements available in QI-Core: AdverseEvent.suspectEntity (the suspected cause), or the AdverseEvent.resultingCondition. |
| type               | [AdverseEvent.category](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.category)         |                                                            |
| severity           | [AdverseEvent.severity](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.severity)         |                                                            |
| relevantdateTime   | [AdverseEvent.date](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.date)                 |                                                            |
| facilityLocations  | [AdverseEvent.location](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.location)         |                                                            |
| authorDatetime     | [AdverseEvent.recordedDate](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.recordedDate) |                                                            |
| id                 | [AdverseEvent.id](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.id)                     |                                                            |
| recorder           | [AdverseEvent.recorder](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.recorder)         |                                                            |
|                    | [AdverseEvent.suspectEntity.instance](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.suspectEntity.instance)         | The actual instance of what caused the adverse event. May be a substance, medication, medication administration, medication statement or a device.              |
|                    | [AdverseEvent.resultingCondition](StructureDefinition-qicore-adverseevent-definitions.html#AdverseEvent.resultingCondition)         | Effect on the subject due to this event              |
{: .grid}

### Allergy/Intolerance

Allergy is used to address immune-mediated reactions to a substance such
as type 1 hypersensitivity reactions, other allergy-like reactions,
including pseudo-allergy.

Intolerance is a record of a clinical assessment of a propensity, or a
potential risk to an individual, to have a non-immune mediated adverse
reaction on future exposure to the specified substance, or class of
substance.

| **QDM Context**     | **QI-Core R5**                                                                                                                                                                                       | **Comments**                                                                                                                                                                                                                                     |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Allergy/Intolerance | [AllergyIntolerance](StructureDefinition-qicore-allergyintolerance.html)                                                                         |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.clinicalStatus](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.clinicalStatus)                   | active, inactive, resolved                                                                                                                                                                                                                                                 |
|                     | [AllergyIntolerance.type](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.type)                                       | Defines difference between Allergy and Intolerance                                                                                                                                                                                               |
|                     | [AllergyIntolerance.verificationStatus](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.verificationStatus)           | unconfirmed, confirmed, refuted, entered-in-error                                                                                                                                                                                                |
|                     | [AllergyIntolerance.extension:reasonRefuted](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.extension:reasonRefuted) |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.category](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.category)                               | Food, medication, environment, biologic                                                                                                                                                                                                          |
| **QDM Attributes**  |                                                                                                                                                                                                      |                                                                                                                                                                                                                                                  |
| code                | [AllergyIntolerance.code](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.code)                                       | USCoreAllergySubstance; RxNorm for medication ingredients                                                                                                                                             		                                   |
| id                  | [AllergyIntolerance.id](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.id)                                           |                                                                                                                                                                                                                                                  |
| prevalencePeriod    | [AllergyIntolerance.onset\[x\]](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.onset[x])                             | Prevalence Period start time maps to AllergyIntolerance.onset[x]. Implementers may need to “map” existing allergy onset timings (e.g., day, age, year, etc.) to a corresponding dateTime to allow calculation of measure or CDS expressions.     |
|                     | [AllergyIntolerance.lastOccurrence](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.lastOccurrence)                   |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.extension:resolutionAge](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.extension:resolutionAge) | Prevalence Period end time maps to AllergyIntolerance.extension:resolutionAge. Implementers may need to “map” existing allergy resolution timings (e.g., day, age, year, etc.) to a corresponding dateTime to allow calculation of measure or CDS expressions.|
| authorDatetime      | [AllergyIntolerance.recordedDate](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.recordedDate)                       |                                                                                                                                                                                                                                                  |
| type                | [AllergyIntolerance.reaction](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction)                               |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.reaction.substance](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction.substance)           |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.reaction.manifestation](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction.manifestation)   |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.reaction.onset](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction.onset)                   |                                                                                                                                                                                                                                                  |
| severity            | [AllergyIntolerance.reaction.severity](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.reaction.severity)             | mild, moderate, severe                                                                                                                                                                                                                           |
|                     | [AllergyIntolerance.criticality](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.criticality)                         | low, high, unable-to-assess                                                                                                                                                                                                                      |
| recorder            | [AllergyIntolerance.asserter](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.asserter)                               |                                                                                                                                                                                                                                                  |
|                     | [AllergyIntolerance.recorder](StructureDefinition-qicore-allergyintolerance-definitions.html#AllergyIntolerance.recorder)                               |                                                                                                                                                                                                                                                  |
{: .grid}


### Assessment

QDM defines Assessment as a resource used to define specific observations that clinicians use to guide treatment of the patient. An assessment can be a single question, or observable entity with an expected response, an organized collection of questions intended to solicit information from patients, providers or other individuals, or a single observable entity that is part of such a collection of questions. In previous versions of QI-Core, QDM Assessment category mapped directly to QICore Observation. Changes in US Core STU5 include several new observation-type profiles such that there are now six profiles providing greater specificity in defining observations. QI-Core inherits four of the observation profiles directly from US Core as no additional constraints are necessary:
*	[US Core Observation Sexual Orientation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html)
*	[US Core Observation Social History Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-social-history.html)
*	[US Core Observation SDOH Assessment Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sdoh-assessment.html)
*	[US Core Smoking Status Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html)

QI-Core includes a profile based on US Core Observation Survey to address additional constraints (Must Support elements), and QI-Core retains a generic Observation profile to allow measure and CDS expressions requiring data not covered by the more specific profiles:
*	[QICore Observation Survey](StructureDefinition-qicore-observation-survey.html) – generally used with for evaluation surveys and assessment tools
*	[QICore Observation Profile](StructureDefinition-qicore-observation.html) – used only if the specific observation is not addressed by one of the more specific observation profiles; for example, gestational age at birth as a standalone observation (i.e., not part of a survey or assessment tool).


#### Assessment, Order

Assessment, Order uses the ServiceRequest resource. The codes for ordering specific observations should reference the code element specified in the respective profile: QICore Observation Survey; US Core Observation Sexual Orientation, US Core Observation Social History, US Core Observation SDOH Assessment, US Core Smoking Status Observation, or QICore Observation.

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Assessment, Order**                                             | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed 		         |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| Code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| Reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| Author dateTime                                                   | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                              |
| Negation Rationale                                                | See Below |
| Requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Assessment, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html) and reference the code element specified in the respective observation profile:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.extension.code:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Assessment, Performed

QDM defines Assessment as a resource used to define specific
observations that clinicians use to guide treatment of the patient. An
assessment can be a single question, or observable entity with an
expected response, an organized collection of questions intended to
solicit information from patients, providers or other individuals, or a
single observable entity that is part of such a collection of questions.

"Assessment, Performed" maps to the one of several QI-Core profiles as applicable for the information desired:
*	[QICore Observation Survey](StructureDefinition-qicore-observation-survey.html) – generally used with for evaluation surveys and assessment tools
*	[US Core Observation Sexual Orientation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html)
*	[US Core Observation Social History Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-social-history.html)
*	[US Core Observation SDOH Assessment Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sdoh-assessment.html)
*	[US Core Smoking Status Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html)
*	[QICore Observation Profile](StructureDefinition-qicore-observation.html) – used only if the specific observation is not addressed by one of the more specific observation profiles.



| **QDM Context**                               | **QI-Core R5**                                                                                                                                                                        | **Comments**                                                                                                                                                                                                |
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
| negationRationale                             | See Below |
| reason                                        | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | The observation fulfills a plan, proposal or order - trace for authorization. Not a perfect  fit for the intent in QDM (e.g., observation "reason" = a diagnosis)  Is an extension needed?                  |
| result                                        | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])                                   |                                                                                                                                                                            |
| interpretation                                | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation)                         | New in QDM 5.6                                                                                                                                                                                                            |
| relevantDatetime                              | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                  |                                                                                                                                                                                                             |
| relevantPeriod                                | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                    |                                                                                                                                                                                                             |
| authorDatetime                                | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         |                                                                                                                                                                                                             |
| component                                     | [Observation.component](StructureDefinition-qicore-observation-definitions.html#Observation.component)                                   |                                                                                                                                                                                                             |
|                                               | [Observation.component.id](StructureDefinition-qicore-observation-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                             |
| component.code                                | [Observation.component.code](StructureDefinition-qicore-observation-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                             |
| component.result                              | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                             |
|                                               | [Observation.component.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                            |
|                                               | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                             |
| performer                                     | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                             |
{: .grid}

##### Negation Rationale for Assessment, Performed
Use [QICoreObservationCancelled](StructureDefinition-qicore-observationcancelled.html) and reference the code element specified in the respective observation profile:
* [Observation.status](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.status) - Fixed as "cancelled"
* [Observation.extension:notDoneReason](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Observation.issued](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.issued) - When this was made available
* [Observation.code.extension:notDoneValueSet](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific Observation that was not performed

#### Assessment, Recommended

Assessment, Recommended uses the ServiceRequest resource. The codes for recommending specific observations should reference the code element specified in the respective profile: QICore Observation Survey; US Core Observation Sexual Orientation, US Core Observation Social History, US Core Observation SDOH Assessment, US Core Smoking Status Observation, or QICore Observation.


| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Assessment, Recommended**                                       | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed   		     |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Assessment, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html) and reference the code element specified in the respective observation profile:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed


### Care Experience

QDM defines Care Experience as the experience a patient has when receiving care or a provider has when providing care. QDM represents two kinds of care experience: Patient Care Experience and Provider Care Experience. While generally interpreted as patient or provider satisfaction, experience may also represent understanding, involvement and other factors about the care received or given. Most often organizations obtain such information using questionnaires. Use cases are welcome to help provide examples for us of this concept. The Care Experience concept best fits with the FHIR Observation resource.

QDM’s “Care Experience” maps to either one of two QI-Core profiles, dependent on the type of information desired:
* [QICore Observation Survey Profile](StructureDefinition-qicore-observation-survey.html) – generally used with for evaluation surveys and assessment tools; if the care experience information is obtained using a survey, the QICore Observation Survey Profile is appropriate.
* [QICore Observation Profile](StructureDefinition-qicore-observation.html) – If care experience is expressed as a single finding or observation, the QICore Observation profile is appropriate.


#### Patient Care Experience

QDM “Patient Care Experience” maps to [QICore Observation Survey Profile](StructureDefinition-qicore-observation-survey.html) or [QICore Observation](StructureDefinition-qicore-observation.html), as applicable, for the information desired:


| **QDM Context**              | **QI-Core R5**                                                                                                                                                          | **Comments**                                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| **Patient Care Experience**  | [Observation](StructureDefinition-qicore-observation.html)                                      |                                                             |
|                              | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                        | Constrain status to -  final, amended, corrected            |
| **QDM Attributes**           |                                                                                                                                     |                                                             |
| code                         | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                            |                                                             |
| id                           | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                |                                                             |
|                              | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x]) |                                                             |
|                              | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])   |                                                             |
| authorDatetime               | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                        |                                                             |
| recorder                     | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                  | who was responsible for asserting the observation as "true" |
{: .grid}

#### Provider Care Experience

QDM “Provider Care Experience” maps to [QICore Observation Survey Profile](StructureDefinition-qicore-observation-survey.html) or [QICore Observation](StructureDefinition-qicore-observation.html), as applicable, for the information desired:

| **QDM Context**              | **QI-Core R5**                                                                                                                                                          | **Comments**                                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| **Provider Care Experience** | [Observation](StructureDefinition-qicore-observation-definitions.html#Observation)                                      |                                                             |
|                              | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                        | Constrain status to -  final, amended, corrected            |
| **QDM Attributes**           |                                                                                                                                     |                                                             |
| code                         | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                            |                                                             |
| id                           | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                |                                                             |
|                              | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x]) |                                                             |
|                              | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])   |                                                             |
| authorDatetime               | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                        |                                                             |
| recorder                     | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                  | who was responsible for asserting the observation as "true" |
{: .grid}
</div>

### Care Goal

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

| **QDM Context**    | **QI-Core R5**                                                                                                                                 | **Comments** |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **Care Goal**      | [Goal](StructureDefinition-qicore-goal.html)                                                                          |              |
|                    | [Goal.achievementStatus](StructureDefinition-qicore-goal-definitions.html#Goal.achievementStatus) |              |
| **QDM Attributes** |                                                                                                                                                |              |
| code               | [Goal.target.measure](StructureDefinition-qicore-goal-definitions.html#Goal.target.measure)       |              |
|                    | [Goal.target.detail\[x\]](StructureDefinition-qicore-goal-definitions.html#Goal.target.detail[x]) |              |
| id                 | [Goal.id](StructureDefinition-qicore-goal-definitions.html#Goal.id)                               |              |
| statusDate         |                                                                                                                                                |              |
| targetOutcome      | [Goal.target.detail\[x\]](StructureDefinition-qicore-goal-definitions.html#Goal.target.detail[x]) |              |
| relevantPeriod     | [Goal.start\[x\]](StructureDefinition-qicore-goal-definitions.html#Goal.start[x])                 |              |
|                    | [Goal.target.due\[x\]](StructureDefinition-qicore-goal-definitions.html#Goal.target.due[x])             |              |
| statusDate         | [Goal.statusDate](StructureDefinition-qicore-goal-definitions.html#Goal.statusDate)               |              |
| relatedTo          | [Goal.addresses](StructureDefinition-qicore-goal-definitions.html#Goal.addresses)                 |              |
| performer          | [Goal.expressedBy](StructureDefinition-qicore-goal-definitions.html#Goal.expressedBy)             |              |
{: .grid}

### Communication

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

#### Communication, Performed


| **QDM Context**              | **QI-Core R5**                                                                                                                                                  | **Comments**                                                                                  |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| **Communication, Performed** | [Communication](StructureDefinition-qicore-communication.html)                                                     |                                                                                               |
|                              | [Communication.status](StructureDefinition-qicore-communication-definitions.html#Communication.status)             | constrain to completed                                               |
| **QDM Attributes**           |                                                                                                                    |                                                                                               |
| code                         | [Communication.reasonCode](StructureDefinition-qicore-communication-definitions.html#Communication.reasonCode)     |                                                                                               |
| id                           | [Communication.id](StructureDefinition-qicore-communication-definitions.html#Communication.id)                     |                                                                                               |
| category                     | [Communication.category](StructureDefinition-qicore-communication-definitions.html#Communication.category)         | alert, notification, reminder, instruction                                                    |
| medium                       | [Communication.medium](StructureDefinition-qicore-communication-definitions.html#Communication.medium)             |                                                                                               |
| sentDatetime                 | [Communication.sent](StructureDefinition-qicore-communication-definitions.html#Communication.sent)                 |                                                                                               |
| receivedDatetime             | [Communication.received](StructureDefinition-qicore-communication-definitions.html#Communication.received)         |                                                                                               |
| authorDatetime               | [Communication.extension:recorded](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.extension:recorded) | for use with negationRationale                                             |
| relatedTo                    | [Communication.basedOn](StructureDefinition-qicore-communication-definitions.html#Communication.basedOn)           | An order, proposal or plan fulfilled in whole or in part by this Communication.               |
|                              | [Communication.inResponseTo](StructureDefinition-qicore-communication-definitions.html#Communication.inResponseTo) | Response to a communication                                                                   |
| sender                       | [Communication.sender](StructureDefinition-qicore-communication-definitions.html#Communication.sender)             |                                                                                               |
| recipient                    | [Communication.recipient](StructureDefinition-qicore-communication-definitions.html#Communication.recipient)       |                                                                                               |
| negationRationale            | See Below |
{: .grid}

##### Negation Rationale for Communication, Performed

Use [QICoreCommunicationNotDone](StructureDefinition-qicore-communicationnotdone.html), which contains:
* [Communication.status](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.status) - Fixed Value: "not-done"
* [Communication.statusReason](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Communication.extension:recorded](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.extension:recorded) - dateTime when this was made available
* [Communication.reasonCode.extension:notDoneValueSet](StructureDefinition-qicore-communicationnotdone-definitions.html#Communication.reasonCode.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific Communication that was not performed

<div class="new-content" markdown="1">
### Diagnosis

QDM defines Condition/Diagnosis/Problem as a practitioner’s
identification of a patient’s disease, illness, injury, or condition.
This category contains a single datatype to represent all of these
concepts: Diagnosis. A practitioner determines the diagnosis by means of
examination, diagnostic test results, patient history, and/or family
history. Diagnoses are usually considered unfavorable, but they may also
represent neutral or favorable conditions that affect a patient’s plan
of care (e.g., pregnancy).

Based on changes in US Core STU5, QI-Core now has two methods for expressing conditions, [QICore Condition Problems and Health Concerns Profile](StructureDefinition-qicore-condition-problems-health-concerns.html), and [QICore Condition Encounter Diagnosis Profile](StructureDefinition-qicore-condition-encounter-diagnosis.html). Please reference the respective profile pages for explanation of the rationale for using each of these profiles. Briefly, the Condition Problems and Health Concerns Profile meets the US Core Data for Interoperability (USCDI) version 2 ‘Problems’ and ‘Health Concerns’ and SDOH Problems/Health Concerns requirements. The Condition Encounter Diagnosis Profile further meets the USCDI v2 requirement to define Encounter Diagnosis.

| **QDM Context**                     | **QI-Core R5**                                                                                                                                                  | **Comments**                                                                 |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| **Condition - Diagnosis - Problem** | [Condition Problems and Health Concerns](StructureDefinition-qicore-condition-problems-health-concerns.html)                                                                                 |                                                                              |
|                                     | [ConditionProblemsHealthConcerns.clinicalStatus](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.clinicalStatus)         | defines active/inactive                                                      |
|                                     | [ConditionProblemsHealthConcerns.verificationStatus](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.verificationStatus) | confirmed, unconfirmed provisional, differential, refuted, entered-in-error, |
|                                     | [ConditionProblemsHealthConcerns.category](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.category)                     | problem-list-item, encounter-diagnosis, health-concern                       |
| **QDM Attributes**                  |                                                                                                                                                                 |                                                                              |
| code                                | [ConditionProblemsHealthConcerns.code](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.code)                             |                                                                              |
| id                                  | [ConditionProblemsHealthConcerns.id](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.id)                                 |                                                                              |
| prevalencePeriod                    | [ConditionProblemsHealthConcerns.onset\[x\]](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.onset[x])                   | May be dateTime, Age, Period Range, string                                   |
|                                     | [ConditionProblemsHealthConcerns.abatement\[x\]](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.abatement[x])           | May be dateTime, Age, Period Range, string                                   |
| authorDatetime                      | [ConditionProblemsHealthConcerns.recordedDate](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.recordedDate)             |                                                                              |
| severity                            | [ConditionProblemsHealthConcerns.severity](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.severity)                     | severe, moderate, mild                                                       |
| anatomicalLocationSite              | [ConditionProblemsHealthConcerns.bodySite](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.bodySite)                     |                                                                              |
| recorder                            | [ConditionProblemsHealthConcerns.recorder](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.recorder)                     | Individual who recorded the record and takes responsibility for its content  |
|                                     | [ConditionProblemsHealthConcerns.asserter](StructureDefinition-qicore-condition-problems-health-concerns-definitions.html#Condition.asserter)                     | Individual who is making the condition statement                             |
{: .grid}
</div>

### Device

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
Device]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-implantable-device.html).
QI-Core inherits Implantable Device from US Core and builds directly from FHIR
for the QI-Core Device Resource.

#### Device, Applied
QDM originally designed Device, Applied to allow access to documentation of
device usage. However, evaluation over time indicates that all documentation
about usage of a device occurs as an observation. Thus, information about an
implanted pacemaker status check, utilization of a patient-use Continuous
Positive Airway Pressure (CPAP) device, results from a glucometer, or use of a
wheelchair or cane should use the QDM datatype, Assessment, Performed, or
QI-Core Observation. Use of Device, Applied has been synonymous with
Procedure, Performed, i.e., placement of or adjustment to a device.

"Device Applied" has been retired in QDM 5.6 in favor of using "Procedure, Performed" or
"Assessment, Performed" as appropriate.

#### Device, Order – Non-Patient-use Devices

| **QDM Context**         | **QI-Core R5**                                 | **Comments**                                                                                       |
| ----------------------- | -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| **Device Request**      | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                             |                                                                                  |
|                         | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)         | Constrain to active, completed                                                                                    |
| **Device, Order**       | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)         | Constrain to "order" (include children)                                                                                    |
| **QDM Attributes**      |                               |                                                                                  |
| code                    | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)             |                                                                                  |
| id                      | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                 |                                                                                  |
| reason                  | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                      |                                                                         |
| authorDatetime          | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                      | FHIR allows dateTime or Period for desired time or schedule for use.                                                                                 |
| negationRationale       | See Below |
| requester               | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                        |                                                                                  |
{: .grid}

##### Negation Rationale for Device, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Device, Order – Personal Use Devices

| **QDM Context**         | **QI-Core R5**                                    | **Comments**                                                                                          |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Device Request**      | [DeviceRequest](StructureDefinition-qicore-devicerequest.html)                               |                                                                                  |
|                         | [DeviceRequest.status](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.status)            |  Constrain to active, completed                                                                                    |
| **Device, Order**       | [DeviceRequest.intent](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.intent)            | Constrain to "Order" (include children)                                                                                    |
| **QDM Attributes**      |                               |                                                                                  |
| code                    | [DeviceRequest.code\[x\]](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.code[x])       |                                                                                  |
| id                      | [DeviceRequest.id](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.id)                    |                                                                                  |
| reason                  | [DeviceRequest.reasonCode](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.reasonCode)                         |                                                                                  |
| authorDatetime          | [DeviceRequest.authoredOn](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.authoredOn)                         | FHIR allows dateTime or Period for deseired time or schedule for use.                                                                     |
| negationRationale       | See Below |
| requester               | [DeviceRequest.requester](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.requester)      |                                                                                  |
{: .grid}

##### Negation Rationale for Device, Order – Personal Use Devices

Use [QICoreDeviceNotRequested](StructureDefinition-qicore-devicenotrequested.html), which contains:
* [DeviceRequest.modifierExtension:doNotPerform](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.modifierExtension:doNotPerform) - Fixed value: "true"
* [DeviceRequest.status](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.status) - Fixed value: "completed"
* [DeviceRequest.extension:doNotPerformReason](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.extension:doNotPerformReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [DeviceRequest.authoredOn](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.authoredOn) - dateTime when this was made available
* [DeviceRequest.code\[x\].extension:doNotPerformValueSet](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.code%5Bx%5D.extension:doNotPerformValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific DeviceRequest that was not performed

#### Device, Recommended – Non-Patient-use Devices

| **QDM Context**         | **QI-Core R5**                                    | **Comments**                                                                                          |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Device Request**      | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                             |                                                                                  |
|                         | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)         | Constrain to active, completed                                                                                    |
| **Device, Order**       | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)         | Constrain to "order" (include children)                                                                                    |
| **QDM Attributes**      |                               |                                                                                  |
| code                    | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)             |                                                                                  |
| id                      | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                 |                                                                                  |
| reason                  | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                      |                                                                         |
| authorDateTime          | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                      | FHIR allows dateTime or Period for desired time or schedule for use.                                                                                 |
| negationRationale       | See Below |
| requester               | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                        |                                                                                  |
{: .grid}

##### Negation Rationale for Device, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Device, Recommended – Personal Use Devices

| **QDM Context**         | **QI-Core R5**                                    | **Comments**                                                                                          |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Device Request**      | [DeviceRequest](StructureDefinition-qicore-devicerequest.html)                               |                                                                                  |
|                         | [DeviceRequest.status](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.status)            |  Constrain to active, completed                                                                                    |
| **Device, Order**       | [DeviceRequest.intent](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.intent)            | Constrain to "Order" (include children)                                                                                    |
| **QDM Attributes**      |                               |                                                                                  |
| code                    | [DeviceRequest.code\[x\]](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.code[x])        |                                                                                  |
| id                      | [DeviceRequest.id](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.id)                    |                                                                                  |
| reason                  | [DeviceRequest.reasonCode](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.reasonCode)                         |                                                                                  |
| authorDatetime          | [DeviceRequest.authoredOn](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.authoredOn)                         | FHIR allows dateTime or Period for deseired time or schedule for use.                                                                     |
| negationRationale       | See Below |
| requester               | [DeviceRequest.requester](StructureDefinition-qicore-devicerequest-definitions.html#DeviceRequest.requester)      |                                                                                  |
{: .grid}

##### Negation Rationale for Device, Recommended – Personal Use Devices

Use [QICoreDeviceNotRequested](StructureDefinition-qicore-devicenotrequested.html), which contains:
* [DeviceRequest.modifierExtension:doNotPerform](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.modifierExtension:doNotPerform) - Fixed value: "true"
* [DeviceRequest.status](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.status) - Fixed value: "completed"
* [DeviceRequest.extension:doNotPerformReason](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.extension:doNotPerformReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [DeviceRequest.authoredOn](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.authoredOn) - dateTime when this was made available
* [DeviceRequest.code\[x\].extension:doNotPerformValueSet](StructureDefinition-qicore-devicenotrequested-definitions.html#DeviceRequest.code%5Bx%5D.extension:doNotPerformValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific DeviceRequest that was not performed

<div class="new-content" markdown="1">
### Diagnostic Study

QDM defines Diagnostic Study as any kind of medical test performed as a specific test or series of steps to aid in diagnosing or detecting disease (e.g., to establish a diagnosis, measure the progress or recovery from disease, confirm that a person is free from disease). The QDM differentiates diagnostic studies from laboratory tests in that diagnostic studies are those that are not performed in organizations that perform testing on samples of human blood, tissue, or other substance from the body. Diagnostic studies may make use of digital images and textual reports. Such studies include but are not limited to imaging studies, cardiology studies (electrocardiogram, treadmill stress testing), pulmonary-function testing, vascular laboratory testing, and others.

QI-Core has added specific constraints on US Core STU5 additional profiles that address such non-laboratory tests:
1.	[QICore Observation Clinical Test Result](StructureDefinition-qicore-observation-clinical-test.html) – non-laboratory, non-imaging tests; this profile is sufficiently broad that it should be used instead of the QI-Core Observation profile for all non-laboratory, non-imaging test results
2.	[QICore Observation Imaging Result](StructureDefinition-qicore-observation-imaging.html) – imaging study results


#### Diagnostic Study, Order

“Diagnostic Study, Order” should reference orders for studies that will generate results for activities that meet criteria for Observation Clinical Test or Observation Imaging Result profiles.


| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Diagnostic Study, Order**                                       | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed    		     |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Diagnostic Study, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html) and reference the code element specified in the respective observation profile:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Diagnostic Study, Performed

Individual studies may use the [US Core DiagnosticReport Profile for Report and Note Exchange](http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html) to provide information about an individual study (e.g., a cardiac ultrasound, MRI, etc.) although some have considered use of other reporting resources and artifacts. Since new studies regularly become available and the nature of existing studies change over time, a complete list of studies to reference a desired result cannot be assured. Therefore, a quality measure or clinical decision support (CDS) artifacts seeking a specific result value should use the [QICore Observation Clinical Test Result](StructureDefinition-qicore-observation-clinical-test.html) or the [QICore Observation Imaging Result](StructureDefinition-qicore-observation-imaging.html) to request a retrieve of the result value desired. This practice will enable implementers to determine which is the best source for the desired observation. LOINC observable entities may indicate specific methods for determination of results. Measure and CDS developers can reference direct reference codes or value sets using such LOINC codes to specify the type of testing considered acceptable to provide sufficient fidelity to their requests.


| **QDM Context**                 | **QI-Core  R5**      | **Comments**                                                                                  |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| **Diagnostic Study, Performed** | •[Observation Clinical Test Profile for non-laboratory, non-imaging study results](StructureDefinition-qicore-observation-clinical-test.html)<br> •[Observation Imaging Result Profile for imaging study results](StructureDefinition-qicore-observation-imaging.html)<br>                                                    |                                                                                                                                                                                                                                                    |
|                                 | •[ObservationClinicalTestResult.partOf](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.partOf)<br>  •[ObservationImagingResult.partOf](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.partOf)<br>                                        | A larger event of which this particular Observation is a component or step. For example, an observation as part of a procedure.                                                                                                                    |
|                                 | •[ObservationClinicalTestResult.status](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.status)<br>   •[ObservationImagingResult.status](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.status)<br>                                       | Constrain status to -  final, amended, corrected                                                                                                                                                                                                   |
| QDM Attributes                  |                                                                                                                                                      |                                                                                                                                                                                                                                                    |
| code                            | •[ObservationClinicalTestResult.code](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.code)<br>  •[ObservationImagingResult.code](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.code)<br>                                            |                                                                                                                                                                                                                                                    |
| id                              | •[ObservationClinicalTestResult.id](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.id)<br>  •[ObservationImagingResult.id](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.id)<br>                                                 |                                                                                                                                                                                                                                                    |
| method                          | •[ObservationClinicalTestResult.method](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.method)<br>  •[ObservationImagingResult.method](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.method)<br>                                         |                                                                                                                                                                                                                                                    |
| facilityLocation                | N/A                                                                                                                                                                                   |                                                                                                                                                                                                                                                    |
|                                 | •[ObservationClinicalTestResult.bodySite](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.bodySite)<br>  •[ObservationImagingResult.bodySite](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.bodySite)<br>                                     |                                                                                                                                                                                                                                                    |
| negationRationale               | See Below |
| reason                          | •[ObservationClinicalTestResult.basedOn](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.basedOn)<br>  •[ObservationImagingResult.basedOn](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.basedOn)<br>                                       | the Observation.basedOn concept indicates the plan, proposal or order that the observation fulfills. This concept is not consistent with the QDM concept of "reason" for the study to be performed.
| relatedTo                       | •[ObservationClinicalTestResult.basedOn](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.basedOn)<br>  •[ObservationImagingResult.basedOn](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.basedOn)<br>                                   | New in QDM 5.6                                                                                                                                                                                                                                        |                                                |
| result                          | •[ObservationClinicalTestResult.value\[x\]](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.value[x])<br>  •[ObservationImagingResult.value\[x\]](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.value[x])<br> |                                                                                                                                                                                                                                                    |
| interpretation                  | •[ObservationClinicalTestResult.interpretation](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.interpretation)<br>  •[ObservationImagingResult.interpretation](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.interpretation)<br>                         | New in QDM 5.6                                                                                                                                                                                                                                                   |
| resultDatetime                  | •[ObservationClinicalTestResult.issued](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.issued)<br>  •[ObservationImagingResult.issued](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.issued)<br>                                         |                                                                                                                                                                                                                                                    |
| relevantDatetime                | •[ObservationClinicalTestResult.effective\[x\] dateTime](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.effective[x])<br>  •[ObservationImagingResult.effective\[x\] dateTime](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.effective[x])<br>                  |                                                                                                                                                                                                                                                    |
| relevantPeriod                  | •[ObservationClinicalTestResult.effective\[x\] Period](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.effective[x])<br>  •[ObservationImagingResult.effective\[x\] Period](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.effective[x])<br>                    |                                                                                                                                                                                                                                                    |
| status                          | •[ObservationClinicalTestResult.status](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.status)<br>  •[ObservationImagingResult.status](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.status)<br>                                         | Constrain status to -  final, amended, corrected, appended                                                                                                                                                                                         |
| authorDatetime                  | •[ObservationClinicalTestResult.issued](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.issued)<br>  •[ObservationImagingResult.issued](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.issued)<br>                                         | Issued - the date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified. Consider if QI-Core should include an extension to manage timing of the dataAbsentReason. |
| component                       | •[ObservationClinicalTestResult.component](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.component)<br>  •[ObservationImagingResult.component](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.component)<br>                                   | Components not present in US Core-R4 DiagnosticReport but the report references Observation for results; thus it seems reasonable to re-use observation concepts for the components of a DiagnosticReport                                          |
|                                 | •[ObservationClinicalTestResult.component.id](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.component.id)<br>  •[ObservationImagingResult.component.id](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.component.id)<br>                             |                                                                                                                                                                                                                                                    |
| component.code                  | •[ObservationClinicalTestResult.component.code](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.component.code)<br>  •[ObservationImagingResult.component.code](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.component.code)<br>                         |                                                                                                                                                                                                                                                    |
| component.result                | •[ObservationClinicalTestResult.component.value\[x\]](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.component.value[x])<br>  •[ObservationImagingResult.component.value\[x\]](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.component.value[x])<br>              |                                                                                                                                                                                                                                                    |
|                                 | •[ObservationClinicalTestResult.component.interpretation](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.component.interpretation)<br>  •[ObservationImagingResult.component.interpretation](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.component.interpretation)<br>     |                                                                                                                                                                                                                                                    |
|                                 | •[ObservationClinicalTestResult.component.dataAbsentReason](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.component.dataAbsentReason)<br>  •[ObservationImagingResult.component.dataAbsentReason](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.component.dataAbsentReason)<br> |                                                                                                                                                                                                                                                    |
| performer                       | •[ObservationClinicalTestResult.performer](StructureDefinition-qicore-observation-clinical-test-definitions.html#Observation.performer)<br>  •[ObservationImagingResult.performer](StructureDefinition-qicore-observation-imaging-definitions.html#Observation.performer)<br>                                   |                                                                                                                                                                                                                                                    |
{: .grid}

##### Negation Rationale for Diagnostic Study, Performed

Use [QICoreObservationCancelled](StructureDefinition-qicore-observationcancelled.html) and reference the code element specified in the respective observation profile:
* [Observation.status](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.status) - Fixed value: "cancelled"
* [Observation.extension:notDoneReason](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Observation.issued](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.issued) - dateTime when this was made available
* [Observation.code.extension:notDoneValueSet](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific Observation that was not performed

#### Diagnostic Study, Recommended

“Diagnostic Study, Recommended” should reference recommendations for studies that will generate results for activities that meet criteria for Observation Clinical Test or Observation Imaging Result profiles.


| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Diagnostic Study, Recommended**                                 | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed   		     |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Diagnostic Study, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html) and reference the code element specified in the respective observation profile:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed
</div>

### Encounter

QDM defines Encounter as an identifiable grouping of healthcare-related
activities characterized by the entity relationship between the subject
of care and a healthcare provider; such a grouping is determined by the
healthcare provider. A patient encounter represents interaction between
a healthcare provider and a patient with a face-to-face patient visit to
a clinician’s office, or any electronically remote interaction with a
clinician for any form of diagnostic treatment or therapeutic event.

#### Encounter Timing

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

#### Encounter-Related Diagnoses and Procedures

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

#### Encounter, Order

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Encounter, Order**                                              | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed  			     |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| facilityLocation                                                  | [ServiceRequest.locationCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.locationCode)                       |                                                              |
| priority                                                          | [ServiceRequest.modifierExtension:isElective](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.modifierExtension:isElective)|      |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Encounter, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

<div class="new-content" markdown="1">
#### Encounter, Performed

| **QDM Context**                    | **QI-Core R5**  | **Comments**  |
| ---------------------------------- | --------------- | ------------- |
| **Encounter, Performed**           | [Encounter](StructureDefinition-qicore-encounter.html)                 |                                                                                             |
|                                    | [Encounter.status](StructureDefinition-qicore-encounter-definitions.html#Encounter.status)           | constrain to - arrived, triaged, in-progress, on-leave, finished  Note: most retrospective eCQMs will constrain Encounter.status to “finished”. Measures designed to monitor active encounters should consider using “in-progress”. |
| **QDM Attribute**                  |                                               |                                                                                             |
| code                               | [Encounter.type](StructureDefinition-qicore-encounter-definitions.html#Encounter.type)             | Uses value set: USCoreEncounterType                                                                                      |
| id                                 | [Encounter.id](StructureDefinition-qicore-encounter-definitions.html#Encounter.id)                   |                                                                                             |
| class                              | [Encounter.class](StructureDefinition-qicore-encounter-definitions.html#Encounter.class)           | New in QDM 5.6 uses V3 Value Set ActEncounterCode                                                                                      |
| relatedTo                          | [Encounter.basedOn](StructureDefinition-qicore-encounter-definitions.html#Encounter.basedOn)           | New in QDM 5.6                                                                                      |
| relevantPeriod                     | [Encounter.period](StructureDefinition-qicore-encounter-definitions.html#Encounter.period)           | start and end time of encounter                                                                                      |
| diagnoses                          |                                               |                                                                                             |
| diagnosis (code)                   | [Encounter.diagnosis.condition](StructureDefinition-qicore-encounter-definitions.html#Encounter.diagnosis.condition) with reference to:<br> •[QICore Encounter Condition Diagnosis](StructureDefinition-qicore-condition-encounter-diagnosis.html) AND<br>•[QICore Condition Problems and Health Concerns](StructureDefinition-qicore-condition-problems-health-concerns.html)          | can be used for coded diagnoses  [Note to balloters](index.html#note-to-balloters)                                                                                      |
| presentOnAdmissionIndicator (code) | [Encounter.diagnosis.extension:diagnosisPresentOnAdmission](StructureDefinition-qicore-encounter-diagnosisPresentOnAdmission.html)              | Indicator of whether the Encounter diagnosis was present at the time of admission. Note: this element uses the value set (required) diagnosis-on-admission (the same value set as used with the claim resource)  |
| rank (Integer)                     | [Encounter.diagnosis.rank](StructureDefinition-qicore-encounter-definitions.html#Encounter.diagnosis.rank)                    | for each diagnosis role                                                                                              |
| procedures                         | [qicore-encounter-procedure](StructureDefinition-qicore-encounter-procedure.html)                                              | QIcore-encounter-procedure                                                                  |
|                                    | [Encounter.extension.procedure.value\[x\]](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:procedure.value[x])                                                |References the procedure code                                                                                             |
|                                    | [Encounter.extension:rank.value\[x\]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])                                           |References the rank; for principal procedure, the rank =1                              |     
|                                    | [Encounter.procedure.procedure](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:procedure)                                               |A reference to the procedure that was performed                                                                                             |
| lengthOfStay                       | [Encounter.length](StructureDefinition-qicore-encounter-definitions.html#Encounter.length)           |                                                                                             |
| authorDatetime                     | Not Addressed                                 |                                                                                             |
| admissionSource                    | [Encounter.hospitalization.admitSource](StructureDefinition-qicore-encounter-definitions.html#Encounter.hospitalization.admitSource)                   |                                                                                             |
| dischargeDisposition               | [Encounter.hospitalization.dischargeDisposition](StructureDefinition-qicore-encounter-definitions.html#Encounter.hospitalization.dischargeDisposition) | E.g., home, hospice, long-term care, etc.                                                                            |
|                                    | Encounter.hospitalizaton.destination                                   |                                                                                             |
| facilityLocations                  |                                               |                                                                                             |
| code                               | [Encounter.location.location](StructureDefinition-qicore-encounter-definitions.html#Encounter.location.location)              |                                                                                             |
| locationPeriod                     | [Encounter.location.period](StructureDefinition-qicore-encounter-definitions.html#Encounter.location.period)                  |                                                                                             |
| participant                        | [Encounter.participant.individual](StructureDefinition-qicore-encounter-definitions.html#Encounter.participant.individual)    |                                                                                             |
|                                    | [Encounter.serviceProvider](StructureDefinition-qicore-encounter-definitions.html#Encounter.serviceProvider)|Encounter.serviceProvider identifies the organization that is primarily responsible for the Encounter’s services. |
{: .grid}
</div>

#### Encounter, Recommended

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Encounter, Recommended**                                        | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed 		         |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| facilityLocation                                                  | [ServiceRequest.locationCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.locationCode)                       |                                                              |
| priority                                                          | [ServiceRequest.modifierExtension:isElective](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.modifierExtension:isElective)|      |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}


##### Negation Rationale for Encounter, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

### Family History

QDM defines Family History as a diagnosis or problem experienced by a
family member of the patient. Typically, a family history will not
contain very much detail, but the simple identification of a diagnosis
or problem in the patient’s family history may be relevant to the care
of the patient.

| **QDM Context**    | **QI-Core R5**                                                                                                                                                                        | **Comments**                    |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **Family History** | [FamilyMemberHistory](StructureDefinition-qicore-familymemberhistory.html)                                                                                   |                                 |
|                    | [FamilyMemberHistory.status](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.status)                 | Constrain to partial, completed |
| **QDM Attributes** |                                                                                                                                                                                       |                                 |
| code               | [FamilyMemberHistory.condition.code](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.condition.code) |                                 |
| id                 | [FamilyMemberHistory.id](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.id)                         |                                 |
| authorDatetime     | [FamilyMemberHistory.date](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.date)                     |                                 |
| relationship       | [FamilyMemberHistory.relationship](StructureDefinition-qicore-familymemberhistory-definitions.html#FamilyMemberHistory.relationship)     |                                 |
| recorder           | N/A                                                                                                                                                                                   |                                 |
{: .grid}

### Immunization

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
Immunization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-immunization.html)
profile is most consistent with the QDM datatype *Immunization,
Administered*.  The mapping tables provided include mapping from QDM
*Immunization, Administered* and a reference to the FHIR [Immunization
Evaluation](http://hl7.org/fhir/immunizationevaluation.html) resource.
Note, the mapping table includes additional metadata about immunizations
that QDM does not address, but that may be relevant to quality measures
or clinical decision support (CDS) artifacts.

#### Immunization, Administered

| **QDM Context**                | **US Core R5**                                                                                                                                                    | **Comments**                                       |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| **Immunization, Administered** | [Immunization](StructureDefinition-qicore-immunization.html)                                                                            |                                                    |
|                                | [Immunization.status](StructureDefinition-qicore-immunization-definitions.html#Immunization.status)                 | Constrain to "completed"                           |
| **QDM Attributes**             |                                                                                                                                                                  |                                                    |
| code                           | [Immunization.vaccineCode](StructureDefinition-qicore-immunization-definitions.html#Immunization.vaccineCode)       |                                                    |
| id                             | [Immunization.id](StructureDefinition-qicore-immunization-definitions.html#Immunization.id)                         |                                                    |
| dosage                         | [Immunization.doseQuantity](StructureDefinition-qicore-immunization-definitions.html#Immunization.doseQuantity)     |                                                    |
| negationRationale              | See Below |
| route                          | [Immunization.route](StructureDefinition-qicore-immunization-definitions.html#Immunization.route)                   |                                                    |
| reason                         | [Immunization.reasonCode](StructureDefinition-qicore-immunization-definitions.html#Immunization.reasonCode)         |                                                    |
| relevantDatetime               | [Immunization.occurrence\[x\]](StructureDefinition-qicore-immunization-definitions.html#Immunization.occurrence[x]) |                                                    |
| authorDatetime                 | [Immunization.recorded](StructureDefinition-qicore-immunization-definitions.html#Immunization.recorded)             |                                                    |
| performer                      | [Immunization.performer.actor](StructureDefinition-qicore-immunization-definitions.html#Immunization.performer)     |                                                    |
{: .grid}

##### Negation Rationale for Immunization, Administered

Use [QICoreImmunizationNotDone](StructureDefinition-qicore-immunizationnotdone.html), which contains:
* [Immunization.status](StructureDefinition-qicore-immunizationnotdone-definitions.html#Immunization.status) - Fixed value: "not-done"
* [Immunization.statusReason](StructureDefinition-qicore-immunizationnotdone-definitions.html#Immunization.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Immunization.recorded](StructureDefinition-qicore-immunizationnotdone-definitions.html#Immunization.recorded) - dateTime
* [Immunization.vaccineCode.extension:notDoneValueSet](StructureDefinition-qicore-immunizationnotdone-definitions.html#Immunization.vaccineCode.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific immunization that was not administered


#### Immunization, Order

This QDM context references the QI-Core MedicationRequest profile as
there is no other FHIR resource to reference an order for an
immunization. The mapping uses the QI-Core MedicationRequest resource
with the MedicationRequest.intent = *order* and
MedicationRequest.setting set to the setting most appropriate for the
intended meaning of the quality measure or clinical decision support
(CDS) expression.


| **QDM Context**         | **QI-Core R5**                                                                                                                                                                                                                  | **Comments**                                                                                                                                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Immunization, Order** | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                                                             |                                                                                                                                                                                          |
|                         | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                 | Constrain to active, completed                                                                                                                                                  |
|                         | [MedicationRequest.statusReason](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.statusReason)                                                     | The reason for ordering or not ordering the medication                                                                                                                                   |
|                         | [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                                 | Constrain to "order" for Medication, Order - note that QDM does not include Medication, Recommended - should that concept be desired, use MedicationRequest.intent constrained to "plan" |
| **QDM Attributes**      |                                                                                                                                                                                    |                                                                                                                                                                                          |
| code                    | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                 | RxNorm                                                                                                                                                                                   |
| id                      | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                         |                                                                                                                                                                                          |
| activeDatetime          | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period    | QDM defines active dateTime as when the order indicates the first immunization administration should occur. Active dateTime is most often used to specify immunizations for which administration is intended at a specific time in the future. FHIR allows specification of the period during which the immunization should occur (start dateTime to end dateTime)                                                                                                                                                                                         |
| authorDatetime          | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                         |                                                                                                                                                                                          |
| dosage                  | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Range, quantity                                                                                                                                                                          |
| route                   | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest.html#MedicationRequest.dosageInstruction.route)                                           |                                                                                                                                                                                          |
| reason                  | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| supply                  | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)                             | Amount to be dispensed in one fill                                                                                                                                                       |
| negationRationale       | See Below |
|                         | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication.                                                                                                                                  |
| requester               | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           | Note - MedicationRequest.performer indicates the performer expected to administer the medication                                                                                         |
{: .grid}

##### Negation Rationale for Immunization, Order

Use [QICoreMedicationNotRequested](StructureDefinition-qicore-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - Fixed value: "true"
* [MedicationRequest.status](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.status) - Fixed value: "completed"
* [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - dateTime when this was made available
* [MedicationRequest.medication\[x\].extension:notDoneValueSet](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x].extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific MedicationRequest that was not performed

### Individual Characteristics

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

#### QDM Entities

| **QDM Entities & Attributes** | **QI-Core R5**                                                                                                                                                                      | **Comment**    |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| **Patient**                   | [Patient](StructureDefinition-qicore-patient.html)                                                                                                         |                |
| identifier                    | [Patient.identifier.value](StructureDefinition-qicore-patient-definitions.html#Patient.identifier.value)                                           |                |
| id                            | [Patient.id](StructureDefinition-qicore-patient-definitions.html#Patient.id)                                                           |                |
| **Care Partner**              | [RelatedPerson](StructureDefinition-qicore-relatedperson.html)                                                                                             | Related Person |
| identifier                    | [RelatedPerson.identifier](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.identifier)                         |                |
| id                            | [RelatedPerson.id](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.id)                                         |                |
| relationship                  | [RelatedPerson.relationship](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.relationship)                     |                |
| **Practitioner**              | [Practitioner](StructureDefinition-qicore-practitioner.html)                                                                                               |                |
| identifier                    | [Practitioner.identifier](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.identifier) (or specific practitioner identifier types: [Practitioner.identifier:ein](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.identifier:ein))        |                |
| id                            | [Practitioner.id](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.id)                                            |                |
| role                          | [PractitionerRole.code](StructureDefinition-qicore-practitionerrole-definitions.html#PractitionerRole.code)                                                                                      |                |
| specialty                     | [PractitionerRole.specialty](StructureDefinition-qicore-practitionerrole-definitions.html#PractitionerRole.specialty)            |                |
| qualification                 | [Practitioner.qualification.code](StructureDefinition-qicore-practitioner-definitions.html#Practitioner.qualification.code) |                |
| **Organization**              | [Organization](StructureDefinition-qicore-organization.html)                                                                                               |                |
| identifier                    | [Organization.identifier](StructureDefinition-qicore-organization-definitions.html#Organization.identifier) (or specific organizational identifier types: [Organization.identifier:ccn](StructureDefinition-qicore-organization-definitions.html#Organization.identifier:ccn), [Organization.identifier:ein](StructureDefinition-qicore-organization-definitions.html#Organization.identifier:ein))                |                |
| id                            | [Organization.id](StructureDefinition-qicore-organization-definitions.html#Organization.id)                                            |                |
| organizationType              | [Organization.type](StructureDefinition-qicore-organization-definitions.html#Organization.type)                             | QDM attribute name update in QDM 5.6       |
| **Location**                  | [Location](StructureDefinition-qicore-location.html)                                                                                               | New in QDM 5.6   |
| identifier                    | [Location.identifier.value](StructureDefinition-qicore-location-definitions.html#Location.identifier:identifier.value)                | New in QDM 5.6   |
| id                            | [Location.id](StructureDefinition-qicore-location-definitions.html#Location.id)                                            | New in QDM 5.6 |
| locationType                  | [Location.type](StructureDefinition-qicore-location-definitions.html#Location.type)                             | New in QDM 5.6   |
{: .grid}

#### Patient Characteristics

| **QDM Attribute**                    | **US Core R5**                                                                                                                                                                   | **Comments**                                                                                                    |
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
| birthDatetime                        | [Patient.birthdate](StructureDefinition-qicore-patient-definitions.html#Patient.birthDate)                                         | Fixed code 21112-8                                                                                                                |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| **Clinical Trial Participant**       |                                                                                                                                                                                 | Clinical Trial Participant should be handled as an Observation (i.e., Assessment, Performed) in QDM rather than a Patient Characteristic                                                                                                                |
| **Expired**                          |                                                                                                                                                                                 |                                                                                                                 |
| code                                 | [Patient.deceased\[x\] boolean](StructureDefinition-qicore-patient-definitions.html#Patient.deceased[x])                                   |                                                                                                                 |
| id                                   |                                                                                                                                                                                 |                                                                                                                 |
| cause                                |                                                                                                                                                                                 | Expiration cause requires use of Observation                                                                    |
| expirationDatetime                   | [Patient.deceased\[x\] dateTime](StructureDefinition-qicore-patient-definitions.html#Patient.deceased[x])                                                                       |                                                               |
| **Payer**                            | [Coverage](StructureDefinition-qicore-coverage.html)                                                                                                                          |                                                                                                                 |
| code                                 | [Coverage.payor](StructureDefinition-qicore-coverage-definitions.html#Coverage.payor)                                              | QI-Core currently maps to policy holder which actually references the person who owns the policy, not the payor. |
| relevantPeriod                       | [Coverage.period](StructureDefinition-qicore-coverage-definitions.html#Coverage.period)                                            |                                                                                                                 |
| id                                   | [Coverage.id](StructureDefinition-qicore-coverage-definitions.html#Coverage.id)                                                    |                                                                                                                 |
| **Patient Characteristic (generic)** |                                                                                                                                                                                 |                                                                                                                 |
| N/A                                  |                                                                                                                                                                                 | Requires definition for modeling a characteristic to QI-Core and FHIR                                           |
{: .grid}

#### QDM *datatype* - Related Person

| **QDM Attribute**             | **QI-Core R5**                                                                                                                                                  | **Comments** |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **Related Person**            | [RelatedPerson](StructureDefinition-qicore-relatedperson.html)                                                                                                  |              |
| identifier                    | [RelatedPerson.identifier](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.identifier)     |              |
| id                            | [RelatedPerson.id](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.id)                     |              |
| linkedPatientId               | N/A                                                                                                                               | Not present in QI-Core    |
| code                          | [RelatedPerson.relationship](StructureDefinition-qicore-relatedperson-definitions.html#RelatedPerson.relationship) |              |
{: .grid}

### Intervention

QDM defines Intervention as a course of action intended to achieve a result in
the care of persons with health problems that does not involve
direct physical contact with a patient. Examples include patient
education and therapeutic communication.

#### Procedure Vs Intervention

FHIR references both of these concepts using the *Procedure* resource,
specifically noting a process that involves verification of the
patient's comprehension or to change the patient's mental state would be
a Procedure. Therefore, both QDM *datatypes*, Procedure and Intervention
are included in this section of the QDM to QI-Core mapping especially
since all of the QDM attributes for each of these QDM *datatypes* are
identical.

<div class="new-content" markdown="1">
#### Intervention, Performed

| **QDM Context**         | **QI-Core R5**                                              | **Comments**                   |
| ----------------------- | ----------------------------------------------------------- | ------------------------------ |
| **Intervention, Performed** | [Procedure](StructureDefinition-qicore-procedure.html)                   |                                                                                                           |
|                         | [Procedure.category](StructureDefinition-qicore-procedure-definitions.html#Procedure.category)        | Helps differentiate "intervention" from "procedure"                      |
| **QDM Attributes**      |                                             |                                                                                                           |
| status                  | [Procedure.status](StructureDefinition-qicore-procedure-definitions.html#Procedure.status)            | constrain to "completed"                                                                                                               |
| code                    | [Procedure.code](StructureDefinition-qicore-procedure-definitions.html#Procedure.code)                |                                                                                                           |
| id                      | [Procedure.id](StructureDefinition-qicore-procedure-definitions.html#Procedure.id)                    |                                                                                                           |
| relatedTo               |[Procedure.basedOn](StructureDefinition-qicore-procedure-definitions.html#Procedure.basedOn)|A reference to a resource that contains details of the request for this procedure. New in QDM 5.6
| method                  | N/A                            | Procedure.method does not exist in FHIR. Rather than create an extension, QI-Core's approach is to assume the Procedure.code includes reference to the method.                                                                                             |
| rank                    | [Encounter.extension.extension:rank.value\[x\]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])                                | Referenced as attributes of Encounter ([Encounter.extension.extension:rank.value[x]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])). |
| priority                | [qicore-encounter-procedure](StructureDefinition-qicore-encounter-procedure.html)      | This QDM attribute is intended to reference elective from non-elective procedures.<br/><br/>QI-Core references procedure.priority based on the relationship of the procedure to the Encounter; hence, Encounter.procedure (which is an extension). <br/><br/>The elective nature of a procedure can also be referenced based on the elective nature of an Encounter ([Encounter.priority](StructureDefinition-qicore-encounter-definitions.html#Encounter.priority)) for which the respective procedure is a principal procedure.<br/><br/>The concept may also be addressed as an Encounter, Order or Procedure, Order (both using [ServiceRequest](StructureDefinition-qicore-servicerequest.html)) and [ServiceRequest.priority](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.priority).                     |
| anatomicalLocationSite  | [Procedure.bodySite](StructureDefinition-qicore-procedure-definitions.html#Procedure.bodySite)        |                                                                                                           |
| reason                  | [Procedure.reasonCode](StructureDefinition-qicore-procedure-definitions.html#Procedure.reasonCode)                                 |                                                                                                           |
| result                  | [Observation](StructureDefinition-qicore-observation.html) that includes the element [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.           | [Procedure.report](StructureDefinition-qicore-procedure-definitions.html#Procedure.report) references [DiagnosticReport-note](StructureDefinition-qicore-diagnosticreport-note.html), DocumentReference, Composition (histology result, pathology report, surgical report, etc.); the latter two are not QI-Core resources. However, based on feedback regarding the use of the [Observation](StructureDefinition-qicore-observation.html) resource, a procedure result might be better referenced as an [Observation](StructureDefinition-qicore-observation.html) that includes the element [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.  |
|                         | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)      |Reference to a resource that contains details of the request for this procedure.                                                                                                           |
| negationRationale       | See Below |
| relevantDatetime        | [Procedure.performed\[x\] dateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                  |                                                                                                           |
| relevantPeriod          | [Procedure.performed\[x\] Period](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                    |                                                                                                           |
| incisionDatetime        | [Procedure.extension:incisionDateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.extension:incisionDateTime) |                                                                                                           |
| authorDatetime          | [Procedure.extension:recorded](StructureDefinition-qicore-procedure-definitions.html#Procedure.extension:recorded)  | The concept "author" requires a reference to a report about the procedure or about an indication the procedure was not performed. Therefore, the procedure resource does not have a reference to author dateTime. Author dateTime can reference a report about the procedure or an observation describing that result (e.g., Observation with metadata Observation.partOf procedure). However, Procedure.statusReason needs to address a dateTime that it is recorded.   |
| | [Procedure.usedReference](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.usedReference)| To add reference to a device, medication, or substance used as part of an intervention the QI-Core element to address the device is Procedure.usedReference|
| components              | N/A                            | Procedure does not include components and the concept of components references a observation that is a result of the procedure ([Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)) for which that observation has components consistent with the Observation component modeling recommendation in FHIR.                                                                          |
| component.code          | N/A                            | N/A                                                                                                       |
| component.result        | N/A                            | N/A                                                                                                       |
| performer               | [Procedure.performer.actor](StructureDefinition-qicore-procedure-definitions.html#Procedure.performer.actor)      |                                                                                                           |
{: .grid}

##### Negation Rationale for Intervention, Performed

Use [QICoreProcedureNotDone](StructureDefinition-qicore-procedurenotdone.html), which contains:
* [Procedure.status](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.status) - Fixed value: "not-done"
* [Procedure.statusReason](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Procedure.extension:recorded](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.extension:recorded) - dateTime when this was made available
* [Procedure.code.extension:notDoneValueSet](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific Procedure that was not performed
</div>

#### Intervention, Order

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Intervention, Order**                                           | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Intervention, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Intervention, Recommended

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Intervention, Recommended**                                     | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Intervention, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

<div class="new-content" markdown="1">
### Laboratory Test

QDM defines Laboratory Test as a medical procedure that involves testing a sample of blood, urine, or other body fluids or specimens. Tests can help determine a diagnosis, plan treatment, check to see if treatment is working, or monitor the disease over time. This QDM data category for Laboratory Test is only used for information about the subject of record.

Rather than directly referencing the [US Core Laboratory Result Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-lab.html), QI-Core 5.0.0 builds on that profile to add further constraint requirements as [QICore Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html). The reason for this approach is to assure Must Support elements for the interpretation element, specific result datatypes, and specific references.

Thus far, consensus opinion suggests that the US Core Observation-Lab Profile best fits the laboratory test use case for querying clinical data to retrieve information about the event and/or the result of the study. Individual studies may use the [US Core DiagnosticReport-lab](http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) to provide information about an individual laboratory test although some have considered use of other reporting resources and artifacts. Each laboratory test may be ordered individually or in a panel. Many use panels for convenience for ordering laboratory tests. Since new laboratory panels regularly become available and the myriad of potential laboratory panels available, a complete list cannot be assured. Therefore, a quality measure or clinical decision support (CDS) artifacts seeking a specific result value should use the US Core Observation-Lab profile to request a retrieve of the result value desired. This practice will enable implementers to determine which is the best source for the desired observation. LOINC observable entities may indicate specific methods for determination of results. Measure and CDS developers can reference direct reference codes or value sets using the such LOINC codes to specify the type of testing considered acceptable to provide sufficient fidelity to their requests.


#### Laboratory Test, Order

“Laboratory Test, Order” should reference orders for studies that will generate results for activities that meet criteria for Observation Lab Result.

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Laboratory Test, Order**                                        | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed  			     |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Laboratory Test, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Laboratory Test, Performed


| **QDM Context**    | **QI Core R5**           |**Comments**                           |
| ------------------ | -----------------------  | ------------------------------------- |
| **Laboratory Test, Performed** | [Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html)               |                            |
|         | [Observation.status](StructureDefinition-qicore-observation-lab-definitions.html#Observation.status)     | Constrain status to -  final, amended, corrected                          |
| **QDM Attribute**  |             |                            |
| code   | [Observation.code](StructureDefinition-qicore-observation-lab-definitions.html#Observation.code)         |                            |
| id     | [Observation.id](StructureDefinition-qicore-observation-lab-definitions.html#Observation.id)             |                            |
| method              | [Observation.method](StructureDefinition-qicore-observation-lab-definitions.html#Observation.method)     |                            |
|         | [Observation.bodySite](StructureDefinition-qicore-observation-lab-definitions.html#Observation.bodySite)             |                            |
| negationRationale  | See Below |
| reason             | [Observation.basedOn](StructureDefinition-qicore-observation-lab-definitions.html#Observation.basedOn)   | Allows reference to [QICore CarePlan](StructureDefinition-qicore-careplan.html), [QICore DeviceRequest](StructureDefinition-qicore-devicerequest.html), [QICore ImmunizationRecommendation](StructureDefinition-qicore-immunizationrec.html), [QICore MedicationRequest](StructureDefinition-qicore-medicationrequest.html), [QICore NutritionOrder](StructureDefinition-qicore-nutritionorder.html), [QICore ServiceRequest](StructureDefinition-qicore-servicerequest.html)         |
| result                | [Observation.value\[x\]](StructureDefinition-qicore-observation-lab-definitions.html#Observation.value[x])           |                            |
| interpretation        | [Observation.interpretation](StructureDefinition-qicore-observation-lab-definitions.html#Observation.interpretation)       |  New in QDM 5.6                |
|            | [Observation.specimen](StructureDefinition-qicore-observation-lab-definitions.html#Observation.specimen)             |                         |
| relatedTo             | [Observation.partOf](StructureDefinition-qicore-observation-lab-definitions.html#Observation.partOf)   | Allows reference to [QICore MedicationAdministration](StructureDefinition-qicore-medicationadministration.html), [QICore MedicationDispense](StructureDefinition-qicore-medicationdispense.html), [QICore MedicationStatement](StructureDefinition-qicore-medicationstatement.html), [QICore Procedure](StructureDefinition-qicore-procedure.html), [QICore Immunization](StructureDefinition-qicore-immunization.html), [QICore ImagingStudy](StructureDefinition-qicore-imagingstudy.html)         |
| resultDatetime       | [Observation.issued](StructureDefinition-qicore-observation-lab-definitions.html#Observation.issued)   |                            |
| relevantDatetime      | [Observation.effective\[x\]](StructureDefinition-qicore-observation-lab-definitions.html#Observation.effective[x])   |                            |
| relevantPeriod     | [Observation.effective\[x\]](StructureDefinition-qicore-observation-lab-definitions.html#Observation.effective[x])   |                            |
| status               | [Observation.status](StructureDefinition-qicore-observation-lab-definitions.html#Observation.status)     | Constrain status to -  final, amended, corrected               |
| authorDatetime     | [Observation.issued](StructureDefinition-qicore-observation-lab-definitions.html#Observation.issued)     | Issued - the date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified. The *.issued* element also addresses the time for capture of dataAbsentReason. |
| referenceRangeHigh             | [Observation.referenceRange.high](StructureDefinition-qicore-observation-lab-definitions.html#Observation.referenceRange.high)   |                            |
| referenceRangeLow              | [Observation.referenceRange.low](StructureDefinition-qicore-observation-lab-definitions.html#Observation.referenceRange.low)     |                            |
| component            | [Observation.component](StructureDefinition-qicore-observation-lab-definitions.html#Observation.component)        |                            |
|                 | [Observation.component.id](StructureDefinition-qicore-observation-lab-definitions.html#Observation.component.id)     |                            |
| component.code        | [Observation.component.code](StructureDefinition-qicore-observation-lab-definitions.html#Observation.component.code)             |                            |
| component.result     | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-lab-definitions.html#Observation.component.value[x])   |                            |
|           | [Observation.component.interpretation](StructureDefinition-qicore-observation-lab-definitions.html#Observation.component.interpretation)     |                   |
|            | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-lab-definitions.html#Observation.component.dataAbsentReason) |                            |
| component.referenceRangeHigh     | [Observation.component.referenceRange](StructureDefinition-qicore-observation-lab-definitions.html#Observation.component.referenceRange)     |                            |
| component.referenceRangeLow     | [Observation.component.referenceRange](StructureDefinition-qicore-observation-lab-definitions.html#Observation.component.referenceRange)     |                            |
| performer            | [Observation.performer](StructureDefinition-qicore-observation-lab-definitions.html#Observation.performer)           |                            |
{: .grid}

##### Negation Rationale for Laboratory Test, Performed

Use [QICoreObservationCancelled](StructureDefinition-qicore-observationcancelled.html), which contains:
* [Observation.status](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.status) - Fixed value: "cancelled"
* [Observation.extension:notDoneReason](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Observation.issued](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.issued) - dateTime when this was made available
* [Observation.code.extension:notDoneValueSet](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific Observation that was not performed
</div>

#### Laboratory Test, Recommended

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Laboratory Test, Recommended**                                  | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed  			     |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Laboratory Test, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

### Medication

QDM defines Medication as clinical drugs or chemical substances intended
for use in the medical diagnosis, cure, treatment, or prevention of
disease. Medications are defined as direct referenced values or value
sets containing values derived from code systems such as RxNorm. QDM
defines five contexts for Medication, each of which is listed below
referencing the US Core or FHIR resource which provides the expected
context:

#### Medication, Active

This QDM context correlates with a medication on a patient’s active medication
list. In QI-Core STU3, Medication, Active was mapped to MedicationStatement.
However, consistent with US Core R4 Update, medication list should use
MedicationRequest and not MedicationStatement. The mapping table provides
guidance about how to use MedicationRequest.requester to specify medications
ordered directly, those reported by a physician and those reported by the
patient for a medication list.


The MedicationRequest **SHALL** include all prescribed and “self-prescribed” medications reported by the Provider, Patient or Related Person.

* **SHALL** use reported[x] to indicate the MedicationRequest record was captured as a secondary “reported” record rather than an original primary source-of-truth record. It may also indicate the source of the report
* When recording “self-prescribed” medications **SHALL** use intent = “plan”
* When recording “self-prescribed” orders, **SHOULD** use the requester to indicate the Patient or RelatedPerson as the prescriber

| **QDM Context**            | **QI-Core R5**                                                                                                                                                                                                                                   | **Comments**                                                                                                                                                  |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Active**     | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                                                                               |                                                                                                                                                               |
|                            | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                                   | Constrain to "active"                                                                                                                                         |
|                            | [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                                                   | When recording “self-prescribed” medications SHALL use intent = “plan” for prescribed use intent = "order"                                                                                                                                                              |
|                            | [MedicationRequest.reported[x]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reported[x])                                                                                   | When recording “self-prescribed” medications SHALL use reported[x] to indicate the MedicationRequest record was captured as a secondary “reported” record rather than an original primary source-of-truth record                                                                                                                                                              |
|                            | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                                                               | inpatient, outpatient, community, patient-specified                                                                                                           |
| **QDM Attribute**          |                                                                                                                                                                                                                                                  |                                                                                                                                                               |
| code                       | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                               |                                                                                                                                                               |
| id                         | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                                           |                                                                                                                                                               |
| dosage                     | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x])                                                  | Amount of medication per dose                              |
| frequency                  | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)                                               |                                                     |
| route                      | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)                                                                       |                                                                                                                                                               |
|                            | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                                           |                                                                                                                                                               |
| relevantDatetime           | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime                                                        |                                                                                                                                                               |
| relevantPeriod             | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period |                                                      |
|                            | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                                       | Author dateTime not referenced in QDM                                                                                                                         |
| recorder                   | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                   | To address all medications on a medication list, use MedicationRequest with status = active; intent = order; and requester = organization (for prescribed medications for which an order exists), requester = practitioner (for medications entered by clinicians but not ordered), and intent = plan and requester = patient or RelatedPerson (for patient/related person reported)|
{: .grid}

#### Medication, Administered

This QDM context correlates with a record of a patient consuming or
otherwise being administered a medication. It references individual
medication administration events and, therefore, may not reference
frequency of administration. Note that a separate QDM and US Core
profile address Immunization, Administered.


| **QDM Context**              | **QI-Core R5**                                                                                                                                                                                             | **Comments**                                                            |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| **Medication, Administered** | [MedicationAdministration](StructureDefinition-qicore-medicationadministration.html)                                                                          |                                                                         |
|                              | [MedicationAdministration.status](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.status)                       | Constrain status to "In-progress" or "completed" Note: Measures that look for evidence of potential adverse events might use MedicationAdministration.status = on-hold, or stopped as possible indicators of such events.                       |
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
| author dateTime              | [MedicationAdministration.extension:recorded](StructureDefinition-qicore-medicationadministrationnotdone-definitions.html#MedicationAdministration.extension:recorded)        |                                                                         |
| Negation Rationale           | See Below |
| Performer                    | [MedicationAdministration.performer.actor](StructureDefinition-qicore-medicationadministration-definitions.html#MedicationAdministration.performer.actor)     |                                                                         |
{: .grid}


##### Negation Rationale for Medication, Administered

Use [QICoreMedicationAdministrationNotDone](StructureDefinition-qicore-medicationadministrationnotdone.html), which contains:
* [MedicationAdministration.status](StructureDefinition-qicore-medicationadministrationnotdone-definitions.html#MedicationAdministration.status) - Fixed value: "not-done"
* [MedicationAdministration.statusReason](StructureDefinition-qicore-medicationadministrationnotdone-definitions.html#MedicationAdministration.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationAdministration.extension:recorded](StructureDefinition-qicore-medicationadministrationnotdone-definitions.html#MedicationAdministration.extension:recorded) - dateTime when this was made available
* [MedicationAdministration.medication\[x\].extension:notDoneValueSet](StructureDefinition-qicore-medicationadministrationnotdone-definitions.html#MedicationAdministration.medication[x].extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific MedicationAdministration that was not performed

#### Medication, Discharge

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


| **QDM Context**                        | **QI-Core R5**                                                                                                                                                                                                                  | **Comments**                                                                                                                                                                             |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Discharge**              | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                               |                                                                                                                                                                                          |
| Medication, Discharge active           | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                 | Constrain to "active"  |
|                                        | [MedicationRequest.statusReason](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.statusReason)                                                     |                                                                                                                                                                                          |
| **QDM Attributes**                     |                                                                                                                                                                                                |                                                                                                                                                                                          |
| code                                   | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                 | RxNorm                                                                                                                                                                                   |
| id                                     | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                         |                                                                                                                                                                                          |
| dosage                                 | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Range, quantity                                                                                                                                                                          |
| supply                                 | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)                             | Amount to be dispensed in one fill                                                                                                                                                       |
| daysSupplied                           | [MedicationRequest.dispenseRequest.expectedSupplyDuration](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.expectedSupplyDuration) | Duration                                                                                                                                                                                 |
| frequency                              | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)                             | Timing schedule (e.g., every 8 hours)                                                                                                                                                    |
| refills                                | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) | Integer                                                                                                                                                                                  |
| route                                  | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)                               |                                                                                                                                                                                      |
| setting                                | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                                             | Constrain category to "Community"                                                                                                                   |
| reason                                 | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| relevantDatetime                       | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime                                                                         |                                               |
| relevantPeriod                         | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period   |                                                                                                                                                                                          |
| authorDatetime                         | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                         |                                                                                                                                                                                          |
| negationRationale                      | See Below |
| prescriber                             | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           | Note - MedicationRequest.performer indicates the performer expected to administer the medication                                                                                         |
{: .grid}


##### Negation Rationale for Medication, Discharge

Use [QICoreMedicationNotRequested](StructureDefinition-qicore-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - Fixed value: "true"
* [MedicationRequest.status](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.status) - Fixed value: "completed"
* [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - dateTime when this was made available
* [MedicationRequest.medication\[x\].extension:notDoneValueSet](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x].extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific MedicationRequest that was not performed

#### Medication, Dispensed

This QDM context maps to the QI-Core MedicationDispense resource,
indicating information about medications that have been dispensed.


| **QDM Context**               | **QI-Core R5**                                                                                                                                                                                                                  | **Comments**                                                                                                                     |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Dispensed**     | [MedicationDispense](StructureDefinition-qicore-medicationdispense.html)                                                                                                           |                                                                                                                                  |
|                               | [MedicationDispense.status](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.status)                                                              | Constrain MedicationDispense.status to completed                                                                |
| **QDM Attributes**            |                                                                                                                                                                                    |                                                                                                                                  |
| code                          | [MedicationDispense.medication\[x\]](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.medication[x])                                              |                                                                                                                                  |
| id                            | [MedicationDispense.id](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.id)                                                                      |                                                                                                                                  |
| dosage                        | [MedicationDispense.dosageInstruction](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction)                                        | ordered, calculated                                                                                                              |
| supply                        | [MedicationDispense.quantity](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.quantity)                                                          |                                                                                                                                  |
| daysSupplied                  | [MedicationDispense.daysSupply](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.daysSupply)                                                      |                                                                                                                                  |
| frequency                     | [MedicationDispense.dosageInstruction.timing](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction.timing)                          | See dosageInstruction                                                                                                            |
| refills                       | [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)                            | Reference authorizing prescription ([MedicationRequest](StructureDefinition-qicore-medicationrequest.html)) which contains Medication.Request.dispsenseRequest.numberOfRepeatsAllowed |
|                               | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) | Timing schedule (e.g., every 8 hours). [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription) provides reference to the applicable [MedicationRequest](StructureDefinition-qicore-medicationrequest.html) for this information.            |
| route                         | [MedicationDispense.dosageInstruction.route](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.dosageInstruction.route)                            | See dosageInstruction                                                                                                            |
| setting                       | [MedicationDispense.category](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.category)                                                          | Inpatient, Outpatient, Community, Discharge                                                                                      |
| reason                        | [MedicationDispense.statusReason\[x\]](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.statusReason[x])                                          | The reason for ordering or not ordering the medication                                                                           |
| relatedTo                     | [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)                                          | New in QDM 5.6                                            |
| relevant dateTime             | [MedicationDispense.whenHandedOver](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.whenHandedOver)                                              | When provided to patient or representative. Recommendations from pharmacy experts suggest that all medication dispensing events include a time for MedicationDispense.whenPrepared (i.e., when the dispensed product was packaged and reviewed. The time the medication was handed over to the patient or representative may not be populated. Note that medications not picked up are restocked such that a MedicationDispense.status = completed will assure the patient or representative received the medication even if whenHandedOver is not available. Therefore, measure developers should consider including the time whenPrepared if whenHandedOver is null and status = completed.                                |
| relevant Period               | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period     | The anticipated time from starting to stopping an ordered or dispensed medication can also be computed in an expression and derived from the duration attribute             |
| author dateTime               | [MedicationDispense.extension:recorded](StructureDefinition-qicore-medicationdispensedeclined-definitions.html#MedicationDispense.extension:recorded)                                                                |                                                                                                                                  |
| Negation Rationale            | See Below |
| Prescriber                    | [MedicationDispense.authorizingPrescription](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)                            | Reference authorizing prescription (MedicationRequest) which contains Medication.Request.requester                               |
|                               | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           |                                                                                                                                  |
| dispenser                     | [MedicationDispense.performer.actor](StructureDefinition-qicore-medicationdispense-definitions.html#MedicationDispense.performer.actor)                                            |                                                                                                                                  |
{: .grid}


##### Negation Rationale for Medication, Dispensed

Use [QICoreMedicationDispenseDeclined](StructureDefinition-qicore-medicationdispensedeclined.html), which contains:
* [MedicationDispense.status](StructureDefinition-qicore-medicationdispensedeclined-definitions.html#MedicationDispense.status) - Fixed value: "declined"
* [MedicationDispense.statusReason\[x\]](StructureDefinition-qicore-medicationdispensedeclined-definitions.html#MedicationDispense.statusReason[x]) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationDispense.extension:recorded](StructureDefinition-qicore-medicationdispensedeclined-definitions.html#MedicationDispense.extension:recorded) - dateTime when this was made available
* [MedicationDispense.medication\[x\].extension:notDoneValueSet](StructureDefinition-qicore-medicationdispensedeclined-definitions.html#MedicationDispense.medication[x].extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific MedicationDispense that was not performed

The MedicationDispensed.status is fixed to "declined" which is defined as "The dispense was declined and not performed."  Considering the clinical workflow, only the pharmacist likely performs the "decline" status - based on medication interaction or on failure of insurance authorization (perhaps due to patient declining when the cost/co-pay is identified). But the patient would not enter the status, only the pharmacist would do so. The use case likely still works for the measure developer intent (that a valid reason exists for not dispensing the medication). However, if the measure developer wants to address patient's decisions to avoid dispensing, the patient will likely not show up at the pharmacy for the medication to be dispensed - hence, there will be no dispensing event. The best way to capture that scenario may be to assure the MedicationRequest includes a Patient reason.

<div class="new-content" markdown="1">
#### Medication, Order

This QDM context references the QI-Core MedicationRequest resource with
MedicationRequest.intent = *order* and MedicationRequest.setting
as the most appropriate for the intended meaning of the quality
measure or clinical decision support (CDS) expression.


| **QDM Context**                        | **QI-Core R5**                                                                                                                                                                                                                  | **Comments**                                                                                                                                                                             |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Medication, Order**                  | [MedicationRequest](StructureDefinition-qicore-medicationrequest.html)                                                                               |                                                                                                                                                                                          |
| Medication, Order active               | [MedicationRequest.status](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.status)                                                                 | Constrain to active, completed           |
|                                        | [MedicationRequest.statusReason](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.statusReason)                                                     |                                                                                                                                                                                          |
|                            | [MedicationRequest.intent](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.intent)                                                                                   | When recording “self-prescribed” medications SHALL use intent = “plan” for prescribed use intent = "order"                                                                                                                                                              |
|                            | [MedicationRequest.reported[x]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reported[x])                                                                                   | When recording “self-prescribed” medications SHALL use reported[x] to indicate the MedicationRequest record was captured as a secondary “reported” record rather than an original primary source-of-truth record                                                                                                                                                              |
| **QDM Attributes**                     |                                                                                                                                                                                                |                                                                                                                                                                                          |
| code                                   | [MedicationRequest.medication\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.medication[x])                                                 | RxNorm                                                                                                                                                                                   |
| id                                     | [MedicationRequest.id](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.id)                                                                         |                                                                                                                                                                                          |
| dosage                                 | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Range, quantity                                                                                                                                                                          |
| supply                                 | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)                             | Amount to be dispensed in one fill                                                                                                                                                       |
| daysSupplied                           | [MedicationRequest.dispenseRequest.expectedSupplyDuration](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.expectedSupplyDuration) | Duration                                                                                                                                                                                 |
| frequency                              | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)                             | Timing schedule (e.g., every 8 hours)                                                                                                                                                    |
| refills                                | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) | Integer                                                                                                                                                                                  |
| route                                  | [MedicationRequest.dosageInstruction.route](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)                                                                                                                                           |                                                                                                                                                                                          |
| setting                                | [MedicationRequest.category](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.category)                                                             | Constrain category to: Inpatient, Outpatient, Community                                                                    |
| reason                                 | [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.reasonCode)                                                         | The reason for ordering or not ordering the medication                                                                                                                                   |
| relatedTo                              | [MedicationRequest.basedOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.basedOn)                                                         | New in QDM 5.6                                                                                                                                  |
| relevantDatetime                       | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime         |                                                                                                                                                                                          |
| relevantPeriod                         | [MedicationRequest.dosageInstruction.timing](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) with [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period     | The anticipated time from starting to stopping an ordered or dispensed medication can also be computed in an expression and derived from the duration attribute             |
| authorDatetime                         | [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.authoredOn)                                                         |                                                                                                                                                                                          |
| negationRationale                      | See Below |
| prescriber                             | [MedicationRequest.requester](StructureDefinition-qicore-medicationrequest-definitions.html#MedicationRequest.requester)                                                           | Note – The prescriber is the MedicationRequest.requester and not the MedicationRequest.performer which indicates the performer expected to administer the medication                                                                                         |
{: .grid}

##### Negation Rationale for Medication, Order

Use [QICoreMedicationNotRequested](StructureDefinition-qicore-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - Fixed value: "true"
* [MedicationRequest.status](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.status) - Fixed value: "completed"
* [MedicationRequest.reasonCode](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - dateTime when this was made available
* [MedicationRequest.medication\[x\].extension:notDoneValueSet](StructureDefinition-qicore-medicationnotrequested-definitions.html#MedicationRequest.medication[x].extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific MedicationRequest that was not performed
</div>

### Participation

QDM defines Participation as a patient’s coverage by a program such as
an insurance or medical plan or a payment agreement. Such programs can
include patient-centered medical home, disease-specific programs, etc.
Definitions modeled similar to the FHIR R4
[Coverage](http://hl7.org/fhir/coverage.html) resource.

| **QDM Context**         | **QI-Core R5**                                                                                                                       | **Comments**          |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | --------------------- |
| **Participation**       | [Coverage](StructureDefinition-qicore-coverage.html)                                    |                       |
|                         | [Coverage.status](StructureDefinition-qicore-coverage-definitions.html#Coverage.status) | Constrain to "active" |
| **QDM Attributes**      |                                                                                                     |                       |
| code                    | [Coverage.type](StructureDefinition-qicore-coverage-definitions.html#Coverage.type)     |                       |
| id                      | [Coverage.id](StructureDefinition-qicore-coverage-definitions.html#Coverage.id)         |                       |
| participationPeriod     | [Coverage.period](StructureDefinition-qicore-coverage-definitions.html#Coverage.period) |                       |
{: .grid}

<div class="new-content" markdown="1">
### Physical Exam

QDM defines Physical Exam as the evaluation of the patient’s body and/or
mental status exam to determine its state of health. The techniques of
examination can include palpation (feeling with the hands or fingers),
percussion (tapping with the fingers), auscultation (listening), visual
inspection or observation, inquisition and smell. Measurements may
include vital signs (blood pressure, pulse, respiration) as well as
other clinical measures (such as expiratory flow rate and size of lesion).
Physical exam includes psychiatric examinations.

US Core STU5 added twelve observation profiles that address specific elements of physical examinations. The previous version inherited the [FHIR Vital Signs Profile](http://hl7.org/fhir/R4/observation-vitalsigns.html); in version STU5, US Core created specific profiles for each of those vital sign elements, resulting in a Vital Signs Profile with 12 component profiles that meet the definition of QDM “Physical Examination”.  The following table lists each profile and the respective data element codes referenced in each of those profiles.

| **Profile**         | **Data element codes**                                                                                                                       |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| [US Core Vital Signs Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-vital-signs.html)    | Vital Signs (panel) – **Fixed Value:** 85353-1                                    |
|  [US Core Pediatric Head Occipital-frontal Circumference Percentile Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html)                       | Head Occipital-Frontal Circumference Percentile - **Fixed Value:** 8289-1 |
| [US Core Blood Pressure Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html)      |   •Blood Pressure Systolic and Diastolic – **Fixed Value:** 85354-9<br>•Systolic Blood Pressure – **Fixed Value:** 8480-6<br>•Diastolic Blood Pressure – **Fixed Value:** 8462-4<br>•valueQuantity - **Fixed Value:** mm[Hg]<br> |
|[US Core BMI Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html) |•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br> •ValueQuantity.code - Coded responses from the common UCUM units for vital signs value set - **Fixed Value:** kg/m2<br>|
|[US Core Body Height Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html)  |•Body Height – **Fixed Value:** 8302-2<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - - Coded responses from the common UCUM units for vital signs value set - **Binding:** [BodyLengthUnits](http://hl7.org/fhir/R4/valueset-ucum-bodylength.html) ([required](http://hl7.org/fhir/R4/terminologies.html#required))|
| [US Core Body Temperature Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html) | •Body Temperature – **Fixed Value:** 8310-5<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - - Coded responses from the common UCUM units for vital signs value set –  **Binding:** [BodyTemperatureUnits](http://hl7.org/fhir/R4/valueset-ucum-bodytemp.html) ([required](http://hl7.org/fhir/R4/terminologies.html#required))|
| [US Core Body Weight Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html)     | •Body Weight – **Fixed Value:** 29463-7<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code – Coded responses from the common UCUM units for vital signs value set – **Binding:** [BodyWeightUnits](http://hl7.org/fhir/R4/valueset-ucum-bodyweight.html) ([required](http://hl7.org/fhir/R4/terminologies.html#required))|
|[US Core Head Circumference Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html)| •Head Circumference – **Fixed Value:** 9843-4<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - Coded responses from the common UCUM units for vital signs value set - **Binding:** [BodyLengthUnits](http://hl7.org/fhir/R4/valueset-ucum-bodylength.html) ([required](http://hl7.org/fhir/R4/terminologies.html#required))|
|[US Core Heart Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html)| •Vital Signs – Heart Rate – **Fixed Value:**  8867-4<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - **Fixed Value:** /min|
|[US Core Pediatric BMI for Age Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html)| •Pediatric BMI for Age – **Fixed Value:** 59576-9<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org |
|[US Core Pediatric Weight for Height Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html)| •Pediatric Weight for Height – **Fixed Value:** 77606-2<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - Coded responses from the common UCUM units for vital signs value set. **Fixed Value:** %|
|[US Core Pulse Oximetry Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html)| •Pulse Oximetry – **Fixed Value:** 59408-5<br>•O2 Saturation - **Fixed Value:** 2708-6<br>•Flow rate **Fixed Value:** 2708-6<br>•Flow rate Value quantity **Fixed Value:** L/min<br>•Concentration **Fixed Value:** 3150-0<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code – **Fixed Value:** % |
|[US Core Respiratory Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html)| •Vital Signs – Respiratory Rate – **Fixed Value:** 9279-1<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - Coded responses from the common UCUM units for vital signs value set - **Fixed Value:** /min|
{: .grid}


#### Physical Exam, Order

QDM “Physical Exam, Order” should use ServiceRequest with *intent* = order for the specific examination requested.

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Physical Exam, Order**                                          | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed    		     |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| anatomicalLocationSite                                            | [ServiceRequest.bodySite](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.bodySite)                               |                                                              |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Physical Exam, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed


#### Physical Exam, Performed

QDM “Physical Exam, Performed” should reference the specific US Core vital signs profiles directly as appropriate. Some results may also be identified using the QICore Observation Clinical Test Result profile. The QI-Core generic Observation profile may be appropriate for other physical examination observations not covered by the Observation Clinical Test Result profile.

| **QDM Context**                        | **QI-Core R5**                                                                                                                                                                        | **Comments**                                                                                                                                                                                                                          |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Physical Exam, Performed - General** | [Observation](StructureDefinition-qicore-observation.html)                                                                               |                                                                                                                                                                                                                                       |
|                                        | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                                         | Constrain status to -  final, amended, corrected                                                                                                                                                                                      |
|                                        | [Observation.category](StructureDefinition-qicore-observation-definitions.html#Observation.category)                                     | Constrain to "exam" \[Observations generated by physical exam findings including direct observations made by a clinician and use of simple instruments and the result of simple maneuvers performed directly on the patient's body.\] |
| **QDM Attributes**                     |                                                                                                                                          |                                                                                                                                                                                                                                       |
| code                                   | [Observation.code](StructureDefinition-qicore-observation-definitions.html#Observation.code)                                             |                                                                                                                                                                                                                                       |
| id                                     | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                                                 |                                                                                                                                                                                                                                       |
| anatomicalLocationSite                 | [Observation.bodySite](StructureDefinition-qicore-observation-definitions.html#Observation.bodySite)                                     |                                                                                                                                                                                                                                       |
| relatedTo                              | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | A plan, proposal or order that is fulfilled in whole or in part by this event. For example, a MedicationRequest may require a patient to have laboratory test performed before it is dispensed. New in QDM 5.6                                  |
|                                        | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)                                         | Reference a MedicationAdministration, MedicationDispense, MedicationStatement, Procedure, Immunization, or ImagingStudy during which this physical examination is performed as part of a larger activity.                                                                                                       |
| negationRationale                      | See Below |
| reason                                 | [Observation.basedOn](StructureDefinition-qicore-observation-definitions.html#Observation.basedOn)                                       | Reference a CarePlan, DeviceRequest, ImmunizationRecommendation, MedicationRequest, NutritionOrder, or ServiceRequest that is the reason for this physical examination                                            |
| result                                 | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])                                   |                                                                                                                                                                                                                                       |
|                                        | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation)                         |                                                                                                                                                                                                                                       |
| relevantDatetime                       | [Observation.effective\[x\] dateTime](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                  |                                                                                                                                                                                                                                       |
| relevantPeriod                         | [Observation.effective\[x\] Period](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])                    |                                                                                                                                                                                                                                       |
| authorDatetime                         | [Observation.issued](StructureDefinition-qicore-observation-definitions.html#Observation.issued)                                         |                                                                                                                                                                                                                                       |
| component                              | [Observation.component](StructureDefinition-qicore-observation-definitions.html#Observation.component)                                   |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.id](StructureDefinition-qicore-observation-definitions.html#Observation.component.id)                             |                                                                                                                                                                                                                                       |
| component.code                         | [Observation.component.code](StructureDefinition-qicore-observation-definitions.html#Observation.component.code)                         |                                                                                                                                                                                                                                       |
| component.result                       | [Observation.component.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.component.value[x])               |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.component.interpretation)     |                                                                                                                                                                                                                                       |
|                                        | [Observation.component.dataAbsentReason](StructureDefinition-qicore-observation-definitions.html#Observation.component.dataAbsentReason) |                                                                                                                                                                                                                                       |
| performer                              | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)                                   |                                                                                                                                                                                                                                       |
{: .grid}

##### Negation Rationale for Physical Exam, Performed

Use [QICoreObservationCancelled](StructureDefinition-qicore-observationcancelled.html), which contains:
* [Observation.status](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.status) - Fixed value: "cancelled"
* [Observation.extension:notDoneReason](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Observation.issued](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.issued) - dateTime when this was made available
* [Observation.code.extension:notDoneValueSet](StructureDefinition-qicore-observationcancelled-definitions.html#Observation.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific Observation that was not performed


#### Physical Exam, Recommended

QDM “Physical Exam, Recommended” should use ServiceRequest with *intent* = plan for the specific examination recommended.

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Physical Exam, Recommended**                                    | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to active, completed   		     |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| anatomicalLocationSite                                            | [ServiceRequest.bodySite](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.bodySite)                               |                                                              |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Physical Exam, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed
</div>

### Procedure

QDM defines Procedure as an act whose immediate and primary outcome
(post-condition) is the alteration of the physical condition of the subject. A
*procedure* may be a surgery or other type of physical manipulation of a
person’s body in whole or in part for purposes of making observations and
diagnoses or providing treatment.

#### Procedure Vs Intervention

FHIR references both of these concepts using the Procedure resource, specifically
noting a process that involves verification of the patient’s comprehension or
to change the patient’s mental state would be a Procedure.

#### Procedure Vs Task

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


The sponsoring work group is specifically seeking feedback on the following
suggestions for use of Task rather than Procedure for workflow steps that require
attestation such as medication list review or reconciliation:
Example: A workflow step to review or to reconcile medication lists may be considered
a Task to perform the Procedure that includes reviewing the medication list with the
patient to assure it is correct and to educate the patient about proper medication usage.
Thus, a Task can reference the Task.focus as a procedure.

QDM 5.6 does not address Task; therefore, there is no direct mapping
from QDM Intervention or Procedure to the FHIR Task resource.  The
mapping presented is from QDM to QI-Core referencing the FHIR Procedure
resource.

Consistent with the method for specifying QDM’s concept negation rationale, a [TaskRejected](StructureDefinition-qicore-taskrejected.html) is represented with the following content:
* [Task.status](StructureDefinition-qicore-taskrejected-definitions.html#Task.status) with valueset-task-status constrained to "rejected" (The potential performer who claimed ownership of the task has decided not to execute it prior to performing any action.)
* [Task.statusReason](StructureDefinition-qicore-taskrejected-definitions.html#Task.statusReason) binding to Negation Reason Codes (extensible)
* [Task.code](StructureDefinition-qicore-taskrejected-definitions.html#Task.code) (Codes to identify how the task manages fulfillment of activities - the specific choice depends on the measure context) the direct reference code, it needs a cardinality of 1..1 and binding to the code or value set (it would need a notDoneValueSet URL: [notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to reference the value set not performed
* [Task.focus](StructureDefinition-qicore-taskrejected-definitions.html#Task.focus) to reference the Resource (likely procedure) the task was acting on
* [Task.encounter](StructureDefinition-qicore-taskrejected-definitions.html#Task.encounter) (Healthcare event during which this task originated)
* [Task.for](StructureDefinition-qicore-taskrejected-definitions.html#Task.for) (Beneficiary of the Task) Reference (qicore-patient)
* [Task.executionPeriod](StructureDefinition-qicore-taskrejected-definitions.html#Task.executionPeriod) for the period/dateTime - the timing the task was rejected and the reason.

#### Procedure Priority

QDM 5.6 includes a new attribute for Procedure: *priority* with the
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

<div class="new-content" markdown="1">
#### Procedure, Performed


| **QDM Context**         | **QI-Core R5**                                              | **Comments**                   |
| ----------------------- | ----------------------------------------------------------- | ------------------------------ |
| **Procedure, Performed**| [Procedure](StructureDefinition-qicore-procedure.html)                   |                                                                                                           |
|                         | [Procedure.category](StructureDefinition-qicore-procedure-definitions.html#Procedure.category)        | Helps differentiate "intervention" from "procedure"                                                                                                       |
| **QDM Attributes**      |                                             |                                                                                                           |
| status                  | [Procedure.status](StructureDefinition-qicore-procedure-definitions.html#Procedure.status)            | constrain to "completed"                                                                                                               |
| code                    | [Procedure.code](StructureDefinition-qicore-procedure-definitions.html#Procedure.code)                |                                                                                                           |
| id                      | [Procedure.id](StructureDefinition-qicore-procedure-definitions.html#Procedure.id)                    |                                                                                                           |
| relatedTo               |[Procedure.basedOn](StructureDefinition-qicore-procedure-definitions.html#Procedure.basedOn)|A reference to a resource that contains details of the request for this procedure. New in QDM 5.6 |
| method                  | N/A                            | Procedure.method does not exist in FHIR. Rather than create an extension, QI-Core's approach is to assume the Procedure.code includes reference to the method.                                                                                             |
| rank                    | [Encounter.extension.extension:rank.value\[x\]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])                                | Referenced as attributes of Encounter ([Encounter.extension.extension:rank.value[x]:valuePositiveInt](StructureDefinition-qicore-encounter-procedure-definitions.html#Extension.extension:rank.value[x])). |
| priority                | [qicore-encounter-procedure](StructureDefinition-qicore-encounter-procedure.html)      | This QDM attribute is intended to reference elective from non-elective procedures.<br/><br/>QI-Core references procedure.priority based on the relationship of the procedure to the Encounter; hence, Encounter.procedure (which is an extension). <br/><br/>The elective nature of a procedure can also be referenced based on the elective nature of an Encounter ([Encounter.priority](StructureDefinition-qicore-encounter-definitions.html#Encounter.priority)) for which the respective procedure is a principal procedure.<br/><br/>The concept may also be addressed as an Encounter, Order or Procedure, Order (both using [ServiceRequest](StructureDefinition-qicore-servicerequest.html)) and [ServiceRequest.priority](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.priority).                     |
| anatomicalLocationSite  | [Procedure.bodySite](StructureDefinition-qicore-procedure-definitions.html#Procedure.bodySite)        |                                                                                                           |
| reason                  | [Procedure.reasonCode](StructureDefinition-qicore-procedure-definitions.html#Procedure.reasonCode)                                 |                                                                                                           |
| result                  | [Observation](StructureDefinition-qicore-observation.html) that includes the element [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.           | [Procedure.report](StructureDefinition-qicore-procedure-definitions.html#Procedure.report) references [DiagnosticReport-note](StructureDefinition-qicore-diagnosticreport-note.html), DocumentReference, Composition (histology result, pathology report, surgical report, etc.); the latter two are not QI-Core resources. However, based on feedback regarding the use of the [Observation](StructureDefinition-qicore-observation.html) resource, a procedure result might be better referenced as an [Observation](StructureDefinition-qicore-observation.html) that includes the element [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.  |
|                         | [Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)      |Reference to a resource that contains details of the request for this procedure.                                                                                                           |
| Negation Rationale              | See Below |
| Relevant dateTime       | [Procedure.performed\[x\] dateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                  |                                                                                                           |
| Relevant Period         | [Procedure.performed\[x\] Period](StructureDefinition-qicore-procedure-definitions.html#Procedure.performed[x])                    |                                                                                                           |
| Incision dateTime       | [Procedure.extension:incisionDateTime](StructureDefinition-qicore-procedure-definitions.html#Procedure.extension:incisionDateTime) |                                                                                                           |
| Author dateTime         | [Procedure.extension:recorded](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.extension:recorded)   | The concept "author" requires a reference to a report about the procedure or about an indication the procedure was not performed. Therefore, the procedure resource does not have a reference to author dateTime. Author dateTime can reference a report about the procedure or an observation describing that result (e.g., Observation with metadata Observation.partOf procedure). However, Procedure.statusReason needs to address a dateTime that it is recorded.   |
| | [Procedure.usedReference](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.usedReference)| To add reference to a device, medication, or substance used as part of a procedure the QI-Core element to address the device is Procedure.usedReference|
| Components              | N/A                            | Procedure does not include components and the concept of components references a observation that is a result of the procedure ([Observation.partOf](StructureDefinition-qicore-observation-definitions.html#Observation.partOf)) for which that observation has components consistent with the Observation component modeling recommendation in FHIR.                                                                          |
| Component code          | N/A                            | N/A                                                                                                       |
| Component result        | N/A                            | N/A                                                                                                       |
| Performer               | [Procedure.performer.actor](StructureDefinition-qicore-procedure-definitions.html#Procedure.performer.actor)      |                                                                                                           |
{: .grid}

##### Negation Rationale for Procedure, Performed

Use [QICoreProcedureNotDone](StructureDefinition-qicore-procedurenotdone.html), which contains:
* [Procedure.status](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.status) - Fixed value: "not-done"
* [Procedure.statusReason](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.statusReason) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [Procedure.extension:recorded](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.extension:recorded) - dateTime when this was made available
* [Procedure.code.extension:notDoneValueSet](StructureDefinition-qicore-procedurenotdone-definitions.html#Procedure.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific Procedure that was not performed
</div>

#### Procedure, Order

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Procedure, Order**                                              | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "order" (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDatetime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Procedure, Order

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Procedure, Recommended

| **QDM Context**                                                   | **QI-Core R5**                                                                                                                                                                           | **Comments**                                                 |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Procedure, Recommended**                                        | [ServiceRequest](StructureDefinition-qicore-servicerequest.html)                                                                            |                                                              |
|                                                                   | [ServiceRequest.status](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.status)                                   | Constrain to one or more of active, completed       |
|                                                                   | [ServiceRequest.intent](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.intent)                                   | Constrain only to "plan"                                     |
| **QDM Attributes**                                                |                                                                                                                                             |                                                              |
| code                                                              | [ServiceRequest.code](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.code)                                       |                                                              |
| id                                                                | [ServiceRequest.id](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.id)                                           |                                                              |
| reason                                                            | [ServiceRequest.reasonCode](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.reasonCode)                           |                                                              |
| authorDateTime                                                    | [ServiceRequest.authoredOn](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.                                                             |
| negationRationale                                                 | See Below |
| requester                                                         | [ServiceRequest.requester](StructureDefinition-qicore-servicerequest-definitions.html#ServiceRequest.requester)                             |                                                              |
{: .grid}

##### Negation Rationale for Procedure, Recommended

Use [QICoreServiceNotRequested](StructureDefinition-qicore-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - Fixed value: "true"
* [ServiceRequest.status](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.status) - Fixed value: "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](http://hl7.org/fhir/us/qicore/ValueSet-qicore-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-qicore-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [qicore-notDoneValueSet](StructureDefinition-qicore-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

### Substance

#### Substance, Administered; Substance, Order; Substance Recommended

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


| **QDM Context**                                    | **QI-Core R5**                                                                                                                                                         | **Comments**                                          |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| **Substance, Order/Recommended - For Diet Orders** | [NutritionOrder](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder)                                                                                                           | Limited to orders for diets or diets with supplements |
| Substance Order/Recommended Activity               | [NutritionOrder.status](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.status)                                                                  | Constrain to active, completed               |
| Substance, Order                                   | [NutritionOrder.intent](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.intent)                                                                  | Constrain to "order" and child concepts                                  |
| Substance, Recommended                             | [NutritionOrder.intent](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.intent)                                                                  | Constrain to "plan"               |
| **QDM Attributes**                                 |                                                                                                                                    |                                                       |
| ORAL DIET                                          | [NutritionOrder.oralDiet](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet)                                                              |                                                       |
| code (to represent a diet order)                   | [NutritionOrder.oralDiet.type](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet.type)                                                    |                                                       |
|                                                    | [NutrientOrder.oralDiet.nutrient.modifier](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet.nutrient.modifier)                           |                                                       |
| id                                                 | [NutritionOrder.id](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.id)                                                                                                                       |                                                       |
| dosage                                             | N/A                                                                                                                                                                 |                                                       |
| frequency                                          | [NutritionOrder.Diet.schedule](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet.schedule)                                                |                                                       |
| negationRationale                                  | N/A                                                                                                                                                                 |                                                       |
| authorDatetime                                     | [NutritionOrder.dateTime](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.dateTime)                                                              |                                                       |
| relevantPeriod                                     | N/A                                                                                                                                                                 |                                                       |
| reason                                             | N/A                                                                                                                                                                 |                                                       |
| supply                                             | N/A                                                                                                                                                                 |                                                       |
| refills                                            | N/A                                                                                                                                                                 |                                                       |
| route                                              | [NutritionOrder.oralDiet](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.oralDiet)                                                              |                                                       |
| requester                                          | [NutritionOrder.orderer](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.orderer)                                                                |                                                       |
| ENTERAL FORMULA                                    | [NutritionOrder.enteralFormula](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula)                                                  |                                                       |
| code (to represent a diet order)                   | [NutritionOrder.enteralFormula.baseFormulaType](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.baseFormulaType)                  |                                                       |
| Additive to diet order                             | [NutritionOrder.enteralFormula.additiveType](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.additiveType)                        |                                                       |
| id                                                 | N/A                                                                                                                                                                 |                                                       |
| dosage                                             | [NutritionOrder.enterealFormula.administration.quantity](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.quantity) |                                                       |
| frequency                                          | [NutritionOrder.enteralFormula.administration.rate\[x\]](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.rate[x])    |                                                       |
| negationRationale                                  | N/A                                                                                                                                                                 |                                                       |
| authorDatetime                                     | [NutritionOrder.dateTime](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.dateTime)                                                              |                                                       |
| relevantPeriod                                     | [NutritionOrder.enteralFormula.administration.schedule](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.schedule)  |                                                       |
| reason                                             | N/A                                                                                                                                                                 |                                                       |
| supply                                             | N/A                                                                                                                                                                 |                                                       |
| refills                                            | [NutritionOrder.enteralFormula](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula)                                                  |                                                       |
| route                                              | [NutritionOrder.enteralFormula.routeofAdministration](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.enteralFormula.routeofAdministration)      |                                                       |
| requester                                          | [NutritionOrder.orderer](StructureDefinition-qicore-nutritionorder-definitions.html#NutritionOrder.orderer)                                                                |                                                       |
{: .grid}

### Symptom

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

| **QDM Context**    | **QI-Core R5**                                                                                                                                                | **Comments**                                                                     |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| **Symptom**        | [Observation](StructureDefinition-qicore-observation.html)                                                                           |                                                                                  |
|                    | [Observation.status](StructureDefinition-qicore-observation-definitions.html#Observation.status)                 | restrict to preliminary, final, amended, corrected                               |
|                    | [Observation.category](StructureDefinition-qicore-observation-definitions.html#Observation.category)             | add symptom concept                                                              |
| **QDM Attributes** |                                                                                                                              |                                                                                  |
| code               | [Observation.value\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.value[x])           | Use codable concept                                                              |
| id                 | [Observation.id](StructureDefinition-qicore-observation-definitions.html#Observation.id)                         |                                                                                  |
| severity           | [Observation.interpretation](StructureDefinition-qicore-observation-definitions.html#Observation.interpretation) | Definition suggests high, low, normal - perhaps consider severe, moderate, mild. |
| prevalencePeriod   | [Observation.effective\[x\]](StructureDefinition-qicore-observation-definitions.html#Observation.effective[x])   | dateTime, period, timing, instant                                                |
| recorder           | [Observation.performer](StructureDefinition-qicore-observation-definitions.html#Observation.performer)           |                                                                                  |
{: .grid}
