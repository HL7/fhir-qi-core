<p>Actual or potential/avoided event causing unintended physical
injury resulting from or contributed to by medical care, a research
study or other healthcare setting factors that requires additional
monitoring, treatment, or hospitalization, or that results in
death.</p>
<p>= Must Support, = Is Modifier, = QiCore defined extension</p>
<table class='table table-striped table-bordered'>
<tr>
<th>Field</th>
<th>Card.</th>
<th>Type</th>
<th>Description</th>
</tr>
<tr>
<th>identifier</th>
<td>0..1</td>
<td><a href='QUICK-Identifier.html'>Identifier</a></td>
<td>Business identifiers assigned to this adverse event by the
performer or other systems which remain constant as the resource is
updated and propagates from server to server.</td>
</tr>
<tr>
<th>actuality</th>
<td>1..1</td>
<td><a href='http://cql.hl7.org/02-authorsguide.html#string'
target='_blank'>String</a></td>
<td>Whether the event actually happened, or just had the potential
to. Note that this is independent of whether anyone was affected or
harmed or how severely.<br />
<strong>Binding:</strong> <a href=
'http://hl7.org/fhir/ValueSet/adverse-event-actuality|4.0.1'
target='_blank'>Overall nature of the adverse event, e.g. real or
potential.</a> (<a href=
'http://hl7.org/fhir/STU3/terminologies.html#required' target=
'_blank'>required</a>)</td>
</tr>
<tr>
<th>category</th>
<td>0..*</td>
<td>List&lt;<a href=
'http://cql.hl7.org/02-authorsguide.html#concept' target=
'_blank'>Concept</a>&gt;</td>
<td>The overall type of event, intended for search and filtering
purposes.<br />
<strong>Binding:</strong> <a href=
'http://hl7.org/fhir/ValueSet/adverse-event-category' target=
'_blank'>Overall categorization of the event, e.g. product-related
or situational.</a> (<a href=
'http://hl7.org/fhir/STU3/terminologies.html#extensible' target=
'_blank'>extensible</a>)</td>
</tr>
<tr>
<th>event</th>
<td>1..1</td>
<td><a href='http://cql.hl7.org/02-authorsguide.html#concept'
target='_blank'>Concept</a></td>
<td>This element defines the specific type of event that occurred
or that was prevented from occurring.<br />
<strong>Binding:</strong> <a href=
'http://hl7.org/fhir/ValueSet/adverse-event-type' target=
'_blank'>Detailed type of event.</a> (<a href=
'http://hl7.org/fhir/STU3/terminologies.html#example' target=
'_blank'>example</a>)</td>
</tr>
<tr>
<th>subject</th>
<td>1..1</td>
<td><a href='QUICK-QICorePatient.html'>QICorePatient</a> | <a href=
'http://hl7.org/fhir/StructureDefinition/Group' target=
'_blank'>Group</a> | <a href=
'QUICK-QICorePractitioner.html'>QICorePractitioner</a> | <a href=
'QUICK-QICoreRelatedPerson.html'>QICoreRelatedPerson</a></td>
<td>This subject or group impacted by the event.</td>
</tr>
<tr>
<th>encounter</th>
<td>0..1</td>
<td><a href='QUICK-QICoreEncounter.html'>QICoreEncounter</a></td>
<td>The Encounter during which AdverseEvent was created or to which
the creation of this record is tightly associated.</td>
</tr>
<tr>
<th>date</th>
<td>0..1</td>
<td><a href=
'http://cql.hl7.org/02-authorsguide.html#date-datetime-and-time'
target='_blank'>DateTime</a></td>
<td>The date (and perhaps time) when the adverse event
occurred.</td>
</tr>
<tr>
<th>detected</th>
<td>0..1</td>
<td><a href=
'http://cql.hl7.org/02-authorsguide.html#date-datetime-and-time'
target='_blank'>DateTime</a></td>
<td>Estimated or actual date the AdverseEvent began, in the opinion
of the reporter.</td>
</tr>
<tr>
<th>recordedDate</th>
<td>0..1</td>
<td><a href=
'http://cql.hl7.org/02-authorsguide.html#date-datetime-and-time'
target='_blank'>DateTime</a></td>
<td>The date on which the existence of the AdverseEvent was first
recorded.</td>
</tr>
<tr>
<th>resultingCondition</th>
<td>0..*</td>
<td>List&lt;<a href=
'QUICK-QICoreCondition.html'>QICoreCondition</a>&gt;</td>
<td>Includes information about the reaction that occurred as a
result of exposure to a substance (for example, a drug or a
chemical).</td>
</tr>
<tr>
<th>location</th>
<td>0..1</td>
<td><a href='QUICK-QICoreLocation.html'>QICoreLocation</a></td>
<td>The information about where the adverse event occurred.</td>
</tr>
<tr>
<th>seriousness</th>
<td>0..1</td>
<td><a href='http://cql.hl7.org/02-authorsguide.html#concept'
target='_blank'>Concept</a></td>
<td>Assessment whether this event was of real importance.<br />
<strong>Binding:</strong> <a href=
'http://hl7.org/fhir/ValueSet/adverse-event-seriousness' target=
'_blank'>Overall seriousness of this event for the patient.</a>
(<a href='http://hl7.org/fhir/STU3/terminologies.html#example'
target='_blank'>example</a>)</td>
</tr>
<tr>
<th>severity</th>
<td>0..1</td>
<td><a href='http://cql.hl7.org/02-authorsguide.html#concept'
target='_blank'>Concept</a></td>
<td>Describes the severity of the adverse event, in relation to the
subject. Contrast to AdverseEvent.seriousness - a severe rash might
not be serious, but a mild heart problem is.<br />
<strong>Binding:</strong> <a href=
'http://hl7.org/fhir/ValueSet/adverse-event-severity|4.0.1' target=
'_blank'>The severity of the adverse event itself, in direct
relation to the subject.</a> (<a href=
'http://hl7.org/fhir/STU3/terminologies.html#required' target=
'_blank'>required</a>)</td>
</tr>
<tr>
<th>outcome</th>
<td>0..1</td>
<td><a href='http://cql.hl7.org/02-authorsguide.html#concept'
target='_blank'>Concept</a></td>
<td>Describes the type of outcome from the adverse event.<br />
<strong>Binding:</strong> <a href=
'http://hl7.org/fhir/ValueSet/adverse-event-outcome|4.0.1' target=
'_blank'>TODO (and should this be required?).</a> (<a href=
'http://hl7.org/fhir/STU3/terminologies.html#required' target=
'_blank'>required</a>)</td>
</tr>
<tr>
<th>recorder</th>
<td>0..1</td>
<td><a href='QUICK-QICorePatient.html'>QICorePatient</a> | <a href=
'QUICK-QICoreRelatedPerson.html'>QICoreRelatedPerson</a> | <a href=
'QUICK-QICorePractitioner.html'>QICorePractitioner</a> | <a href=
'QUICK-QICorePractitionerRole.html'>QICorePractitionerRole</a></td>
<td>Information on who recorded the adverse event. May be the
patient or a practitioner.</td>
</tr>
<tr>
<th>contributor</th>
<td>0..*</td>
<td>List&lt;<a href=
'QUICK-QICorePractitioner.html'>QICorePractitioner</a> | <a href=
'QUICK-QICorePractitionerRole.html'>QICorePractitionerRole</a> |
<a href='QUICK-QICoreDevice.html'>QICoreDevice</a>&gt;</td>
<td>Parties that may or should contribute or have contributed
information to the adverse event, which can consist of one or more
activities. Such information includes information leading to the
decision to perform the activity and how to perform the activity
(e.g. consultant), information that the activity itself seeks to
reveal (e.g. informant of clinical history), or information about
what activity was performed (e.g. informant witness).</td>
</tr>
<tr>
<th>suspectEntity</th>
<td>0..*</td>
<td>List&lt;<a href=
"QUICK-AdverseEvent.suspectEntity.html">suspectEntity</a>&gt;</td>
<td>Describes the entity that is suspected to have caused the
adverse event.</td>
</tr>
<tr>
<th>subjectMedicalHistory</th>
<td>0..*</td>
<td>List&lt;<a href=
'QUICK-QICoreCondition.html'>QICoreCondition</a> | <a href=
'QUICK-QICoreObservation.html'>QICoreObservation</a> | <a href=
'QUICK-QICoreAllergyIntolerance.html'>QICoreAllergyIntolerance</a>
| <a href=
'QUICK-QICoreFamilyMemberHistory.html'>QICoreFamilyMemberHistory</a>
| <a href='QUICK-QICoreImmunization.html'>QICoreImmunization</a> |
<a href='QUICK-QICoreProcedure.html'>QICoreProcedure</a> | <a href=
'http://hl7.org/fhir/StructureDefinition/Media' target=
'_blank'>Media</a> | <a href=
'http://hl7.org/fhir/StructureDefinition/DocumentReference' target=
'_blank'>DocumentReference</a>&gt;</td>
<td>AdverseEvent.subjectMedicalHistory.</td>
</tr>
<tr>
<th>referenceDocument</th>
<td>0..*</td>
<td>List&lt;<a href=
'http://hl7.org/fhir/StructureDefinition/DocumentReference' target=
'_blank'>DocumentReference</a>&gt;</td>
<td>AdverseEvent.referenceDocument.</td>
</tr>
<tr>
<th>study</th>
<td>0..*</td>
<td>List&lt;<a href=
'http://hl7.org/fhir/StructureDefinition/ResearchStudy' target=
'_blank'>ResearchStudy</a>&gt;</td>
<td>AdverseEvent.study.</td>
</tr>
</table>
