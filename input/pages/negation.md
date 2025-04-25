{:toc}

{: #QICore-Negation}

###  QI Core Negation Profile Index

For common workflow activities, QI-Core defines general profiles that establish expectations for exchange in general, as well as two derived profiles, a positive and negative profile to define constraints for making positive and negative statements about activities:

| **QI-Core General Profile**                                                                 | **QI-Core Positive Profile**                                                                                | **QI-Core Negation Profile**                                                                                | **Base Resource**                                                                |
|---------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| [QICore Communication](StructureDefinition-qicore-communication.html)                       | [QICore Communication Done](StructureDefinition-qicore-communicationdone.html)                              | [QICore Communication Not Done](StructureDefinition-qicore-communicationnotdone.html)                       | [Communication]({{site.data.fhir.path}}communication.html)                       |
| [QICore DeviceRequest](StructureDefinition-qicore-devicerequest.html)                       | [QICore Device Requested](StructureDefinition-qicore-devicerequested.html)                                  | [QICore Device Prohibited](StructureDefinition-qicore-deviceprohibited.html)                                | [DeviceRequest]({{site.data.fhir.path}}devicerequest.html)                       |
| [QICore Immunization](StructureDefinition-qicore-immunization.html)                         | [QICore Immunization Done](StructureDefinition-qicore-immunizationdone.html)                                | [QICore Immunization Not Done](StructureDefinition-qicore-immunizationnotdone.html)                         | [Immunization]({{site.data.fhir.path}}immunization.html)                         |
| [QICore MedicationAdministration](StructureDefinition-qicore-medicationadministration.html) | [QICore MedicationAdministration Done](StructureDefinition-qicore-medicationadministrationdone.html)        | [QICore MedicationAdministration Not Done](StructureDefinition-qicore-medicationadministrationnotdone.html) | [MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html) |
| [QICore MedicationDispense](StructureDefinition-qicore-medicationdispense.html)             | [QICore MedicationDispense Done](StructureDefinition-qicore-medicationdispensedone.html)                    | [QICore MedicationDispense Declined](StructureDefinition-qicore-medicationdispensedeclined.html)            | [MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)             |
| [QICore MedicationRequest](StructureDefinition-qicore-medicationrequest.html)               | [QICore MedicationRequested](StructureDefinition-qicore-medicationrequested.html)                           | [QICore Medication Prohibited](StructureDefinition-qicore-medicationprohibited.html)                        | [MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)               |
| [QICore Procedure](StructureDefinition-qicore-procedure.html)                               | [QICore Procedure Done](StructureDefinition-qicore-proceduredone.html)                                      | [QICore Procedure Not Done](StructureDefinition-qicore-procedurenotdone.html)                               | [Procedure]({{site.data.fhir.path}}procedure.html)                               |
| [QICore ServiceRequest](StructureDefinition-qicore-servicerequest.html)                     | [QICore ServiceRequested](StructureDefinition-qicore-servicerequested.html)                                 | [QICore Service Prohibited](StructureDefinition-qicore-serviceprohibited.html)                              | [ServiceRequest]({{site.data.fhir.path}}servicerequest.html)                     |
| [QICore Task](StructureDefinition-qicore-task.html)                                         | [QICore Task Done](StructureDefinition-qicore-taskdone.html)                                                | [QICore Task Rejected](StructureDefinition-qicore-taskrejected.html)                                        | [Task]({{site.data.fhir.path}}task.html)                                         |

Each of the QI-Core negation rationale profiles define at least the following information:

-   What activity/event did not occur (typically in terms of a value set or list of codes, or as a reference to a request)
-   Explicit indication that the action/event did not or should not occur (such as doNotPerform or a status of notDone)
-   Date, and optionally, a time a clinician indicated a reason for avoiding the activity/event
-   The reason the activity/event did not occur (Preferably represented using one of an established set of [Negation Reason Codes](ValueSet-qicore-negation-reason.html))

**NOTE:** Although these aspects are all present within each negation profile defined by QI-Core, they are represented differently in the various FHIR resources. As a result, each negation profile uses a combination of constraints and extensions to ensure complete representation of negated actions or events within QI-Core.

### Using QI-Core Negation Profiles

#### Kinds of Negation Statements

The QICore negation profiles support three general classes of negation statements:

1. Documentation that an activity was not performed for a reason (i.e. a notDone event)
2. Documentation that an activity should not be performed for a reason (i.e. a doNotPerform request)
3. Documentation that a request was not performed for a reason (i.e. a taskRejected)
 
#### Extent of Negation

The negation profiles in QI-Core can be used to make two different types of negative statements:

1.	 Documentation that a particular activity/event should not or did not occur
2.	 Documentation that a class of activities/events should not or did not occur (typically represented with a value set)

##### Documenting one member of a value set was not performed for a given reason.

In the following example the measure numerator criterion allows for documentation that specifies a single antithrombotic medication using a CodeableConcept drawn from the list of possible expected medications (in the values set) was not administered. In the example the profiled MedicationAdministration resource documents that the clinician specifically did not administer ticagrelor 90 MG Oral Tablet because drug treatment is not indicated. The evidence of a reason for not administering this single member of the value set “Antithrombotic Therapy for Ischemic Stroke” fulfills criteria for the numerator.

See the <a href="MedicationAdministration-negation-with-code-example.html">MedicationAdministration</a> example using a specific code) for a complete example.

