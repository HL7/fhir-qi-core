{:toc}

{: #QICore-Negation}

###  QI Core Negation Profile Index

QI-Core includes ten specific negation profiles, parallel to the existing action-related profile:

| **QI-Core Positive Profile**                                                                                                                                                    | **QI-Core Negation Profile**                                                                                                                                                                    | **Base Resource**                                                                |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| [QICore Communication](StructureDefinition-qicore-communication.html)                       | [QICore Communication Not Done](StructureDefinition-qicore-communicationnotdone.html)                       | [Communication]({{site.data.fhir.path}}communication.html)                       |
| [QICore DeviceRequest](StructureDefinition-qicore-devicerequest.html)                       | [QICore Device Not Requested](StructureDefinition-qicore-devicenotrequested.html)                           | [DeviceRequest]({{site.data.fhir.path}}devicerequest.html)                       |
| [QICore Immunization](StructureDefinition-qicore-immunization.html)                         | [QICore Immunization Not Done](StructureDefinition-qicore-immunizationnotdone.html)                         | [Immunization]({{site.data.fhir.path}}immunization.html)                         |
| [QICore MedicationAdministration](StructureDefinition-qicore-medicationadministration.html) | [QICore MedicationAdministration Not Done](StructureDefinition-qicore-medicationadministrationnotdone.html) | [MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html) |
| [QICore MedicationDispense](StructureDefinition-qicore-medicationdispense.html)             | [QICore MedicationDispense Declined](StructureDefinition-qicore-medicationdispensedeclined.html)            | [MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)             |
| [QICore MedicationRequest](StructureDefinition-qicore-medicationrequest.html)               | [QICore Medication Not Requested](StructureDefinition-qicore-medicationnotrequested.html)                   | [MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)               |
| [QICore Simple Observation](StructureDefinition-qicore-simple-observation.html)             | [QICore Observation Cancelled](StructureDefinition-qicore-observationcancelled.html)                        | [Observation]({{site.data.fhir.path}}observation.html)                           |
| [QICore Procedure](StructureDefinition-qicore-procedure.html)                               | [QICore Procedure Not Done](StructureDefinition-qicore-procedurenotdone.html)                               | [Procedure]({{site.data.fhir.path}}procedure.html)                               |
| [QICore ServiceRequest](StructureDefinition-qicore-servicerequest.html)                     | [QICore Service Not Requested](StructureDefinition-qicore-servicenotrequested.html)                         | [ServiceRequest]({{site.data.fhir.path}}servicerequest.html)                     |
| [QICore Task](StructureDefinition-qicore-task.html)                                         | [QICore Task Rejected](StructureDefinition-qicore-taskrejected.html)                                        | [Task]({{site.data.fhir.path}}task.html)                                         |

The <a href="StructureDefinition-qicore-observationcancelled.html">QICore ObservationCancelled</a> profile **SHOULD** be used to represent negation statements for all specific observation profiles including:

-   [US Core Pediatric Head Occipital-frontal Circumference Percentile Profile](http://hl7.org/fhir/us/core/StructureDefinition/head-occipital-frontal-circumference-percentile)
-   [US Core Blood Pressure Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-blood-pressure)
-   [US Core BMI Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-bmi)
-   [US Core Body Height Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-height)
-   [US Core Body Temperature Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-temperature)
-   [US Core Body Weight Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-weight)
-   [US Core Head Circumference Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-head-circumference)
-   [US Core Heart Rate Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-heart-rate)
-   [US Core Pediatric BMI for Age Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition/pediatric-bmi-for-age)
-   [US Core Pediatric Weight for Height Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition/pediatric-weight-for-height)
-   [US Core Pulse Oximetry Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-pulse-oximetry)
-   [US Core Respiratory Rate Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-respiratory-rate)
-   [US Core Smoking Status Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus)
-   [US Core Observation Sexual Orientation Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-sexual-orientation)
-   [US Core Observation Pregnancy Intent Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancyintent)
-   [US Core Observation Pregnancy Status Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancystatus)
-   [US Core Observation Occupation Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancystatus)
-   [US Core Average Blood Pressure Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancystatus)
-   [US Core Care Experience Preference Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancystatus)
-   [US Core Treatment Intervention Preference Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-treatment-intervention-preference))
-   [QICore Simple Observation Profile](StructureDefinition-qicore-simple-observation.html)
-   [QICore Observation Clinical Result](StructureDefinition-qicore-observation-clinical-result.html)
-   [QICore Laboratory Result Observation](StructureDefinition-qicore-observation-lab.html)
-   [QICore Observation Screening Assessment](StructureDefinition-qicore-observation-screening-assessment.html)

Each of the QI-Core negation rationale profiles define at least the following information:

-   What activity/event did not occur (typically in terms of a value set or list of codes)
-   Explicit indication that the action/event did not occur (such as doNotPerform or a status of notDone)
-   Date, and optionally, a time a clinician indicated a reason for avoiding the activity/event
-   The reason the activity/event did not occur (Preferably represented using one of an established set of [Negation Reason Codes](ValueSet-qicore-negation-reason.html))

**NOTE:** Although these aspects are all present within each negation profile defined by QI-Core, they are represented differently in the various FHIR resources. As a result, each negation profile uses a combination of constraints and extensions to ensure complete representation of negated actions or events within QI-Core.

### Using QI-Core Negation Profiles
 
 **Extent of Negation**

The negation profiles in QI-Core can be used to make two different types of negative statements:


1.	 Documentation that a particular activity/event should not or did not occur
2.	 Documentation that a class of activities/events should not or did not occur (typically represented with a value set)

#### Documenting one member of a value set was not performed for a given reason.

In the following example the measure numerator criterion allows for documentation that specifies a single antithrombotic medication using a CodeableConcept drawn from the list of possible expected medications (in the values set) was not administered. In the example the Profiled MedicationAdministration resource documents that the clinician specifically did not administer ticagrelor 90 MG Oral Tablet because drug treatment is not indicated. The evidence of a reason for not administering this single member of the value set “Antithrombotic Therapy for Ischemic Stroke” fulfills criteria for the numerator.

See the <a href="MedicationAdministration-negation-with-code-example.html">MedicationAdministration</a> example using a specific code) for a complete example.

