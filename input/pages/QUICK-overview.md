## QI-Core Authoring

The QI-Core Authoring View provides a logical view of clinical data from the perspective of representing quality measurement and decision support knowledge.

### Relationship to FHIR and QI-Core

The QI-Core Authoring View uses the QI-Core profiles to provide a physical representation for the data. It provides a logical model that enables knowledge authors to ignore certain details of the FHIR Physical representation, including:

* The representation of primitives in FHIR using a "value" element of a complex type, rather than a true primitive
* The representation of extensions in FHIR as first class elements
* Direct reference of resources, rather than needing to traverse a "reference"

To address the first issue, the QI-Core Authoring View maps the FHIR base types to CQL primitives, rather than using the FHIR types directly:

<table class='table table-striped table-bordered'>
<tr><th>FHIR Type</th><th>CQL Type</th></tr>
<tr><th>base64Binary</th><td><a href='http://cql.hl7.org/02-authorsguide.html#string' target='_blank'>String</a></td></tr>
<tr><th>boolean</th><td><a href='http://cql.hl7.org/02-authorsguide.html#boolean' target='_blank'>Boolean</a></td></tr>
<tr><th>code</th><td><a href='http://cql.hl7.org/02-authorsguide.html#string' target='_blank'>String</a></td></tr>
<tr><th>CodeableConcept</th><td><a href='http://cql.hl7.org/02-authorsguide.html#concept' target='_blank'>Concept</a></td></tr>
<tr><th>Coding</th><td><a href='http://cql.hl7.org/02-authorsguide.html#code' target='_blank'>Code</a></td></tr>
<tr><th>date</th><td><a href='http://cql.hl7.org/02-authorsguide.html#date-datetime-and-time' target='_blank'>DateTime</a></td></tr>
<tr><th>dateTime</th><td><a href='http://cql.hl7.org/02-authorsguide.html#date-datetime-and-time' target='_blank'>DateTime</a></td></tr>
<tr><th>decimal</th><td><a href='http://cql.hl7.org/02-authorsguide.html#decimal' target='_blank'>Decimal</a></td></tr>
<tr><th>id</th><td><a href='http://cql.hl7.org/02-authorsguide.html#string' target='_blank'>String</a></td></tr>
<tr><th>instant</th><td><a href='http://cql.hl7.org/02-authorsguide.html#date-datetime-and-time' target='_blank'>DateTime</a></td></tr>
<tr><th>integer</th><td><a href='http://cql.hl7.org/02-authorsguide.html#integer' target='_blank'>Integer</a></td></tr>
<tr><th>markdown</th><td><a href='http://cql.hl7.org/02-authorsguide.html#string' target='_blank'>String</a></td></tr>
<tr><th>oid</th><td><a href='http://cql.hl7.org/02-authorsguide.html#string' target='_blank'>String</a></td></tr>
<tr><th>Period</th><td><a href='http://cql.hl7.org/02-authorsguide.html#interval-values' target='_blank'>Interval</a>&lt;<a href='http://cql.hl7.org/02-authorsguide.html#date-datetime-and-time' target='_blank'>DateTime</a>&gt;</td></tr>
<tr><th>positiveInt</th><td><a href='http://cql.hl7.org/02-authorsguide.html#integer' target='_blank'>Integer</a></td></tr>
<tr><th>Range</th><td><a href='http://cql.hl7.org/02-authorsguide.html#interval-values' target='_blank'>Interval</a>&lt;<a href='http://cql.hl7.org/02-authorsguide.html#quantities' target='_blank'>Quantity</a>&gt;</td></tr>
<tr><th>string</th><td><a href='http://cql.hl7.org/02-authorsguide.html#string' target='_blank'>String</a></td></tr>
<tr><th>time</th><td><a href='http://cql.hl7.org/02-authorsguide.html#date-datetime-and-time' target='_blank'>Time</a></td></tr>
<tr><th>uri</th><td><a href='http://cql.hl7.org/02-authorsguide.html#string' target='_blank'>String</a></td></tr>
</table>

To address the second issue, the QI-Core Authoring View represents FHIR extensions as first-class attributes of the class. To address the third issue, the QI-Core Authoring View represents FHIR references as direct appearances of the referenced class or classes. NOTE: The third issue is still being worked out, so current QI-Core Authoring documentation still uses the Reference type to model references.