```json
{
    "resourceType" : "MedicationAdministration",
    "id" : "negation-with-code-example",
    "meta" : {
        "profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationadministrationnotdone"]
    },
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

##### Documenting no members of an entire value set were performed for a given reason.

This is applicable when a measure criterion can be satisfied when none of the medications in a value set is administered for a specified reason. This can occur when the no treatment of the type included in the value set is appropriate. The approach provided allows systems to document using one profiled data instance that none of the activities in a particular value set were performed, rather than requiring documentation of multiple individual activities from the value set.

The following example documents that providers did not prescribe any of the medications in the "Antithrombotic Therapy for Ischemic Stroke" value set using the <a href="http://hl7.org/fhir/StructureDefinition/codeOptions">codeOptions</a> extension fulfills criteria for the numerator:

**NOTE:** Implementing systems must ensure that this approach does not result in conflicting data. For example, the above example indicating no administration of a medication in the Antithrombotic Therapy value set should not be used if there are administrations of individual medications in the same value set. In other words, it is a contradiction to say "a provider administered a specific medication" at the same time as "a provider did not administer any of the medications in this value set" if that value set includes the medication that was administered in the specific case.

See the <a href="MedicationAdministration-negation-example.html">MedicationAdministration example using a value set</a> for a complete example.


```json
{
    "resourceType" : "MedicationAdministration",
    "id" : "negation-example",
    "meta" : {
        "profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationadministrationnotdone"]
    },
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
            "url" : "http://hl7.org/fhir/StructureDefinition/codeOptions",
            "valueCanonical" : "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.62"
        }],
        "text" : "Value Set: Antithrombotic Therapy for Ischemic Stroke"
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


#### Do Not Perform Requests

To indicate that an activity should not be performed, use the "Prohibited" profiles:

* [DeviceProhibited](StructureDefinition-qicore-deviceprohibited.html)
* [MedicationProhibited](StructureDefinition-qicore-medicationprohibited.html)
* [ServiceProhibited](StructureDefinition-qicore-serviceprohibited.html)

##### Request not to perform a specific activity

The following example illustrates a request not to apply Graduated compression elastic hosiery:

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "negation-example-code",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-serviceprohibited"]
  },
  "status" : "completed",
  "intent" : "order",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Surgical Procedure"
    }]
  }],
  "priority" : "urgent",
  "doNotPerform" : true,
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "348681001",
      "display" : "Graduated compression elastic hosiery (physical object)"
    }]
  },
  "subject" : ...,
  "encounter" : ...,
  "occurrenceDateTime" : "2013-04-05",
  "authoredOn" : "2013-04-04",
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "416406003",
      "display" : "Procedure discontinued (situation)"
    }]
  }]
}
```

See the [Service Prohibited With Code Example](ServiceRequest-negation-example-code.html) for a complete example.

##### Request not to perform any of a class of activities

The following example illustrates a request not to apply any of a class of devices, indicated by the Intermittent pneumatic compression devices values set:

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "negation-example",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-serviceprohibited"]
  },
  "status" : "completed",
  "intent" : "order",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Surgical Procedure"
    }]
  }],
  "priority" : "urgent",
  "doNotPerform" : true,
  "code" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/codeOptions",
      "valueCanonical" : "http://cts.nlm.nih.gov/fhir/2.16.840.1.113883.3.117.1.7.1.214"
    }],
    "text" : "Value Set: Intermittent pneumatic compression devices (IPC)"
  },
  "subject" : ...,
  "encounter" : ...,
  "occurrenceDateTime" : "2013-04-05",
  "authoredOn" : "2013-04-04",
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "416406003",
      "display" : "Procedure discontinued (situation)"
    }]
  }],
  "bodySite" : ...
}
```