```json
{

"resourceType" : "MedicationAdministration",

"id" : "negation-with-code-example",

"meta" : {

"profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationadministrationnotdone"]

},

"extension" : [{

"url" : "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-recorded",

"valueDateTime" : "2015-01-15"

}],

"status" : "not-done",

"statusReason" : [{

"coding" : [{

"system" : "http://snomed.info/sct",

"code" : "183966005",

"display" : "Drug treatment not indicated (situation)"

}]

}],

"medicationCodeableConcept" : {

"coding" : [{

"system" : "http://www.nlm.nih.gov/research/umls/rxnorm",

"code" : "1116635",

"display" : "ticagrelor 90 MG Oral Tablet"

}]

},

"subject" : ...,

"context" : ...,

"supportingInformation" : ...,

"effectivePeriod" : ...,

"request" : ...,

"note" : ...,

"dosage" : ...

}
```

#### Documenting no members of an entire value set were performed for a given reason.

This is applicable when a measure criterion can be satisfied when none of the medications in a value set is administered for a specified reason. This can occur when the no treatment of the type included in the value set is appropriate. The approach provided allows systems to document using one profiled data instance that none of the activities in a particular value set were performed, rather than requiring documentation of multiple individual activities from the value set.

The following example documents that providers did not prescribe any of the medications in the “Antithrombotic Therapy for Ischemic Stroke” value set using the <a href="StructureDefinition-qicore-notDoneValueSet.html">notDoneValueSet</a> extension fulfills criteria for the numerator:

**NOTE:** Implementing systems must ensure that this approach does not result in conflicting data. For example, the above example indicating no administration of a medication in the Antithrombotic Therapy value set should not be used if there are administrations of individual medications in the same value set. In other words, it is a contradiction to say “a provider administered a specific medication” at the same time as “a provider did not administer any of the medications in this value set” if that value set includes the medication that was administered in the specific case.

See the <a href="MedicationAdministration-negation-example.html">MedicationAdministration example using a value set</a> for a complete example.

```json
{

"resourceType" : "MedicationAdministration",

"id" : "negation-example",

"meta" : {

"profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationadministrationnotdone"]

},

"extension" : [{

"url" : "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-recorded",

"valueDateTime" : "2015-01-15"

}],

"status" : "not-done",

"statusReason" : [{

"coding" : [{

"system" : "http://snomed.info/sct",

"code" : "183966005",

"display" : "Drug treatment not indicated (situation)"

}]

}],

"medicationCodeableConcept" : {

"extension" : [{

"url" : "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneValueSet",

"valueCanonical" : "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.62"

}],

"text" : "Not Done Value Set: Antithrombotic Therapy for Ischemic Stroke"

},

"subject" : ...,

"context" : ...,

"supportingInformation" : ...,

"effectivePeriod" : ...,

"request" : ...,

"note" : ...,

"dosage" : ...

}
```

### Negation in CQL

For quality measurement and reporting, measure expression may only need to determine the existence or absence of an activity or event to determine if criteria have been met. If the reason for absence is not relevant to the measure evaluation, the absence of evidence pattern should be used as described on the [Patterns page of the Using CQL with FHIR IG](https://hl7.org/fhir/us/cqfmeasures/using-cql.html#negation-in-fhir).
