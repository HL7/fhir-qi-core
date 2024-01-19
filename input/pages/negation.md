{:toc}

{: #QICore-Negation}

###  QI Core Negation Profile Index

QI-Core includes ten specific negation profiles, parallel to the existing action-related profile:

| **QI-Core Positive Profile**                                                                                                                                                    | **QI-Core Negation Profile**                                                                                                                                                                    | **Base Resource**                                                                |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| [QICore Communication](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-communication.html)                       | [QICore Communication Not Done](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-communicationnotdone.html)                       | [Communication](http://hl7.org/fhir/R4/communication.html)                       |
| [QICore DeviceRequest](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-devicerequest.html)                       | [QICore Device Not Requested](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-devicenotrequested.html)                           | [DeviceRequest](http://hl7.org/fhir/R4/devicerequest.html)                       |
| [QICore Immunization](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-immunization.html)                         | [QICore Immunization Not Done](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-immunizationnotdone.html)                         | [Immunization](http://hl7.org/fhir/R4/immunization.html)                         |
| [QICore MedicationAdministration](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-medicationadministration.html) | [QICore MedicationAdministration Not Done](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-medicationadministrationnotdone.html) | [MedicationAdministration](http://hl7.org/fhir/R4/medicationadministration.html) |
| [QICore MedicationDispense](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-medicationdispense.html)             | [QICore MedicationDispense Declined](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-medicationdispensedeclined.html)            | [MedicationDispense](http://hl7.org/fhir/R4/medicationdispense.html)             |
| [QICore MedicationRequest](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-medicationrequest.html)               | [QICore Medication Not Requested](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-medicationnotrequested.html)                   | [MedicationRequest](http://hl7.org/fhir/R4/medicationrequest.html)               |
| [QICore Simple Observation](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-simple-observation.html)             | [QICore Observation Cancelled](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-observationcancelled.html)                        | [Observation](http://hl7.org/fhir/R4/observation.html)                           |
| [QICore Procedure](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-procedure.html)                               | [QICore Procedure Not Done](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-procedurenotdone.html)                               | [Procedure](http://hl7.org/fhir/R4/procedure.html)                               |
| [QICore ServiceRequest](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-servicerequest.html)                     | [QICore Service Not Requested](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-servicenotrequested.html)                         | [ServiceRequest](http://hl7.org/fhir/R4/servicerequest.html)                     |
| [QICore Task](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-task.html)                                         | [QICore Task Rejected](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-taskrejected.html)                                        | [Task](http://hl7.org/fhir/R4/task.html)                                         |

The <a href="StructureDefinition-qicore-observationcancelled.html">QICore ObservationCancelled</a> profile **SHOULD** be used to represent negation statements for all specific observation profiles including:

-   [US Core Pediatric Head Occipital-frontal Circumference Percentile Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-head-occipital-frontal-circumference-percentile.html)
-   [US Core Blood Pressure Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-blood-pressure.html)
-   [US Core BMI Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-bmi.html)
-   [US Core Body Height Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-body-height.html)
-   [US Core Body Temperature Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-body-temperature.html)
-   [US Core Body Weight Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-body-weight.html)
-   [US Core Head Circumference Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-head-circumference.html)
-   [US Core Heart Rate Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-heart-rate.html)
-   [US Core Pediatric BMI for Age Observation Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-pediatric-bmi-for-age.html)
-   [US Core Pediatric Weight for Height Observation Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-pediatric-weight-for-height.html)
-   [US Core Pulse Oximetry Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-pulse-oximetry.html)
-   [US Core Respiratory Rate Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-respiratory-rate.html)
-   [US Core Smoking Status Observation Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-smokingstatus.html)
-   [US Core Observation Sexual Orientation Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-sexual-orientation.html)
-   [US Core Observation Pregnancy Intent Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-pregnancyintent.html)
-   [US Core Observation Pregnancy Status Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-pregnancystatus.html)
-   [QICore Simple Observation Profile](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-simple-observation.html)
-   [QICore Observation Clinical Result](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-observation-clinical-result.html)
-   [QICore Laboratory Result Observation](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-observation-lab.html)
-   [QICore Observation Screening Assessment](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/StructureDefinition-qicore-observation-screening-assessment.html)

Each of the QI-Core negation rationale profiles define at least the following information:

-   What activity/event did not occur (typically in terms of a value set or list of codes)
-   Explicit indication that the action/event did not occur (such as doNotPerform or a status of notDone)
-   Date, and optionally, a time a clinician indicated a reason for avoiding the activity/event
-   The reason the activity/event did not occur (Preferably represented using one of an established set of [Negation Reason Codes](https://build.fhir.org/ig/HL7/fhir-qi-core/branches/br-42099-negation-documentation/ValueSet-qicore-negation-reason.html))

**NOTE:** Although these aspects are all present within each negation profile defined by QI-Core, they are represented differently in the various FHIR resources. As a result, each negation profile uses a combination of constraints and extensions to ensure complete representation of negated actions or events within QI-Core.

### Using QI-Core Negation Profiles
 
 **Extent of Negation**

The negation profiles in QI-Core can be used to make two different types of negative statements:

1.  Documentation that a specific activity was not performed for a given reason
2.  Documentation that none of the activities in a given value set were performed for a given reason

#### Documenting no members of an entire value set was performed for a given reason.

In the following example the measure numerator criterion allows for documentation that specifies a single antithrombotic medication using a CodeableConcept drawn from the list of possible expected medications (in the values set) was not administered. In the example the Profiled MedicationAdministration resource documents that the clinician specifically did not administer ticagrelor 90 MG Oral Tablet because drug treatment is not indicated. The evidence of a reason for not administering this single member of the value set “Antithrombotic Therapy for Ischemic Stroke” fulfills criteria for the numerator.

See the <a href="MedicationAdministration">MedicationAdministration-negation-with-code-example.html</a> example using a specific code) for a complete example.

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

#### Documenting no members of an entire value set was performed for a given reason..

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

For quality measurement and reporting, measure expression may only need to determine the existence or absence of an activity or event to determine if criteria have been met. If the reason for absence is not relevant to the measure evaluation, the absence of evidence pattern should be used as described in the [Using CQL section of the Quality Measure IG](https://hl7.org/fhir/us/cqfmeasures/using-cql.html#negation-in-fhir).