See the [Service Prohibited Example](ServiceRequest-negation-example.html) for a complete example.

#### Rejected Requests

To indicate that a request to perform an activity was rejected, use the task pattern:

1. A request resource indicating the activity to be performed (or not performed)
2. A TaskRejected with the request resource as `focus`, indicating the request to perform the activity was rejected

As with not done events and orders not to perform, the extent of negation for a rejected request can be a single activity, or any of a class of activities:

##### Rejecting a proposal to perform a specific activity

To indicate that a request to perform a specific activity was rejected:

First, the request to perform a specific activity as a ServiceRequest:

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "proposal-example-code",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-servicerequested"]
  },
  "status" : "active",
  "intent" : "proposal",
  "priority" : "urgent",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "348681001",
      "display" : "Graduated compression elastic hosiery (physical object)"
    }]
  },
  "subject" : ...,
  "encounter" : ...,
  "occurrenceDateTime" : "2013-04-05",
  "authoredOn" : "2013-04-04"
}
```

Second, a fulfillment task with a status of `rejected` and the `focus` referencing the proposal:

```json
{
  "resourceType" : "Task",
  "id" : "rejected-with-code-example",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-taskrejected"]
  },
  "status" : "rejected",
  "statusReason" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "275936005",
      "display" : "Patient noncompliance - general (situation)"
    }]
  },
  "intent" : "proposal",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/CodeSystem/task-code",
      "code" : "fulfill",
      "display" : "Fulfill the focal request"
    }]
  },
  "focus" : {
    "reference" : "ServiceRequest/proposal-example-code"
  },
  "for" : ...,
  "executionPeriod" : ...
}
```

See the [Service Requested With Code](ServiceRequest-proposal-example-code.html) for a complete example.

See the [Task Rejected With Code Example](Task-rejected-with-code-example.html) for a complete example.

##### Rejecting a proposal to perform any of a class of activities

To indicate that a request to perform any of a class of activities was rejected:

Similar to the specific activity case, first a request to perform any of a class of activities:

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "proposal-example",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-servicerequested"]
  },
  "status" : "active",
  "intent" : "proposal",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Surgical Procedure"
    }]
  }],
  "priority" : "urgent",
  "code" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/codeOptions",
      "valueCanonical" : "http://cts.nlm.nih.gov/fhir/2.16.840.1.113883.3.117.1.7.1.214"
    }],
    "text" : "Value Set: Intermittent pneumatic compression devices (IPC)"
  },
  "subject" : ...,
  "encounter" : ...,
  "occurrenceDateTime" : "2013-04-05",
  "authoredOn" : "2013-04-04"
}
```

Followed by a fulfillment task with a status of `rejected` and the `focus` referencing the proposal:

```json
{
  "resourceType" : "Task",
  "id" : "rejected-example",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-taskrejected"]
  },
  "status" : "rejected",
  "statusReason" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "275936005",
      "display" : "Patient noncompliance - general (situation)"
    }]
  },
  "intent" : "proposal",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/CodeSystem/task-code",
      "code" : "fulfill",
      "display" : "Fulfill the focal request"
    }]
  },
  "focus" : {
    "reference" : "ServiceRequest/proposal-example"
  },
  "for" : ...,
  "executionPeriod" : ...
}
```

See the [Service Requested Example](ServiceRequest-proposal-example.html) for a complete example.

See the [Task Rejected Example](Task-rejected-example.html) for a complete example.

### Negation in CQL

For quality measurement and reporting, measure expression may only need to determine the existence or absence of an activity or event to determine if criteria have been met. If the reason for absence is not relevant to the measure evaluation, the absence of evidence pattern should be used as described on the [Patterns page of the Using CQL with FHIR IG]({{site.data.fhir.ver.cql}}/patterns.html#negation-in-fhir).
