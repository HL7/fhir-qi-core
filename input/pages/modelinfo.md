{: toc}

{: #modelinfo}

Clinical Quality Language ([CQL](http://cql.hl7.org)) is a high-level, domain-specific language focused on clinical quality and targeted at clinical knowledge artifact authors such as quality measure and decision support artifact developers. In addition, the CQL specification provides a machine-readable canonical representation called Expression Logical Model ([ELM](https://cql.hl7.org/04-logicalspecification.html)) targeted at implementations and designed to enable automated sharing of clinical knowledge.

To use CQL with FHIR, [model information](https://cql.hl7.org/07-physicalrepresentation.html#data-model-references) must be provided to the implementation environment. The [CQF Common](http://fhir.org/guides/cqf/common) IG provides a FHIR-ModelInfo library that provides this information for the base FHIR specification, as well as FHIRHelpers and FHIRCommon libraries that provide commonly used functions and declarations for clinical knowledge artifact development. To use FHIR directly, follow the documentation provided in that implementation guide.

However, FHIR profiles include a wealth of computable information about the intended structure of the clinical data involved in an exchange, including terminology bindings, constraints, descriptive metadata, _slices_ and _extensions_. To facilitate authoring that can easily reference this information, tooling to construct ModelInfo for an implementation guide is available. This tooling was used to produce the [QICore-ModelInfo](Library-QICore-ModelInfo.html) included in this implementation guide, but can also be used to create model info for any implementation guide.

Complete documentation for this tooling is provided in the CQFramework github repository:

[https://github.com/cqframework/cqf-tooling/blob/master/tooling/src/main/java/org/opencds/cqf/tooling/modelinfo/StructureDefinitionToModelInfo.java#L45](https://github.com/cqframework/cqf-tooling/blob/master/tooling/src/main/java/org/opencds/cqf/tooling/modelinfo/StructureDefinitionToModelInfo.java#L45)

As an example, to generate the ModelInfo file for QICore version 5.0.0, the following arguments are used:

```
-GenerateMIs -ip=C:\Users\UserName\Documents\Src\HL7\FHIR-Spec -rp="4.0.1;US-Core/5.0.1;QI-Core/5.0.0" -mn=QICore -mv=5.0.0 -im=false -ucp=true
```

This tooling produces a ModelInfo xml document which can then be packaged in a Library resource for distribution as part of a FHIR ecosystem. See the [CQFMModelInfoLibrary](http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/modelinfo-library-cqfm) profile in the Quality Measure IG for more information.