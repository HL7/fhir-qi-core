{:toc}


{:.stu-note}
> This STU 7.0.0-ballot update to the QI-Core profiles aligns with US-Core STU v7.0.0. For a complete list of changes in this version, please refer to the version history.

<div class="note-to-balloters" markdown="1">
> 
> Some QI-Core users have requested addition of a section on each QI-Core profile page indicating those elements identified as essential for expressing data required for measure and clinical decision support artifacts.  
> 
> Please provide feedback or suggested edits for the new sections.

> NOTE TO REVIEWERS:

* US Core 7.0, and thus QI-Core 7.0, has a new approach to USCDI requirements.
    * As noted in the US Core 7.0 [Must Support](https://hl7.org/fhir/us/core/must-support.html#must-support-elements) section, US Core 7.0 no longer highlights mandatory (cardinality 1..* or 1..1) and Must Support elements with a (USCDI) indicator as such items must be supported for interoperability.
    * Those USCDI elements that are not mandatory or Must Support now include an indicator (ADDITIONAL USCDI) in US Core. QI-Core 7.0 does not reference USCDI elements; rather, users should access US Core 7.0 to understand its implementation of USCDI version 4.
* We invite comments about the approach and suggestions for other options that would also avoid unnecessary noise or reading load to the QI-Core profile representation.
* Further, QI-Core 7.0 does not discuss [USCDI+Quality](https://uscdiplus.healthit.gov/uscdi) because at the time of ballot preparation, no published version of USCDI+Quality is available. We seek reviewer advice regarding how QI-Core might address future USCDI+Quality.

</div>

<div class="new-content" markdown="1">
{{ site.data.new_items.list[0].desc }}
</div>

{: #qi-core-implementation-guide}


### Summary
{: #summary}

The QI-Core Implementation Guide defines a set of FHIR profiles with extensions and bindings needed to create
interoperable, quality-focused applications. The profiles in this implementation guide derive from and extend the
Core profiles to provide a common foundation for building, sharing, and evaluating
knowledge artifacts across quality improvement efforts in the US Realm.

As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring workgroup,
[Clinical Quality Information](http://www.hl7.org/Special/committees/cqi/index.cfm), and incorporated as part of the
standard balloting process. The current roadmap follows closely behind the base FHIR roadmap, and the US Core
Implementation Guide.

### Contents
{: #contents}

This guide is divided into pages which are listed at the top of each page in the menu bar:

* **[Home](index.html)**: The home page provides summary and background information

<div class="new-content" markdown="1">
* **Profiles**
    * **[QI-Core Profiles](profiles.html)**: The profiles page provides a complete listing of all the profiles defined in or used by QI-Core
    * **[QI Elements](qi-elements.html)**: The QI Elements page provides a complete listing of all the QI Elements in each profile used by QI-Core
</div>

* **[QI-Core Negation](negation.html)**: The negations page describes QI-Core Negation
* **[Patterns](patterns.html)**: The patterns page describes patterns of usage for QI-Core applications
* **[Model Info](modelinfo.html)**: The model info page provides the QI-Core model information to support implementation
* **[Extensions](extensions.html)**: The extensions page lists all the extensions defined as part of QI-Core
* **[Terminology](terminology.html)**: The terminology page lists all terminology defined as part of QI-Core
* **[Examples](examples.html)**: The examples page provides an index of all the examples defined as part of QI-Core
* **[Downloads](downloads.html)**: Downloads for definitions, examples, as well as the entire IG
* **[QDM-to-QI-Core Mapping](qdm-to-qicore.html)**: This page provides a detailed description of mapping from QDM to QI-Core

### Background
{: #background}

This Implementation Guide originated as a US Realm Specification with support from the
Clinical Quality Framework (CQF) initiative [(that concluded in 2017)](https://oncprojectracking.healthit.gov/wiki/display/TechLabSC/CQF+Home),
which was a public-private partnership sponsored by the Centers for Medicare &amp; Medicaid Services (CMS) and the U.S.
Office of the National Coordinator (ONC) to harmonize standards for clinical decision support and electronic clinical
quality measurement. The [Clinical Quality Framework](https://confluence.hl7.org/display/CQIWC/Clinical+Quality+Framework)
effort transitioned to HL7's Clinical Quality Information (CQI) and Clinical Decision Support (CDS) Work Groups in 2016.
The HL7 CQI Work Group maintains this Implementation Guide, co-sponsored by the Clinical Decision Support (CDS) HL7 Work
Group to inform electronic clinical quality improvement (i.e., measurement and decision support). This Quality
Improvement Core (QI-Core) Implementation Guide is intended to be usable for multiple use cases across domains, and much
of the content is likely to be usable outside the US Realm.

Understanding QI-Core and its use in quality applications requires an understanding of the role of common
reference models. Electronic Health Records (EHRs) are stored in many different local formats. Exchanging data between
EHRs requires mapping between local data formats. It is well understood that standards can reduce the number of data
maps each data provider must create. In a similar manner, to share quality measures and clinical decision support
artifacts, the measures and artifacts must refer to data in a standardized way.

In the US Realm, the common reference model for electronic clinical quality measures (eCQMs) is the
[Quality Data Model (QDM)](https://ecqi.healthit.gov/qdm). For clinical decision support, a common reference model is
the [HL7 Virtual Medical Record for Clinical Decision Support (vMR)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=342).
Decision support and quality measures are closely related, and can be viewed as "two sides of the same coin".
Specifically, decision support provides guidance for clinical best practices, and quality measures assess whether
clinical best practices have been followed. It therefore makes intuitive sense to use the same common reference model
for both types of applications.


This initiative began in 2013 with the creation of the [Quality Improvement Domain Analysis Model (QIDAM)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=378), which drew on the vMR and QDM as sources of requirements. The result, Quality Improvement Core (QI-Core) profiles consist of objects, attributes, and relationships as a common model for quality and interoperability that leverages US Core and other FHIR-related efforts and Clinical Document Architecture (CDA) on FHIR. The QI-Core versions have evolved with FHIR-specific tooling to include views showing differential from base FHIR resources or US Core profiles including US Core defined Must Support elements and Key Element Table specifying elements spcifically significanty for each respective QI-Core profile.


### Relevance of QI-Core Profiles to Authors

<div class="new-content" markdown="1">

QI-Core classes and attributes are the most relevant to the broader QI community, lying in the intersection of clinical
quality measures (CQM) and CDS, thus providing a common foundation for reusability. QI-Core
derives content from US Core profiles and extensions to the extent possible. The CQI Workgroup expects that QI-Core will continue to grow in concert with
US Core by incorporating needed extensions with broad applicability. To the extent possible, CQM and CDS authors should incorporate published domain-specific profiles to express content as much as possible rather than duplicating such concepts in QI-Core (e.g., minimum Common Oncology Data Elements (mCode)). The CQI and CDS Work Groups
coordinate with HL7 Work Groups that manage specific FHIR resources to align definitions and value sets including
concepts required for CDS and retrospective CQM use cases. Additional classes and attributes needed for
specific quality applications can be added through FHIR's extension mechanism. This QI-Core STU 7.0 uses FHIR extensions promoted from the previous Clinical Quality Framework (CQF) extensions to improve shareablility. QI-Core will evolve to include more of the extensional content when the community
identifies a common need, and the additional content has been validated.

QI-Core profile authoring provides a relatively facile method for creating CQM and CDS artifacts with CQL that expand to full FHIR representation for implementation through CQL-to-ELM conversion.
</div>

### Scope

The QI-Core FHIR Implementation Guide provides requirements and guidance for using FHIR in quality measurement and
decision support. The profiles in this implementation guide will be used to meet QI-Core project objectives of:

-  Encouraging consistent access and use of data for clinical quality applications across organizations and between healthcare systems,
-  Providing guidance for consistent use of vocabularies and value sets, and
-  Standardizing the requirements for data servers and data consumers (clients) that exchange quality-related clinical data needed for calculation of quality measures and decision support.

This IG is focused on representation of clinical data and is limited in breadth to the profiles currently included in
QI-Core. Not all FHIR resources are profiled, especially those that do not have clinical value in the context of quality
improvement, or do not map to QIDAM. Additional extensions may be added to the current set of profiles, and additional
profiles may be added later. QI-Core represents a subset of the semantics covered in QIDAM,
vMR, and QDM. The parts of the latter specifications that are not in the QI-Core profiles could be handled with
additional profiles, if the DSTU period reveals the need for such additions. Keeping the QI-Core profiles in
line with FHIR and FHIR's "80%" rule is one way to make sure that the quality artifacts produced from QI-Core
are computable, based on commonly collected clinical data. The current set of profiles will evolve to reflect changes to
the underlying FHIR resources.

The following topics are explicitly out of scope for this implementation guide:

-  Representing knowledge artifacts, analogous to Health Quality Measures Format (HQMF) or Clinical Decision Support (CDS) Knowledge Artifact Specification (KAS)
-  Representation of patient-data documents, analogous to Quality Reporting Document Architecture (QRDA) Cat I
-  Representation of documents containing results of quality measures, analogous to QRDA Cat III
-  Specifying implementation architectures and platforms for QI-Core
-  User extensions to the QI-Core profiles

Some of the above topics are under active investigation and will be topics of future standards efforts. Specifically,
the FHIR [Clinical Reasoning]({{site.data.fhir.path}}clinicalreasoning-module.html) module provides resources and
guidance representing and evaluating quality improvement artifacts within FHIR.

Consistent with changes in QI-Core STU 6.0, this STU 7.0 includes simplification to reduce the number of must support elements and further constraints on US Core content. The approach in previous QI-Core versions listed as [key elements](https://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#model-views) all metadata that might be relevant to clinical quality measurement and clinical decision support use cases. QI-Core STU 7.0 advances the concept that measurement and decision support real-world use cases should drive content for the IG. Thus, the profile key element tables are more concise, including only those elements necessary due to the base resource or relevant US Core profile and those elements used by tested and implemented use cases.


### Privacy, Security, and Consent

Quality applications may make use of patient-specific information. For this reason, all transactions must be
appropriately secured, limiting access to authorized individuals and protecting data while in transit (as laid out in
the [FHIR Implementer's Safety Check List]({{site.data.fhir.path}}safety.html#7.10.1)). These 
considerations relate to any FHIR implementation, including authentication, authorization, access control
consistent with patient consent, transaction logging, and following best practices. QI-Core security conformance rules are as follows:

<div class="new-content" markdown="1">

-  Systems **SHOULD** refer to BCP195 to ensure transmissions are taking place over a secure network connection.
</div>

-  Systems **SHOULD** use OAuth or an equivalent mechanism to provide necessary authentication (user or system-level).
-  Systems **SHOULD** use either IHE's ATNA standard for audit logging or an equivalent using the AuditEvent resource.

The server (data provider) is responsible for ensuring that any necessary consent records exist and are
reviewed prior to each exchange of patient-identifiable healthcare information. This verification should be logged in
the same manner as other transactions, as discussed above under General Security Considerations.

### Provenance

QI-Core addresses provenance at a data element level. We address data element provenance as defined by each respective
FHIR resource.  Each FHIR resource has its own way to address provenance (author, performer, author or issued date,
occurrence date, etc.). Therefore, we assure QI-Core can handle provenance based on the resource modeling.  The US
domain Quality Data Model handles provenance in the same way and the mapping tables from QDM attributes to QI-Core/FHIR
resource elements occurs at that level. There are some instances for which QI-Core creates extensions to ensure it
captures the resource-specific data provenance. Decisions to create such extensions are intentionally consistent with
each resource owner's future FHIR version direction and with discussions with the HL7 Work Groups responsible for the
respective resource. QI-Core closely follows US Core and will address future US Core versions that enhance its
approach to provenance.

### Relationship to Other Initiatives

QI-Core has been harmonized with other FHIR-based initiatives, particularly, the
[Data Access Framework (DAF)](https://oncprojectracking.healthit.gov/wiki/display/TechLabSC/DAF+Home).
[US Core]({{site.data.fhir.ver.uscore}}) is a US Realm Implementation Guide, developed under the DAF initiative, that
maps ONC Common Clinical Data Set elements to FHIR resources. The data elements in US Core are also in QI-Core, and
whenever possible, profiles defined in QI-Core are derived from the profiles in US Core. As a result, conforming to US
Core automatically satisfies a significant subset of the conformance requirements of QI-Core. QI-Core conformance
involves supporting certain additional data elements not required by US Core, because they are needed for quality
measures or clinical decision support.

Because QI-Core profiles derive from US Core profiles where possible, wherever US Core defines a binding, the QI-Core
profiles inherit that binding. QI-Core may specify additional constraints, such as requiring a binding that is only
preferred in the US Core base profile, but in general, the QI-Core profiles use the same bindings as US Core. This means
that QI-Core is currently a US Realm specification. To support applications outside the US Realm, additional binding
analysis and effort would be required.

QI-Core's extensions have also been reviewed by HL7 Work Groups and other initiatives to validate that QI-Core
extensions will not create future conflicts. Other initiatives that the QI-Core effort is aligning with include the
[Clinical Information Modeling Initiative (CIMI)](https://confluence.hl7.org/display/CIMI/Mission%2C+Charter%2C+Work+Products%2C+HL7+Working+Group+Relationships) and [Graphite Health](https://www.graphitehealth.io/).

In addition, the QI-Core effort *continues* to update the mapping from QDM to QI-Core such that a CQL-based artifact written with QDM as the model would be executable against a QI-Core compliant FHIR endpoint.

### Naming Conventions

QI-Core profiles are indicated by the prefix "QICore". For example, the QI-Core profile of Patient is named QICorePatient.

### Extensions and Mappings

QI-Core adds a variety of [extensions](extensions.html) to core FHIR classes. These extensions derive from two primary
sources: the Quality Improvement Domain Analysis Model (QIDAM), and the Quality Data Model (QDM). Profile pages contain
definitions of extensions and mappings to QDM as an aid for current users of QDM.

### MustSupport Flag

<div class="new-content" markdown="1">

QI-Core inherits Must Support references from US Core and so the [requirements on "MustSupport" defined in US Core]({{site.data.fhir.ver.uscore}}/must-support.html) must be respected; QI-Core does not add any Must Support elements.

QI-Core flags elements that the quality improvement community has identified as significant to express the full intent of measures 
and CDS artifacts or those that are used in established measures or CDS support services. Implementers are only required to support 
these additional elements when they are used in the measures or CDS artifacts implemented on or otherwise supported by the system. 
Since not all artifacts use each of these additional elements, QI-Core does not use the “MustSupport” flag to indicate these elements. 
Instead, “(QI)” is prepended to the element’s short description found in the Description & Constraints column of the Key Elements Table, 
and the computable [QI-Core Key Element Extension](StructureDefinition-qicore-keyelement.html) is added to each element definition. This approach 
allows IGs that extend QI-Core, such as those representing data requirements for specific measures or supporting CDS, to avoid inheriting requirements for those QI-Core-flagged elements that they do not use.
is inspired by the way that [US Core communicates USCDI requirements](https://hl7.org/fhir/us/core/must-support.html#uscdi-requirements) and 
allows IGs that extend QI-Core, such as those representing data requirements for specific measures or supporting CDS, to avoid inheriting requirements 
for those QI-Core-flagged elements that they do not use.

Quality improvement artifacts communicate the elements they reference using the DataRequirement structure in FHIR. This structure allows 
the base resource type and profile to be specified, as well as a MustSupport element that indicates which elements of the resource and 
profile are reference by the logic. Implementers can use this information directly from the effective data requirements to determine 
which elements must be provided to achieve a successful evaluation of the artifact. In addition, repositories and publishers may 
make use of this information to define artifact-specific profiles using the effective data requirements provided by the artifact.
</div>

### Modifying Attributes

Within FHIR resources, some elements are considered [Modifying Elements]({{site.data.fhir.path}}conformance-rules.html#isModifier),
indicating that the value of that element may change the interpretation of the resource.
Examples of modifying elements include status (in many resources), negations (e.g. Immunization.wasNotGiven),
and certainty qualifications (e.g. Observation.reliability). Decision support and
quality implementations MUST always check the values of modifying elements. For example, in processing an Immunization
resource, the application must inspect the "wasNotGiven" element to determine whether the immunization was given or was
not given to the patient. For this reason, applications that make use of resources must make sure they handle modifier elements appropriately.



### Identifying Occupational Data for Health
{: #Identifying-Occupational-Data-for-Health}

The profile inherited from US Core Observation Occupation Profile is based upon the core FHIR Observation Resource and implements 
the US Core Data for Interoperability (USCDI) Occupation and Occupation Industry requirements. 
That profile's Example Usage Scenarios include:

- Query for a patient’s work history
- [Record or update](https://www.hl7.org/fhir/us/core/future-of-US-core.html#future-candidate-requirements-under-consideration) past or present jobs belonging to a patient

To obtain information regarding other Occupational Data for Health (ODH)-specific concepts as indicated in the ODH version 
STU 1.3 [Artifacts Summary](https://hl7.org/fhir/us/odh/STU1.3/artifacts.html) use the QI-Core SimpleObservation profile Observation.code 
element to reference the exact LOINC code referenced by the specific ODH element of interest (e.g., 74165-2 for History of employment 
status NIOSH; 11341-5 for History of Occupation, 87510-4 Date of Retirement, etc.).

### Negation in QI-Core
{: #negation-in-qi-core}


QI-Core’s concept of negation follows the informative publication established by HL7.[^1] QI-Core constrains these concepts in the following way:

[^1]: For further information about representing negatives in HL7 standards, see: HL7 Cross Paradigm Specification: Representing Negatives, Release I. April 2022. Available at: <http://www.hl7.org/implement/standards/product_brief.cfm?product_id=592>. Retrieved 31 December 2023.

1.  Absence of data

    The measure or CDS artifact uses CQL to determine that an expected record artifact does not exist

2.  Documented absence of data with a valid reason

    The measure or CDS artifact uses a specifically designed QI-Core profile to indicate that an activity intentionally did not occur for a valid reason.

When there is a need to document evidence that an expected activity was not done due to patient intent and/or specific criteria, 
systems should use one of the ten QI-Core specific *negation* *rationale* profiles that align with existing profiles representing the expected actions. 
<a href="negation.html"><b>QI-Core Negation</b></a> provides detailed descriptions and guidance.


### Terminology Bindings

Uniformity in vocabularies and value sets enhances the interoperability of knowledge artifacts, but also forces data
owners to translate local data into the required vocabulary. As a US Realm product, QI-Core requires value sets and
vocabularies referenced in the ONC Common Clinical Data Set (CCDS) and the US Core Data for Interoperability. Because
QI-Core is expected to be applied outside the US Realm, and in clinical settings where local terminologies exist,
US Realm bindings could be  accompanied by alternative codes as translation codes in the QI-Core profiles. In the case
that the US Core Data for Interoperability adopts QI-Core and CQL, policy should be created to mandate the
preferred bindings given in the standard.

Note that quality improvement artifact authors should pay close attention to binding parameters specified in the
profiles to determine whether the value set defined in the binding is exemplar or should be constrained to a specific
value set when used. For example, the code element of the MedicationRequest profile is bound to the complete value set
for the RxNorm code system, indicating that all MedicationRequest instances **SHALL** use codes from the RxNorm code system,
but within any given artifact, instances will typically use a restricted value set.

### Resource References and "Any"

FHIR resources frequently contain references (pointers) to other FHIR resources. For example, Encounter.patient is a
reference to a Patient resource. In QI-Core, most references are constrained to QICore-profiled resources. For example,
QICore-Encounter.patient must point to a Patient resource that conforms to the QICore-Patient profile. Consequently, any
extensions or bindings expected to exist in QICore-Patient are also present in the resource pointed to by
Encounter.patient. References to QI-Core extensions accessed through references are guaranteed to be valid. References to resources that do not currently have
QI-Core profiles are not constrained, and as such, only the core FHIR properties and bindings are guaranteed to exist.

A particular problem occurs when a resource reference permits any type of resource, such as Encounter.indication. When
dealing with "Any" references, the current method of specifying profiles does not allow the profile author to specify
something to the effect of "a QI-Core resource when there is one, and a FHIR core resource if there isn't." In QI-Core,
the resources in "Any" references SHALL conform to QI-Core profiles if the base resource has been profiled.

### Summary of Conformance Requirements

Conformance to this QI-Core Implementation Guide requires the following (in addition to adherence to core FHIR requirements):

-  Implementations **SHALL** support all profile types in the QI-Core set (listed in the [profiles](profiles.html) page) for resources they exchange

<div class="new-content" markdown="1">
-  This IG does not define the capability statements as it does not address accessing patient level data directly via API calls; however, server implementations **SHALL** declare their support of the QI-Core profiles in a FHIR CapabilityStatement.
</div>

-  Conformant servers will at minimum support FHIR's read and search operations
-  Servers **SHALL** supply the MustSupport data elements whenever that data is available
-  Quality improvement applications **SHALL** recognize and process all MustSupport elements in QI-Core
-  Modifying attributes **SHALL** be treated as MustSupport, even if not explicitly declared
-  The resources in "Any" references **SHALL** conform to QI-Core profiles if the base resource has a QI-Core profile
-  Applications **SHALL NOT** process resource instances that include unknown modifying attributes
-  Applications **SHOULD** use the preferred value sets
-  In the US Realm, applications **SHALL** be simultaneously compliant with QI-Core profiles and US Core profiles. As such, the more restrictive bindings between US Core and QI-Core **SHALL** be adhered to. For example, all value sets that are required in US Core **SHALL** be required by QI-Core, regardless of the binding strength in QI-Core.

### Author Information

|Author Name|Affiliation|Role|
|---|---|---|
|Abdullah Rafiqi|ICF|Editor|
|Anne Smith|NCQA|Contributor|
|Ben Hamlin|NCQA|Contributor|
|Bryn Rhodes|Smile Digital Health|Editor|
|Chris Moesel|The MITRE Corporation|Contributor|
|Claude Nanjo|University of Utah|Originator|
|Claudia Hall||Contributor|
|Floyd Eisenberg|iParsimony, LLC|Primary|
|James Bradley|The MITRE Corporation|Contributor|
|Jason Walonoski|The MITRE Corporation|Contributor|
|Jen Seeman|ICF|Editor|
|Juliet Rubini|ICF|Contributor|
|Karl Naden|The MITRE Corporation|Contributor|
|Linda Michaelsen|Optum|Contributor|
|Mark Kramer|The MITRE Corporation|Originator|
|Jason Mathews|The MITRE Corporation|Originator|
|Lisa Anderson|Mathematica|Contributor|
|Lloyd McKenzie|Gevity Consulting|Contributor|
|Marc Hadley|The MITRE Corporation|Contributor|
|Paul Denning|The MITRE Corporation|Contributor|
|Peter Muir|ICF, Inc.|Contributor|
|Raman Srinivasan|IBM Watson Health|Contributor|
|Robert Samples||Contributor|
|Sam Sayer|The MITRE Corporation|Contributor|
|Stan Rankins|Telligen|Contributor|
|Yan Heras|Optimum eHealth, LLC|Contributor|
|Yanyan Hu|The Joint Commission|Contributor|
{: .list}
