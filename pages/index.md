---
layout: default
title: Home
topofpage: true
---

---

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

## 1 Quality Improvement Core (QI-Core) Implementation Guide

> This STU 4 update to the QI-Core profiles updates to FHIR R4 and US-Core STU 3. See the version history for a complete
list of changes to this version.

### 1.1 Summary

The QI-Core Implementation Guide defines a set of FHIR profiles with extensions and bindings needed to create
interoperable, quality-focused applications. The profiles in this implementation guide derive from and extend the
[US Core](http://hl7.org/fhir/us/core) profiles to provide a common foundation for building, sharing, and evaluating
knowledge artifacts across quality improvement efforts in the US Realm.

As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring workgroup,
[Clinical Quality Information](http://www.hl7.org/Special/committees/cqi/index.cfm), and incorporated as part of the
standard balloting process. The current roadmap follows closely behind the base FHIR roadmap, and the US Core
Implementation Guide.

### 1.2 Background

This Implementation Guide originated as a U.S. Realm Specification with support from the
[Clinical Quality Framework (CQF) initiative](https://oncprojectracking.healthit.gov/wiki/display/TechLabSC/CQF+Home),
which was a public-private partnership sponsored by the Centers for Medicare &amp; Medicaid Services (CMS) and the U.S.
Office of the National Coordinator (ONC) to harmonize standards for clinical decision support and electronic clinical
quality measurement. The [Clinical Quality Framework](http://wiki.hl7.org/index.php?title=Clinical_Quality_Framework)
effort transitioned to HL7's Clinical Quality Information (CQI) and Clinical Decision Support (CDS) Work Groups in 2016.
The HL7 CQI Work Group maintains this Implementation Guide, co-sponsored by the Clinical Decision Support (CDS) HL7 Work
Group to inform electronic clinical quality improvement (i.e., measurement and decision support). This Quality
Improvement Core (QI-Core) Implementation Guide is intended to be usable for multiple use cases across domains, and much
of the content is likely to be usable outside the U.S. Realm.

Understanding QI-Core and how it is used in quality applications requires an understanding of the role of common
reference models. Electronic Health Records (EHRs) are stored in many different local formats. Exchanging data between
EHRs requires mapping between local data formats. It is well understood that standards can reduce the number of data
maps each data provider must create. In a similar manner, to share quality measures and clinical decision support
artifacts, the measures and artifacts must refer to data in a standardized way.

In the U.S. Realm, the common reference model for electronic clinical quality measures (eCQMs) is the
[Quality Data Model (QDM)](https://ecqi.healthit.gov/qdm). For clinical decision support, a common reference model is
the [HL7 Virtual Medical Record for Clinical Decision Support(vMR)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=271).
Decision support and quality measures are closely related, and can be viewed as "two sides of the same coin".
Specifically, decision support provides guidance for clinical best practices, and quality measures assess whether
clinical best practices have been followed. It therefore makes intuitive sense to use the same common reference model
for both types of applications.

The resulting unified model is known as Quality Information and Clinical Knowledge (QUICK). QUICK is a logical model
consisting of objects, attributes, and relationships. QUICK provides a uniform way for clinical decision support and
quality measures to refer to clinical data. Authors of quality measures and clinical decision support artifacts may use
QUICK, together with HL7's Clinical Quality Language (CQL), to create interoperable and executable knowledge artifacts.

This initiative began in 2013 with the creation of the Quality Improvement Domain Analysis Model (QIDAM), which drew on the vMR and QDM as sources of requirements. Subsequently, a set of QI Core profiles were developed directly on specific versions of FHIR and reference to the QUICK model in QI-Core has been the logical view derived from the corresponding FHIR profiles for the respective version of FHIR upon which QI-Core profiles are based. Recognizing the broader community focus on FHIR, QUICK was aligned, structurally and semantically, as closely as possible to FHIR. This alignment not only creates a common model for quality and interoperability for the version of FHIR under consideration, but will also make it easier in the future to leverage other FHIR-related efforts, such as Clinical Document Architecture (CDA) on FHIR. The conceptual, logical, and physical models in this initiative are, respectively, QIDAM, QUICK, and the QI-Core FHIR Profiles.

This project is part of an effort to align the HL7 Product Family in the area of health quality improvement. The goal is
to have a single logical data model (QUICK), as well as a single logical processing language (CQL), for CDS and clinical
quality measurement (CQM). This alignment will lessen the cost and complexity for product developers and vendors, reduce
the learning curve, and consolidate efforts to maintain multiple standards.

### 1.3 Relationship Between QUICK, the QI-Core Profiles, and FHIR

The QUICK logical model was originally developed without reference to FHIR. However, when it became clear that FHIR
would be the focus of interoperability efforts in HL7, it no longer made sense for the quality improvement community to
maintain its own model of clinical information, for example, having a procedure model with different attributes than the
FHIR procedure resource. The decision was made by the CDS and CQI working groups to align QUICK with FHIR, and use the
FHIR resources to define the QUICK model. This decision means that QUICK benefits from all the thought and effort being
put into FHIR, and stays in synchronization with the development and evolution of FHIR.

Using FHIR to define the QUICK logical model seems to reverse the usual flow from conceptual model to logical model to
physical model. This is true, and has been the source of some controversy. Without revisiting that debate, the bottom
line is whether the QUICK model has the right set of objects and attributes that are needed for quality improvement
applications. To assure that QUICK does meet those requirements, the QI-Core profiles were created. QI-Core fills any
gaps such as missing attributes and unspecified value sets that might make QUICK insufficient for quality improvement
applications. In turn, QUICK is derived from QI-Core profiles, rather than directly from FHIR, providing an
author-focused view of the FHIR resources profiled by QI-Core.

### 1.4 Relevance of QI-Core Profiles to Authors

QI-Core classes and attributes are the most relevant to the broader QI community, lying in the intersection of clinical
quality measures (CQM) and CDS, thus providing a common foundation for reusability. To the extent possible, QI-Core
derives content from USCore profiles and extensions. The expectation is that QI-Core will continue to grow over time as
USCore grows, and by incorporating needed extensions with broad applicability. There may also be further extensions and
coordinated  profiles in specific domains beyond QI-Core, e.g., radiology-specific profiles. The CQI and CDS Work Groups
coordinate with HL7 Work Groups that manage specific FHIR resources to align definitions and value sets that include
concepts required for CDS and retrospective CQM use cases. When additional classes and attributes are needed for
specific quality applications, they can be added through FHIR's extension mechanism. These extensions, however, would
not automatically result in shareable artifacts without additional coordinating agreements between interested parties.
It is expected that QI-Core will evolve over time to include some of the extensional content when the community
identifies a common need and the additional content has been validated.

Though the QUICK model was intended to be the logical model used by quality artifact authors, a comprehensive FHIR version-independent QUICK model is not currently available and its feasibility needs further clarification. QI-Core does provide a QUICK logical view of clinical data from the perspective of representing quality measurement and decision support knowledge. The QUICK logical view is FHIR version-specific and it enables knowledge authors to ignore certain details of the FHIR Physical representation. Quality measures can be written using the QUICK logical view or directly using QI-Core profiles.

### 1.5 Scope

The QI-Core FHIR Implementation Guide provides requirements and guidance on the use of FHIR in quality measurement and
decision support. The profiles in this implementation guide will be used to meet QI-Core project objectives of:

-  Encouraging consistent access and use of data for clinical quality applications, across organizations and between healthcare systems,
-  Providing guidance for consistent use of vocabularies and value sets, and
-  Standardizing the requirements for data servers and data consumers (clients) that exchange quality-related clinical data needed for calculation of quality measures and decision support.

This IG is focused on representation of clinical data, and is limited in breadth to the profiles currently included in
QI-Core. Not all FHIR resources are profiled, especially those that do not have clinical value in the context of quality
improvement, or do not map to QIDAM. Additional extensions may be added to the current set of profiles, and additional
profiles may be added at a later time. In particular, QI-Core represents a subset of the semantics covered in QIDAM,
vMR, and QDM. The parts of the latter specifications that are not in the QI-Core profiles could be handled with
additional profiles, if the DSTU period reveals the need for such additions. Keeping the QI-Core profiles (and QUICK) in
line with FHIR and FHIR's "80%" rule is one way to make sure that the quality artifacts produced from QUICK and QI-Core
are computable, based on commonly-collected clinical data. The current set of profiles will evolve to reflect changes to
the underlying FHIR resources.

The following topics are explicitly out of scope for this implementation guide:

-  Representing knowledge artifacts, analogous to Health Quality Measures Format (HQMF) or Clinical Decision Support (CDS) Knowledge Artifact Specification (KAS)
-  Representation of patient-data documents, analogous to Quality Reporting Document Architecture (QRDA) Cat I
-  Representation of documents containing results of quality measures, analogous to QRDA Cat III
-  Specifying implementation architectures and platforms for QI-Core
-  User extensions to the QI-Core profiles

Some of the above topics are under active investigation and will be topics of future standards efforts. Specifically,
the FHIR [Clinical Reasoning]({{site.data.fhir.path}}clinicalreasoning-module.html) module provides resources and
guidance for how to represent and evaluate quality improvement artifacts within FHIR.

### 1.6 Privacy, Security, and Consent

Quality applications may make use of patient-specific information. For this reason, all transactions must be
appropriately secured, limiting access to authorized individuals and protecting data while in transit (as laid out in
the [FHIR Implementer's Safety Check List]({{site.data.fhir.path}}safety.html#7.10.1)). These are the same
considerations that would relate to any FHIR implementation, and include authentication, authorization, access control
consistent with patient consent, transaction logging, and following best practices. For the purposes of QI-Core,
security conformance rules are as follows:

-  Systems SHOULD use TLS version 1.1 or higher with bi-directional certificate validation for all transmissions not taking place over a secure network connection.
-  Systems SHOULD use OAuth or an equivalent mechanism to provide necessary authentication (user or system-level).
-  Systems SHOULD use either IHE's ATNA standard for audit logging or an equivalent using the AuditEvent resource.

It is the responsibility of the server (data provider) to ensure that any necessary consent records exist and are
reviewed prior to each exchange of patient-identifiable healthcare information. This verification should be logged in
the same manner as other transactions, as discussed above under General Security Considerations.

### 1.7 Relationship to Other Initiatives

QI-Core has been harmonized with certain other FHIR-based initiatives, in particular, the
[Data Access Framework (DAF)](https://oncprojectracking.healthit.gov/wiki/display/TechLabSC/DAF+Home).
[US Core](http://hl7.org/fhir/us/core) is a U.S. Realm Implementation Guide, developed under the DAF initiative, that
maps ONC Common Clinical Data Set elements to FHIR resources. The data elements in US Core are also in QI-Core, and
whenever possible, profiles defined in QI-Core are derived from the profiles in US Core. As a result, conforming to US
Core automatically satisfies a significant subset of the conformance requirements of QI-Core. QI-Core conformance
involves supporting certain additional data elements not required by US Core, because they are needed for quality
measures or clinical decision support.

Because QI-Core profiles derive from US Core profiles where possible, wherever US Core defines a binding, the QI-Core
profiles inherit that binding. QI-Core may specify additional constraints, such as requiring a binding that is only
preferred in the USCore base profile, but in general, the QI-Core profiles use the same bindings as US Core. This means
that QI-Core is currently a U.S. Realm specification. To support applications outside the U.S. Realm, additional binding
analysis and effort would be required.

QI-Core's extensions have also been reviewed by HL7 Work Groups and other initiatives to validate that QI-Core
extensions will not create future conflicts. Other initiatives that the QI-Core effort is aligning with include the
[Clinical Information Modeling Initiative (CIMI)](https://www.hl7.org/Special/Committees/cimi/overview.cfm) and the
[Healthcare Services Platform Consortium (HSPC)](http://hspconsortium.org).

For the CIMI effort in particular, the QI-Core effort is engaged in the same work to identify and develop tooling to
automatically generate FHIR profiles from a logical model, ideally resulting in a scenario where the CIMI modeling tools
can be used to express the QUICK logical model, and then use the same tool chain to generate the QI-Core profiles,
rather than infer the QUICK model from the definition of the QI-Core profiles as is currently done.

In addition, the QI-Core effort is actively working with the QDM to produce a mapping from QDM to QI-Core such that a
CQL-based artifact written with QDM as the model would be executable against a QI-Core compliant FHIR endpoint.

### 1.8 Contents
{: #contents}

The following table lists the QI-Core profiles that are part of the IG, which USCore profile they are derived from, if
any, and the underlying FHIR resources:

|QI-Core Profile|USCore Profile|Base Resource|
|---|---|---|
|[QICore-AdverseEvent](StructureDefinition-qicore-adverseevent.html)| |[AdverseEvent]({{site.data.fhir.path}}adverseevent.html)|
|[QICore-AllergyIntolerance](StructureDefinition-qicore-allergyintolerance.html)| [USCore-AllergyIntolerance](http://hl7.org/fhir/us/core/StructureDefinition-us-core-allergyintolerance.html) |[AllergyIntolerance]({{site.data.fhir.path}}allergyintolerance.html)|
|[QICore-BodyStructure](StructureDefinition-qicore-bodystructure.html)| |[BodyStructure]({{site.data.fhir.path}}bodystructure.html)|
|[QICore-Claim](StructureDefinition-qicore-claim.html)| |[Claim]({{site.data.fhir.path}}claim.html)|
|[QICore-Communication](StructureDefinition-qicore-communication.html)| |[Communication]({{site.data.fhir.path}}communication.html)|
|[QICore-CommunicationRequest](StructureDefinition-qicore-communicationrequest.html)| |[CommunicationRequest]({{site.data.fhir.path}}communicationrequest.html)|
|[QICore-Condition](StructureDefinition-qicore-condition.html)| [USCore-Condition](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html) |[Condition]({{site.data.fhir.path}}condition.html)|
|[QICore-Coverage](StructureDefinition-qicore-coverage.html)| |[Coverage]({{site.data.fhir.path}}coverage.html)|
|[QICore-Device](StructureDefinition-qicore-device.html)| |[Device]({{site.data.fhir.path}}device.html)|
|[QICore-DeviceRequest](StructureDefinition-qicore-devicerequest.html)| |[DeviceRequest]({{site.data.fhir.path}}devicerequest.html)|
|[QICore-DeviceUseStatement](StructureDefinition-qicore-deviceusestatement.html)| |[DeviceUseStatement]({{site.data.fhir.path}}deviceusestatement.html)|
|[QICore-DiagnosticReportLab](StructureDefinition-qicore-diagnosticreport-lab.html)| [USCore-DiagnosticReportLab](http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) |[DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html)|
|[QICore-DiagnosticReportNote](StructureDefinition-qicore-diagnosticreport-note.html)| [USCore-DiagnosticReportNote](http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html) |[DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html)|
|[QICore-Encounter](StructureDefinition-qicore-encounter.html)| [USCore-Encounter](http://hl7.org/fhir/us/core/StructureDefinition-us-core-encounter.html) |[Encounter]({{site.data.fhir.path}}encounter.html)|
|[QICore-FamilyMemberHistory](StructureDefinition-qicore-familymemberhistory.html)| |[FamilyMemberHistory]({{site.data.fhir.path}}familymemberhistory.html)|
|[QICore-Flag](StructureDefinition-qicore-flag.html)| |[Flag]({{site.data.fhir.path}}flag.html)|
|[QICore-Goal](StructureDefinition-qicore-goal.html)| [USCore-Goal](http://hl7.org/fhir/us/core/StructureDefinition-us-core-goal.html) |[Goal]({{site.data.fhir.path}}goal.html)|
|[QICore-ImagingStudy](StructureDefinition-qicore-imagingstudy.html)| |[ImagingStudy]({{site.data.fhir.path}}imagingstudy.html)|
|[QICore-Immunization](StructureDefinition-qicore-immunization.html)| [USCore-Immunization](http://hl7.org/fhir/us/core/StructureDefinition-us-core-immunization.html) |[Immunization]({{site.data.fhir.path}}immunization.html)|
|[QICore-ImmunizationRecommendation](StructureDefinition-qicore-immunizationrec.html)| |[ImmunizationRecommendation]({{site.data.fhir.path}}immunizationrecommendation.html)|
|[QICore-ImplantableDevice](StructureDefinition-qicore-device.html)| [USCore-ImplantableDevice](http://hl7.org/fhir/us/core/StructureDefinition-us-core-implantable-device.html) |[Device]({{site.data.fhir.path}}device.html)|
|[QICore-Location](StructureDefinition-qicore-location.html)| [USCore-Location](http://hl7.org/fhir/us/core/StructureDefinition-us-core-location.html) |[Location]({{site.data.fhir.path}}location.html)|
|[QICore-Medication](StructureDefinition-qicore-medication.html)| [USCore-Medication](http://hl7.org/fhir/us/core/StructureDefinition-us-core-medication.html) |[Medication]({{site.data.fhir.path}}medication.html)|
|[QICore-MedicationAdministration](StructureDefinition-qicore-medicationadministration.html)| |[MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html)|
|[QICore-MedicationDispense](StructureDefinition-qicore-medicationdispense.html)| |[MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)|
|[QICore-MedicationRequest](StructureDefinition-qicore-medicationrequest.html)| [USCore-MedicationRequest](http://hl7.org/fhir/us/core/StructureDefinition-us-core-medicationrequest.html) |[MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)|
|[QICore-MedicationStatement](StructureDefinition-qicore-medicationstatement.html)| |[MedicationStatement]({{site.data.fhir.path}}medicationstatement.html)|
|[QICore-Observation](StructureDefinition-qicore-observation.html)| |[Observation]({{site.data.fhir.path}}observation.html)|
| | [FHIR Vital Signs]({{site.data.fhir.path}}observation-vitalsigns.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Smoking Status](http://hl7.org/fhir/us/core/StructureDefinition-us-core-smokingstatus.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Laboratory Result](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Pediatric BMI for Age](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-bmi-for-age.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Pediatric Weight for Height](http://hl7.org/fhir/us/core/StructureDefinition-pediatric-weight-for-height.html) | [Observation]({{site.data.fhir.path}}observation.html) |
| | [USCore Pulse Oximetry](http://hl7.org/fhir/us/core/StructureDefinition-us-core-pulse-oximetry.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|[QICore-Organization](StructureDefinition-qicore-organization.html)| [USCore-Organization](http://hl7.org/fhir/us/core/StructureDefinition-us-core-organization.html) |[Organization]({{site.data.fhir.path}}organization.html)|
|[QICore-Patient](StructureDefinition-qicore-patient.html)| [USCore-Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html) |[Patient]({{site.data.fhir.path}}patient.html)|
|[QICore-Practitioner](StructureDefinition-qicore-practitioner.html)| [USCore-Practitioner](http://hl7.org/fhir/us/core/StructureDefinition-us-core-practitioner.html) |[Practitioner]({{site.data.fhir.path}}practitioner.html)|
|[QICore-PractitionerRole](StructureDefinition-qicore-practitionerrole.html)| [USCore-PractitionerRole](http://hl7.org/fhir/us/core/StructureDefinition-us-core-practitionerrole.html) |[PractitionerRole]({{site.data.fhir.path}}practitionerrole.html)|
|[QICore-Procedure](StructureDefinition-qicore-procedure.html)| [USCore-Procedure](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html) |[Procedure]({{site.data.fhir.path}}procedure.html)|
|[QICore-RelatedPerson](StructureDefinition-qicore-relatedperson.html)| |[RelatedPerson]({{site.data.fhir.path}}relatedperson.html)|
|[QICore-ServiceRequest](StructureDefinition-qicore-servicerequest.html)| |[ServiceRequest]({{site.data.fhir.path}}servicerequest.html)|
|[QICore-Specimen](StructureDefinition-qicore-specimen.html)| |[Specimen]({{site.data.fhir.path}}specimen.html)|
|[QICore-Substance](StructureDefinition-qicore-substance.html)| |[Substance]({{site.data.fhir.path}}substance.html)|
|[QICore-Task](StructureDefinition-qicore-task.html)| |[Task]({{site.data.fhir.path}}task.html)|
{: .list}

The QUICK Logical View of these profiles is provided [here](quick/QUICK-index.html).

### 1.9 Naming Conventions

QI-Core profiles are indicated by the prefix "QICore-". For example, the QI-Core profile of Patient is named QICore-Patient.

### 1.10 Extensions and Mappings

QI-Core adds a variety of [extensions](extensions.html) to core FHIR classes. These extensions derive from two primary
sources: the Quality Improvement Domain Analysis Model (QIDAM), and the Quality Data Model (QDM). Profile pages contain
definitions of extensions and mappings to QDM as an aid for current users of QDM.

### 1.11 MustSupport Flag

QI Core derives from US Core and so the [requirements on "MustSupport" defined in US Core](http://hl7.org/fhir/us/core/general-guidance.html#must-support) must be respected.

In addition to the requirements defined in the US Core base, QI Core further describes and constrains the "MustSupport"
functionality.

Certain elements in the QI-Core profiles have a "MustSupport" flag. In the QI-Core quality profiles, the MustSupport
flag is used to indicate whether the element must be supported in QI implementations. More specifically, labelling an
element as MustSupport means that quality improvement implementations SHALL understand and process the element.

In addition, only elements where MustSupport is true can be used in quality measure criteria or decision support
condition and triggering logic. This is because if the logic references an element, the conclusion is not valid unless
the exchanging system supports the elements being referenced by the logic.

Although support is not guaranteed, references to elements where MustSupport is false (or does not appear) in the
QI-Core profile would be useful and should be provided. All elements in the QI-Core profiles, including those that are
not MustSupport, can be used in CDS actions (i.e. right-hand side or consequents of CDS rules). For example, vaccination
protocol in ImmunizationRecommendation is not a MustSupport element, so it cannot be used in a quality measure or as a
criteria for triggering a CDS action. However, it can be filled in as part of the recommendation of a CDS application.

Although the element may be returned in a resource when the resource is retrieved from an EHR, no logical processing
involving that data element can be expected. Note that the MustSupport flag does not imply that the element will always
have a value, if the lower cardinality is zero. The only assurance associated with MustSupport is that the quality
improvement application will try to retrieve the data and process it if the data allows.

Specific applications can modify the profiles and set MustSupport flags to true if they will process additional
elements, but setting a MustSupport flag from true to false is noncompliant.

In summary, MustSupport elements represent the minimal set of data elements that must be supported in quality
applications, defined as follows:

-  data elements whenever that data is available,
-  Quality artifact authors can use the MustSupport elements in their artifacts with the expectation that the model elements will be portable across all systems compliant with QI-Core, and
-  Quality improvement artifact applications SHALL recognize and process all MustSupport elements in QI-Core.

### 1.12 Modifying Attributes

Is-Modifier is a boolean property of an element, indicating that the value of that element may change the interpretation
of the resource. Examples of modifying elements include status (in many resources), negations
(e.g. Immunization.wasNotGiven), and certainty qualifications (e.g. Observation.reliability). Decision support and
quality implementations MUST always check the values of modifying elements. For example, in processing an Immunization
resource, the application must inspect the "wasNotGiven" element to determine whether the immunization was given or was
not given to the patient. For this reason, modifying elements SHALL be treated as MustSupport, even if not declared.

As an aside, inclusion of modifying elements is a departure from the previous (January 2014) informative version of the
QI-Core profiles, where profiles were developed for each meaning of each modifying attribute. For example, the Condition
resource was represented using two profiles, one representing the occurrence of the condition, and the other the
non-occurrence of the condition. However, it was felt the proliferation of profiles under this approach would lead to a
non-sustainable situation, particularly in light of the future need to expand QI-Core by incorporation of third-party
profiles, such as those being developed by CIMI. The current approach requires quality improvement artifact authors to
make explicit checks for modifying elements when dealing with classes that have modifying elements.

### 1.13 Terminology Bindings

Uniformity in vocabularies and value sets enhances the interoperability of knowledge artifacts, but also forces data
owners to translate local data into the required vocabulary. As a US Realm product, QI-Core requires value sets and
vocabularies referenced in the ONC Common Clinical Data Set (CCDS) and the US Core Data for Interoperability. Because
QI-Core is expected to be applied outside the U.S. Realm, and also in clinical settings where local terminologies exist,
U.S. Realm bindings could be  accompanied by alternative codes as translation codes in the QI-Core profiles. In the case
that the US Core Data for Interoperability adopts QI-Core, QUICK, and CQL, policy should be created to mandate the
preferred bindings given in the standard.

Note that quality improvement artifact authors should pay close attention to binding parameters specified in the
profiles to determine whether the value set defined in the binding is exemplar or should be constrained to a specific
value set when used. For example, the code element of the MedicationRequest profile is bound to the complete value set
for the RxNorm code system, indicating that all MedicationRequest instances shall use codes from the RxNorm code system,
but within any given artifact, instances will typically use a restricted value set.

### 1.14 Resource References and "Any"

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

### 1.15 Summary of Conformance Requirements

Conformance to this QI-Core Implementation Guide requires the following (in addition to adherence to core FHIR requirements):

-  Implementations SHALL support all profile types in the QI-Core set (listed in the [table above](#contents)) for resources they exchange
-  Server implementations SHALL declare their support of the QI-Core profiles in a FHIR Conformance statement
-  Conformant servers will at minimum support FHIR's read and search operations
-  Servers SHALL supply the MustSupport data elements whenever that data is available
-  Quality improvement applications SHALL recognize and process all MustSupport elements in QI-Core
-  Modifying attributes SHALL be treated as MustSupport, even if not explicitly declared
-  The resources in "Any" references SHALL conform to QI-Core profiles if the base resource has a QI-Core profile
-  Applications SHALL NOT process resource instances that include unknown modifying attributes
-  Applications SHOULD use the preferred value sets
-  In the U.S. Realm, applications SHALL be simultaneously compliant with QI-Core profiles and US Core profiles. As such, the more restrictive bindings between US Core and QI-Core SHALL be adhered to. For example, all value sets that are required in US Core SHALL be required by QI-Core, regardless of the binding strength in QI-Core.

### 1.16 Author Information

|Author Name|Affiliation|Role|
|---|---|---|
|Lisa Anderson| |Contributor|
|James Bradley|The MITRE Corporation|Contributor|
|Paul Denning|The MITRE Corporation|Contributor|
|Floyd Eisenberg||Primary|
|Marc Hadley|The MITRE Corporation|Contributor|
|Claudia Hall||Contributor|
|Ben Hamlin, MPH|NCQA|Contributor|
|Yan Heras||Contributor|
|Yanyan Hu||Contributor|
|Mark Kramer|The MITRE Corporation|Originator|
|Jason Mathews|The MITRE Corporation|Originator|
|Lloyd McKenzie||Contributor|
|Chris Moesel|The MITRE Corporation|Contributor|
|Peter Muir|ESAC, Inc.|Contributor|
|Claude Nanjo||Originator|
|Stan Rankins|Telligen|Contributor|
|Bryn Rhodes|Alphora|Editor|
|Juliet Rubini|Mathematica|Contributor|
|Robert Samples|ESAC, Inc.|Contributor|
|Sam Sayer|The MITRE Corporation|Contributor|
|Anne Smith|NCQA|Contributor|
|Raman Srinivasan|IBM Watson Health|Contributor|
|Jason Walonoski|The MITRE Corporation|Contributor|
{: .list}
