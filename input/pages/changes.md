{: toc}

{: #changes}

This page lists the change history for each version of QI Core.
### STU5 Release
1. **Applied**: Add ODH - 2016-09 qicore #21 ([FHIR-12091](https://jira.hl7.org/browse/FHIR-12091))
1. **Applied**: Add ODH - 2018-Jan QI-Core #33 ([FHIR-14998](https://jira.hl7.org/browse/FHIR-14998))
1. **Applied**: Update QI-Core to incorporate changes from US Core 3.2.0 ballot ([FHIR-30116](https://jira.hl7.org/browse/FHIR-30116))
1. **Applied**: qicore-encounter-diagnosisPresentOnAdmission not applicable for outpatient encounters but always required when sending a diagnosis ([FHIR-31764](https://jira.hl7.org/browse/FHIR-31764))
1. **Applied**: Update Cumulative Medication Duration examples in upcoming update ([FHIR-32007](https://jira.hl7.org/browse/FHIR-32007))
1. **Resolved - no change required**: Add extension for MedicationDispense.statusChange ([FHIR-32805](https://jira.hl7.org/browse/FHIR-32805))
1. **Applied**: Add pattern for blood pressure ([FHIR-32945](https://jira.hl7.org/browse/FHIR-32945))
1. **Applied**: QI Core Specimen Profile not used in QI Core ImagingStudy or QI Core ServiceRequest ([FHIR-32967](https://jira.hl7.org/browse/FHIR-32967))
1. **Applied**: QI Core ImagingStudy needs more Resource types for Referrer and Interpreter ([FHIR-32968](https://jira.hl7.org/browse/FHIR-32968))
1. **Applied**: Mark timing.bounds as mustSupport ([FHIR-33017](https://jira.hl7.org/browse/FHIR-33017))
1. **Applied**: Mark mandatory top level elements MUST SUPPORT ([FHIR-33029](https://jira.hl7.org/browse/FHIR-33029))
1. **Applied**: QI Core Immunization Profile should only allow Completed status and statusReason should not be allowed ([FHIR-33087](https://jira.hl7.org/browse/FHIR-33087))
1. **Applied**: Remove duplicate profile statements ([FHIR-33199](https://jira.hl7.org/browse/FHIR-33199))
1. **Applied**: FamilyMemberHistory profile needs to have a more constrained binding on Relationship code set ([FHIR-33230](https://jira.hl7.org/browse/FHIR-33230))
1. **Applied**: Need ClaimResponse Resource added to QI Core Profiles ([FHIR-33373](https://jira.hl7.org/browse/FHIR-33373))
1. **Applied**: Should Encounter.diagnosis.condition be restricted to reference (condition) and NOT (procedure) and specify the change in QDM mapping - September Update ([FHIR-33491](https://jira.hl7.org/browse/FHIR-33491))
1. **Applied**: Medication.code Preferred binding is less than US Core extensible binding ([FHIR-34071](https://jira.hl7.org/browse/FHIR-34071))
1. **Applied**: Medication.form appears on the Differential View but no apparent change from US Core ([FHIR-34072](https://jira.hl7.org/browse/FHIR-34072))
1. **Applied**: Aligning with US Core - New conformance expectations page ([FHIR-34154](https://jira.hl7.org/browse/FHIR-34154))
1. **Applied**: Align with US CORE on VSAC terminology references ([FHIR-34167](https://jira.hl7.org/browse/FHIR-34167))
1. **Applied**: Change $docref start and end input parameter types from date to dateTime ([FHIR-34169](https://jira.hl7.org/browse/FHIR-34169))
1. **Applied**: Align with US Core 4.0 - must support complex elements ([FHIR-34176](https://jira.hl7.org/browse/FHIR-34176))
1. **Applied**: Align with US Core 4.0 - include VSAC instructions in terminology section ([FHIR-34177](https://jira.hl7.org/browse/FHIR-34177))
1. **Applied**: Align with US Core 4.0 - must support choice of profile elements ([FHIR-34178](https://jira.hl7.org/browse/FHIR-34178))
1. **Applied**: Align with US Core 4.0 - align invariants and binding change in PractitionerRole ([FHIR-34179](https://jira.hl7.org/browse/FHIR-34179))
1. **Applied**: CommunicationNotDone profile does not have Subject as Must Support ([FHIR-34313](https://jira.hl7.org/browse/FHIR-34313))
1. **Applied**: AdverseEvent. referenceDocument does not reference US Core Document Reference ([FHIR-34367](https://jira.hl7.org/browse/FHIR-34367))
1. **Applied**: AdverseEvent.contributor does not reference QI Core profiles for  Contributor or suspectEntity.causality.author ([FHIR-34368](https://jira.hl7.org/browse/FHIR-34368))
1. **Applied**: Organization profile should mirror US Core telecom must support elements of system and value ([FHIR-34482](https://jira.hl7.org/browse/FHIR-34482))
1. **Applied**: Add due duration to QI Core Goal.target ([FHIR-34484](https://jira.hl7.org/browse/FHIR-34484))
1. **Applied**: Consider updating StructureDefinition-qicore-diagnosticreport-lab to mirror US Core for performer element ([FHIR-34531](https://jira.hl7.org/browse/FHIR-34531))
1. **Applied**: Consider updating choice type for Encounter.referenceReason to mirror US Core ([FHIR-34534](https://jira.hl7.org/browse/FHIR-34534))
1. **Applied**: Careplan.text.div should be MS to mirror US Core ([FHIR-34535](https://jira.hl7.org/browse/FHIR-34535))
1. **Applied**: Consider adding MS datatypes on observation.value[x] ([FHIR-34536](https://jira.hl7.org/browse/FHIR-34536))
1. **Applied**: Consider adding MS datatypes on observation.effective[x] ([FHIR-34537](https://jira.hl7.org/browse/FHIR-34537))
1. **Applied**: Update definition of diagnosticreport.effective[x] ([FHIR-34557](https://jira.hl7.org/browse/FHIR-34557))
1. **Applied**: Consider adding MS on medicationrequest.requester choice type of Practitioner ([FHIR-34559](https://jira.hl7.org/browse/FHIR-34559))
1. **Applied**: ServiceRequest.statusReason is not bound to a value set yet it is an extension added for use by QI Core ([FHIR-35100](https://jira.hl7.org/browse/FHIR-35100))
1. **Applied**: Change example value sets for MS items to Preferred - Immunization-related ([FHIR-35813](https://jira.hl7.org/browse/FHIR-35813))
1. **Applied**: Change example value sets for MS items to Preferred - Medication-related ([FHIR-35814](https://jira.hl7.org/browse/FHIR-35814))
1. **Applied**: Change QI Core Communication Resource MS items to Preferred Value Set bindings ([FHIR-35815](https://jira.hl7.org/browse/FHIR-35815))
1. **Applied**: QI Core Care Plan and Goal Profiles have MS items with example bindings to value sets - change to Preferred ([FHIR-35816](https://jira.hl7.org/browse/FHIR-35816))
1. **Applied**: Change value set bindings for QI-Core AllergyIntolerance, AdverseEvent, Condition, Procedure elements with MS ([FHIR-35817](https://jira.hl7.org/browse/FHIR-35817))
1. **Applied**: QICore Flag profile elements with MS example bindings should change to preferred bindings ([FHIR-35818](https://jira.hl7.org/browse/FHIR-35818))
1. **Applied**: QICore ServiceRequest, ServiceNotRequested MS item should have preferred value set bindings ([FHIR-35819](https://jira.hl7.org/browse/FHIR-35819))
1. **Applied**: Change QICore Specimen value set bindings where items are Must Support ([FHIR-35820](https://jira.hl7.org/browse/FHIR-35820))
1. **Applied**: Device-related QI-Core profile elements that are Must Support should have preferred bindings, not example bindings ([FHIR-35821](https://jira.hl7.org/browse/FHIR-35821))
1. **Applied**: QI-Core observation-related profile Must Support elements should all have Preferred bindings, not example bindings ([FHIR-35822](https://jira.hl7.org/browse/FHIR-35822))
1. **Applied**: QI-Core Task profile elements that are Must Support should use preferred bindings to value sets, not examples ([FHIR-35823](https://jira.hl7.org/browse/FHIR-35823))
1. **Applied**: QI-Core Encounter and Organization Profile MS elements should have preferred value set bindings, not examples ([FHIR-35824](https://jira.hl7.org/browse/FHIR-35824))
1. **Applied**: QI Core Profile on FamilyMemberHistory has Relationship as a Must Support field but code set is Must Support ([FHIR-35903](https://jira.hl7.org/browse/FHIR-35903))
1. **Applied**: Nutrition Order is not consistent with out Request pattern resources ([FHIR-35944](https://jira.hl7.org/browse/FHIR-35944))
1. **Applied**: QI Core Substance has code as Must Support but bound to example code set ([FHIR-35946](https://jira.hl7.org/browse/FHIR-35946))
1. **Applied**: Goal.target.measure and goal.target.date are both required so should be Must Support ([FHIR-35947](https://jira.hl7.org/browse/FHIR-35947))
1. **Applied**: Need practitionerRole in Encounter.participant.individual as it supports specialty taxonomy which is needed in some quality scenarios ([FHIR-36745](https://jira.hl7.org/browse/FHIR-36745))
1. **Applied**: Update PractionerRole.specialty value set binding to match US Core 5.0.0 ([FHIR-37365](https://jira.hl7.org/browse/FHIR-37365))
1. **Applied**: Update ServiceRequest to match US Core 5.0.0 ([FHIR-37447](https://jira.hl7.org/browse/FHIR-37447))
1. **Applied**: Update QI-Core to reference new US Core 5.0 Observation profiles ([FHIR-37457](https://jira.hl7.org/browse/FHIR-37457))
1. **Applied**: Create new QI-Core QuestionnaireResponse Profile consistent with US Core 5.0.0 ([FHIR-37458](https://jira.hl7.org/browse/FHIR-37458))
1. **Applied**: Create new Observation Clinical Test Result profile consistent with US Core 5.0.0 ([FHIR-37459](https://jira.hl7.org/browse/FHIR-37459))
1. **Applied**: Create new Observation Imaging Result Profile consistent with US Core 5.0.0 ([FHIR-37460](https://jira.hl7.org/browse/FHIR-37460))
1. **Applied**: Create Observation Sexual Orientation Profile consistent with US Core 5.0.0 ([FHIR-37461](https://jira.hl7.org/browse/FHIR-37461))
1. **Applied**: Create new Observation Social History Profile consistent with US Core 5.0.0 ([FHIR-37462](https://jira.hl7.org/browse/FHIR-37462))
1. **Applied**: Create new Observation Survey Profile Consistent with US Core 5.0.0 ([FHIR-37463](https://jira.hl7.org/browse/FHIR-37463))
1. **Applied**: Add new Conditions Problems and Health Concerns Profile and Encounter Diagnosis Profile consistent with US Core 5.0.0 ([FHIR-37464](https://jira.hl7.org/browse/FHIR-37464))
1. **Applied**: Update ObservationNotDone profile to indicate use for all observation profiles ([FHIR-37489](https://jira.hl7.org/browse/FHIR-37489))
1. **Applied**: Update QICore Observation Profile to indicate restricted use ([FHIR-37490](https://jira.hl7.org/browse/FHIR-37490))
1. **Applied**: Add full QI-Core Laboratory Result Observation Profile ([FHIR-37505](https://jira.hl7.org/browse/FHIR-37505))
1. **Applied**: Add Must Support for Procedure.usedReference ([FHIR-37532](https://jira.hl7.org/browse/FHIR-37532))
1. **Applied**: Add note to balloters for feedback in next ballot version ([FHIR-37535](https://jira.hl7.org/browse/FHIR-37535))
1. **Applied**: Update QDM to QI-Core Mapping section ([FHIR-37536](https://jira.hl7.org/browse/FHIR-37536))
1. **Applied**: Modify text on introduction page for QI-Core ([FHIR-37539](https://jira.hl7.org/browse/FHIR-37539))
1. **Resolved - change required**: Update Model Info ([FHIR-37579](https://jira.hl7.org/browse/FHIR-37579))
1. **Applied**: Encounter.hospitalization.dischargeDisposition binding - for QI-Core R5 is incorrect ([FHIR-37627](https://jira.hl7.org/browse/FHIR-37627))
1. **Applied**: TaskNotDone Task.code binding to task-code value set should be preferred, not example ([FHIR-37656](https://jira.hl7.org/browse/FHIR-37656))
1. **Applied**: Changes to Coverage profile ([FHIR-37669](https://jira.hl7.org/browse/FHIR-37669))
1. **Applied**: Remove CCN Number Identifier Slice from QI Core Practitioner as this only applies to an Organization ([FHIR-37751](https://jira.hl7.org/browse/FHIR-37751))
1. **Applied**: Adding ODH capability to QICore ([FHIR-37755](https://jira.hl7.org/browse/FHIR-37755))
1. **Applied**: Remove references for .subject in ObservationLab and ObservationClinicalTest ([FHIR-37782](https://jira.hl7.org/browse/FHIR-37782))
1. **Applied**: Small typo ([FHIR-37788](https://jira.hl7.org/browse/FHIR-37788))
1. **Applied**: Modify language in section 1.8 - Relationship to Other Initiatives ([FHIR-37806](https://jira.hl7.org/browse/FHIR-37806))
1. **Applied**: Removed negation-discerning status values from non-negation profiles ([FHIR-38788](https://jira.hl7.org/browse/FHIR-38788))
1. **Applied**: Changed TaskNotDone profile to TaskRejected throughout ([FHIR-38850](https://jira.hl7.org/browse/FHIR-38850))
1. **Applied**: Changed ObservationNotDone profile to ObservationCancelled throughout ([FHIR-38850](https://jira.hl7.org/browse/FHIR-38850))
1. **Applied**: Changed MedicationDispenseNotDone profile to MedicationDispenseDeclined throughout ([FHIR-38850](https://jira.hl7.org/browse/FHIR-38850))
1. **Applied**: Fixed title for negation rationale for Immunization, Administered in QDM to QI Core Mapping([FHIR-39307](https://jira.hl7.org/browse/FHIR-39307))
1. **Applied**: Fixed title for negation rationale for Laboratory Text, Order in QDM to QI Core Mapping ([FHIR-39307](https://jira.hl7.org/browse/FHIR-39307))



### STU4.1 Release with 1 Technical Errata for FHIR R4 (v4.1.1)

* [FHIR-35873](https://jira.hl7.org/browse/FHIR-35873): Corrected version-independent links to USCore throughout
* [FHIR-35802](https://jira.hl7.org/browse/FHIR-35802): Corrected negation examples and added guidance for usage of valueset-based negation

### STU4.1 Release for FHIR R4

STU4.1 (v4.1.0)
* 1. **Applied**:Broken Link for QUICK AdverseEvent actuality value set binding ([FHIR-23934](https://jira.hl7.org/browse/FHIR-23934))
1. **Applied**:Immunization.occurrence should remove the String choice ([FHIR-26407](https://jira.hl7.org/browse/FHIR-26407))
1. **Applied**:MedicationNotDispensed ([FHIR-26409](https://jira.hl7.org/browse/FHIR-26409))
1. **Applied**:Naming of QUICK vs QI-Core Logical View  ([FHIR-26592](https://jira.hl7.org/browse/FHIR-26592))
1.  **Applied**:Medication list patient reported medications use Intent = Plan (not order) ([FHIR-26829](https://jira.hl7.org/browse/FHIR-26829))
1. **Applied**:wrong link in QDM to QICore mapping ([FHIR-27031](https://jira.hl7.org/browse/FHIR-27031))
1. **Applied**:Remove imagingStudy must support from the QICoreDiagnosticReportLab profile ([FHIR-27163](https://jira.hl7.org/browse/FHIR-27163))
1. **Applied**:Add TIN to QICore Organization Profile ([FHIR-27804](https://jira.hl7.org/browse/FHIR-27804))
1. **Applied**:DEQM Practitioner and DEQM Organization Profile should be added to QI Core ([FHIR-28157](https://jira.hl7.org/browse/FHIR-28157))
1. **Applied**:Patient resource generalpractitioner needs to consider PractitionerRole (https://jira.hl7.org/browse/FHIR-28220))
1. **Applied**:Can you add my affiliation? ([FHIR-28231](https://jira.hl7.org/browse/FHIR-28231))
1. **Applied**:change D.role to D.use in example with Encounter.diagnosis ([FHIR-28241](https://jira.hl7.org/browse/FHIR-28241))
1. **Applied**:Add MUST HAVE for MedicationRequest timing elements ([FHIR-28286](https://jira.hl7.org/browse/FHIR-28286))
1. **Applied**:Update Present On Admission in QDM to QI Core Mapping ([FHIR-29703](https://jira.hl7.org/browse/FHIR-29703))
1. **Applied**:Change mapping of \"Encounter, Performed\" code from Encounter.class to Encounter.type ([FHIR-29819](https://jira.hl7.org/browse/FHIR-29819))
1. **Applied**:QDM to QI-Core mapping for AdverseEvent error ([FHIR-30098](https://jira.hl7.org/browse/FHIR-30098))
1. **Applied**:Add QICoreModelInfo ([FHIR-30771](https://jira.hl7.org/browse/FHIR-30771))
1. **Applied**:Include US Core errata (3.1.1) to QI-Core Update process ([FHIR-31350](https://jira.hl7.org/browse/FHIR-31350))
1. **Applied**:Add MedicationDispense.whenPrepared MUST SUPPORT ([FHIR-31609](https://jira.hl7.org/browse/FHIR-31609))
1. **Applied**:Update QDM to QI-Core Mapping to address QDM 5.6 ([FHIR-31629](https://jira.hl7.org/browse/FHIR-31649))
1. **Applied**:Add guidance about use of references in profiles QI-Core inherits from US Core and FHIR ([FHIR-31738](https://jira.hl7.org/browse/FHIR-31738))
1. **Applied**:Update QDM to QI-Core mapping for ([FHIR-31740](https://jira.hl7.org/browse/FHIR-31740))
1. **Applied**:Profile Procedure NOT Done - why is element code not required ([FHIR-31929](https://jira.hl7.org/browse/FHIR-31929))
1. **Applied**:Procedure NOT Done - what is the intent of the valueset-reference in Code element ([FHIR-31930](https://jira.hl7.org/browse/FHIR-31930))
1. **Applied**:Procedure NOT Done - recorded does not have a clear description ([FHIR-31931](https://jira.hl7.org/browse/FHIR-31931))
1. **Applied**:Coverage.period shows in Differential but we cannot identify the change from FHIR Core ([FHIR-31932](https://jira.hl7.org/browse/FHIR-31932))
1. **Applied**:QI Core Observation.code binding is just example to LOINC ([FHIR-31933](https://jira.hl7.org/browse/FHIR-31933))
1. **Applied**:QI Core IG does not have a Table of Contents page ([FHIR-31935](https://jira.hl7.org/browse/FHIR-31935))
1. **Applied**:QDM to QI-Core mapping Section 8.1 correct text to QDM 5.6 ([FHIR-31974](https://jira.hl7.org/browse/FHIR-31974))
1. **Applied**:Adverse Event QDM-to-QI-Core mapping errata ([FHIR-31975](https://jira.hl7.org/browse/FHIR-31975))
1. **Applied**:QDM to Qi-Core mapping AllergyIntolerance ([FHIR-31976](https://jira.hl7.org/browse/FHIR-31976))
1. **Applied**:QDM to Qi-Core sections 8.4.1, 8.4.3 Assessment Order/Recommended ([FHIR-31977](https://jira.hl7.org/browse/FHIR-31977))
1. **Applied**:QDM to QI-Core mapping Communication, Performed ([FHIR-31978](https://jira.hl7.org/browse/FHIR-31978))
1. **Applied**:QDM to Qi-Core mapping for Device Order, Device Recommended ([FHIR-31979](https://jira.hl7.org/browse/FHIR-31979))
1. **Applied**:QDM to QI-Core mapping Diagnostic Study corrections ([FHIR-31980](https://jira.hl7.org/browse/FHIR-31980))
1. **Applied**:QDM to QI-Core mapping - Encounter ([FHIR-31981](https://jira.hl7.org/browse/FHIR-31981))
1. **Applied**:QDM to QI-Core mapping Immunization Administered status error ([FHIR-31982](https://jira.hl7.org/browse/FHIR-31982))
1. **Applied**:QDM to QI-Core mapping Intervention performed errors ([FHIR-31983](https://jira.hl7.org/browse/FHIR-31983))
1. **Applied**:QDM to QI-Core mapping Laboratory order and recommended error ([FHIR-31984](https://jira.hl7.org/browse/FHIR-31984))
1. **Applied**:QDM to QI-Core mapping Medication Administered error ([FHIR-31985](https://jira.hl7.org/browse/FHIR-31985))
1. **Applied**:QDM to QI-Core mapping Medication, Discharge error ([FHIR-31987](https://jira.hl7.org/browse/FHIR-31987))
1. **Applied**:QDM to QI-Core mapping update for Medication, Dispensed ([FHIR-31988](https://jira.hl7.org/browse/FHIR-31988))
1. **Applied**:QDM to QI-Core mapping Physical Exam Order and Recommended error ([FHIR-31989](https://jira.hl7.org/browse/FHIR-31989))
1. **Applied**:QDM to QI Core mapping changes for Procedure, Order, Procedure, Recommended and Procedure, Performed ([FHIR-31990](https://jira.hl7.org/browse/FHIR-31990))
1. **Applied**:QDM to QI-Core mapping - error in Immunization, Administered not done mapping ([FHIR-32005](https://jira.hl7.org/browse/FHIR-32005
1. **Applied**:QDM to QI-Core mapping for \"Medication, Order\" status constraints ([FHIR-32037](https://jira.hl7.org/browse/FHIR-32037
1. **Applied**:CommunicationNotDone code requires change in cardinality and modeling ([FHIR-32052](https://jira.hl7.org/browse/FHIR-32052))
1. **Applied**:DeviceRequestNotDone code binding and cardinality may require a specific slice for the eCQM use case ([FHIR-32053](https://jira.hl7.org/browse/FHIR-32053))
1. **Applied**:ImmunizationNotDone should allow indication an individual immunization was not performed and a slice to indicate none of the members of a value set was performed ([FHIR-32054](https://jira.hl7.org/browse/FHIR-32054))
1. **Applied**:MedicationNotAdministered requires ability to specify a single medication or an entire value set slice ([FHIR-32055](https://jira.hl7.org/browse/FHIR-32055))
1. **Applied**:MedicationNotDispensed should allow indication of a single medication not dispensed or a slice to indicate an entire value set was not dispensed ([FHIR-32056](https://jira.hl7.org/browse/FHIR-32056))
1. **Applied**:MedicationNotRequested should allow reference to a single medication not requested or a slice for a value set of all medications not requested ([FHIR-32057](https://jira.hl7.org/browse/FHIR-32057))
1. **Applied**:ObservationCancelled should allow reference to a single observation not performed or a slice for a value set for which none of the items were performed ([FHIR-32058](https://jira.hl7.org/browse/FHIR-32058))
1. **Applied**:ServiceNotRequested requires ability to specify a single service not requested or a slice for any one of a value set of services not requested ([FHIR-32059](https://jira.hl7.org/browse/FHIR-32059))
1. **Applied**:DiagnosticReportLab does not have Performer or Issued as Must Support even though the US Core Specification Does ([FHIR-32235](https://jira.hl7.org/browse/FHIR-32235))
1. **Applied**:How to reference TaskNotDone ([FHIR-32273](https://jira.hl7.org/browse/FHIR-32273))
1. **Applied**:Create QICorePresentOnAdmission value set ([FHIR-32378](https://jira.hl7.org/browse/FHIR-32378))
1. **Applied**:Add Must Support to Procedure.usedCode ([FHIR-32991](https://jira.hl7.org/browse/FHIR-32991))
1. **Applied**:Add Must Support for ServiceRequest.intent, MedicationRequest.intent, NutritionOrder.intent, NutritionOrder.status ([FHIR-33027](https://jira.hl7.org/browse/FHIR-33027))
1. **Applied**:Update identifiers throughout ([FHIR-33085](https://jira.hl7.org/browse/FHIR-33085))
1. **Applied**:Remove Authoring section ([FHIR-33260](https://jira.hl7.org/browse/FHIR-33260))
1. **Applied**:Removed negation-discerning status values from non-negation profiles ([FHIR-38788](https://jira.hl7.org/browse/FHIR-38788))
1. **Applied**:Changed TaskNotDone profile to TaskRejected throughout ([FHIR-38850](https://jira.hl7.org/browse/FHIR-38850))
1. **Applied**:Changed ObservationNotDone profile to ObservationCancelled throughout ([FHIR-38850](https://jira.hl7.org/browse/FHIR-38850))
1. **Applied**:Changed MedicationDispenseNotDone profile to MedicationDispenseDeclined throughout ([FHIR-38850](https://jira.hl7.org/browse/FHIR-38850))
1. **Applied**:Fixed title for negation rationale for Immunization, Administered in QDM to QI Core Mapping([FHIR-39307](https://jira.hl7.org/browse/FHIR-39307))
1. **Applied**:Fixed title for negation rationale for Laboratory Text, Order in QDM to QI Core Mapping([FHIR-39307](https://jira.hl7.org/browse/FHIR-39307))


1. #### The following tickets listed below were incorporated from the **US Core errata (3.1.1)**:
* Add guidance for representing patient name suffix and previous patient name to the US Core Patient Profile ([FHIR-28129](https://jira.hl7.org/browse/FHIR-28129))
* Correct copy/paste error in Goal Profile ([FHIR-28109](https://jira.hl7.org/browse/FHIR-28109))
* Correct US Core Provider Speciality (NUCC) ValueSet to hide abstract grouping codes ([FHIR-27975](https://jira.hl7.org/browse/FHIR-27975))
* Added example of US Core Direct Extension to Practitioner-2 Example ([FHIR-27947](https://jira.hl7.org/browse/FHIR-27947))
* Corrected technical errors in pediatric profiles StructureDefinitions ([FHIR-27946](https://jira.hl7.org/browse/FHIR-27946))
* Corrected errors in DiagnosticReport Cardiology Example ([FHIR-27913](https://jira.hl7.org/browse/FHIR-27913))
* Update Federal Register link for OMB race and ethnicity category classifications. ([FHIR-27907](https://jira.hl7.org/browse/FHIR-27907))
* Clarified token search syntax ([FHIR-27897](https://jira.hl7.org/browse/FHIR-27897))
* Corrected US Core DocumentReference Profile to support multiple attachments ([FHIR-25778](https://jira.hl7.org/browse/FHIR-25778))
* Fix FHIRPath Expression in USCoreGoalTargetDate ([FHIR-27892](https://jira.hl7.org/browse/FHIR-27892))
* Fix FHIRPath Expression in USCoreProcedureDate ([FHIR-27887](https://jira.hl7.org/browse/FHIR-27887))
* Add omitted ge comparators to SearchParameters ([FHIR-27893](https://jira.hl7.org/browse/FHIR-27893))
* Remove Must Support References to non US Core Profiles ([FHIR-27876](https://jira.hl7.org/browse/FHIR-27876))
* Add missing reaction to the US Core AllergyIntolerance Profile ([FHIR-27867](https://jira.hl7.org/browse/FHIR-27867))
* Clarify reference to US Core Patient in Vitals Signs Profiles ([FHIR-27857](https://jira.hl7.org/browse/FHIR-27857))
* Corrected US Core Pulse Oximetry Profile component.valueQuantity.code and component.valueQuantity.unit min from 0 to 1 to be consistent with the valueQuantity constraints within US Core ([FHIR-27846](https://jira.hl7.org/browse/FHIR-27846))
* Correct UCUM Unit in US Core Pulse Oximetry Profile Text Summary ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845))
* Update Procedure Codes Value Set to include ICD-10 PCS codes ([FHIR-27836](https://jira.hl7.org/browse/FHIR-27836))
* Update Procedure Codes Value Set to include CDT codes ([FHIR-27737](https://jira.hl7.org/browse/FHIR-27737))
* Clarify that pediatric vital sign percentile Observations should reference growth chart ([FHIR-27549](https://jira.hl7.org/browse/FHIR-27549))
* Added Missing US core Head Occipital-frontal Circumference Percentile Profile ([FHIR-27542](https://jira.hl7.org/browse/FHIR-27542))
* Correct requirements for supporting CLIA identifiers ([FHIR-27158](https://jira.hl7.org/browse/FHIR-27158))
* Change Description of ICD-10-PCS Value Set ([FHIR-27116](https://jira.hl7.org/browse/FHIR-27176))
* Correct AllergyIntolerance guidance for verificationStatus ([FHIR-27096](https://jira.hl7.org/browse/FHIR-27096))
* Fix example US Core heart-rate example ([FHIR-27086](https://jira.hl7.org/browse/FHIR-27086))
* Review period comments Update smoking status codes to align with USCDI ([FHIR-27082](https://jira.hl7.org/browse/FHIR-27082))
* Fix invariant provenance-1 ([FHIR-27065](https://jira.hl7.org/browse/FHIR-27065))
* Fix invalid json snippet ([FHIR-27001](https://jira.hl7.org/browse/FHIR-27001))
* Review period comments Remove Provenance requirement from Medication, Location, Practitioner, PractitionerRole, and Organization and correct copy and paste error to Medication and Provenance searchType support in CapabilityStatement ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)),([FHIR-28161](https://jira.hl7.org/browse/FHIR-28161))
* Correction on USCDI Table change MedicationStatement to MedicationRequest and remove references to MedicationStatement in the Medication Profile and CapabilityStatements ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840))
* Clarify that US Core Location/PractitionerRole are not being referenced by other resources ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840))
* Correct editing error restoring Write and Operation capability guidance into DocumentReference QuickStart ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840))
* Clarify guidance that servers SHALL support search with status if status required ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840))
* Correct canonical url for ImplementationGuide ([FHIR-26686](https://jira.hl7.org/browse/FHIR-26686))
* Correct system URI for ICD-10 procedure codes ([FHIR-26679](https://jira.hl7.org/browse/FHIR-26679))
* Fix invariant us-core-1 ([FHIR-26605](https://jira.hl7.org/browse/FHIR-26605))
* Change valueCode min from 0 to 1 for US Core Birth Sex Extension and valueBoolean min from 0 to 1 forUS Core Direct email Extension ([FHIR-26459](https://jira.hl7.org/browse/FHIR-26459))
* Change valueQuantity min from 1 to 0 for US Core Pediatric BMI for Age Observation Profile and US Core Pediatric Weight for Height Observation Profile ([FHIR-26363](https://jira.hl7.org/browse/FHIR-26363))
* Add page contents to Clinical Notes and Basic Provenance pages ([FHIR-25785](https://jira.hl7.org/browse/FHIR-25785))
* Fix duplicate URL causing validation failure. ([FHIR-25536](https://jira.hl7.org/browse/FHIR-25536))
* Fix Invariant us-core-8 ([FHIR-25459](https://jira.hl7.org/browse/FHIR-25459))
* Corrected the wording should support to shall support in Clinical Notes Guidance ([FHIR-25455](https://jira.hl7.org/browse/FHIR-25455))
* Fix Invariant us-core-8 to allow for Data Absent Reason Extension on Patient name.([FHIR-25249](https://jira.hl7.org/browse/FHIR-25249))
* Fix Link to LOINC LP29708-2 ([FHIR-25213](https://jira.hl7.org/browse/FHIR-25213))
* Corrected guidance for conveying Patient-Reported medications ([FHIR-25035](https://jira.hl7.org/browse/FHIR-25035))

### STU4 Release for FHIR R4 (v4.0.0)

STU 4 (v4.0.0)
* Created negation profiles
* Added patterns pages and CQL examples
* Corrections throughout
* Updated QDM-to-QI-Core mapping
* Added negation reason value set and bindings

### STU4 Ballot for FHIR R4 (v3.3.0)

STU 4 Ballot (v3.3.0)
* Updated profiles to be based on FHIR R4 and US Core STU 3
* #22645 Added profiles on Immunization and Evaluation
* #15012 Added a profile on NutritionOrder
* #20727 Updated Observation documentation to provide clarity on use of FHIR and US Core profiles
* #20610 Created the notDone extension and modified the DeviceUseStatement profile to use it; added the DeviceRequest profile, use the doNotPerform extension
* #22646 Relaxed Must Support requirement on some fields of Immunization and ImmunizationRecommendation profiles
* #14991 Added an example of using body position with an Observation

### STU3.2 Release for FHIR STU3 (v3.2.0)

STU 3.2 (v3.2.0)
* Updated profiles to be based on US Core 2.0.0
* Derived Encounter and PractitionerRole profiles from US Core profiles

### STU3 Release for FHIR STU3 (v3.1.0)

STU 3 (v3.1.0)
* Added profile for PractitionerRole and removed Practitioner.role extension
* Added profile for Task
* Established pattern for representing QDM Principal Diagnosis in Encounters
* Relaxed conformance requirements from all profiles to profiles that are relevant to a particular use case

### STU3 Ballot for FHIR STU3 (v2.1.0)

STU 3 Ballot (v3.0.0)
* Incorporates ballot reconciliation from all comments from the September 2016 ballot which have been applied to FHIR 3.0 and US Core Release 1.0.1
* Includes mapping to QDM Version 5.3 Annotated available at: https://ecqi.healthit.gov/qdm
* Includes an updated Mapping table from the QI-Core metadata to QDM 5.3
* Includes a direct mapping from QDM version 5.3 to QI Core

### STU2 Release for FHIR STU3 (v2.0.0)

STU 2 (v2.0.0)
* Updated to FHIR STU3 (3.0.1)
* Changed from Universal Realm to US Realm
* Derived from US Core profiles where possible
* Added support for Claim and Coverage resources
* Changed AdverseEvent profile to use the base resource
* Numerous typographical and technical errors corrected

### STU2 Ballot for FHIR STU3 Ballot (v1.6.0)

STU 2 Ballot
* Moved out of main FHIR publication package to its own home
* Updated QI-Core profiles for changes to underlying specification
* Added an additional profile on Condition
* The QUICK logical model is included

### STU1 Release for FHIR DSTU2 (v1.0.2)

DSTU 1 (Permanent home)

### DSTU1 Preview for FHIR STU1 (v1.0.0)"

DSTU1 Preview

### DSTU1 Ballot for FHIR STU1 (v0.5.0)

DSTU1 Ballot
