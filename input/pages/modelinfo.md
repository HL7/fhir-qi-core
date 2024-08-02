{: toc}

{: #modelinfo}

To support implementations using Clinical Quality Language (CQL) and QI-Core, [model information](https://cql.hl7.org/07-physicalrepresentation.html#data-model-references) for this IG is provided in conformance with Using ModelInfo in the Using CQL with FHIR IG.  
This implementation guide includes a QICore Model Definition [(QICore ModelInfo Library)](Library-QICore-ModelInfo.html) library that provides model information for the profiles and extensions defined in QI-Core. To use the QICore model, include a using declaration as shown in the example below:
```cql
using QICore version '7.0.0'
```
Although not required by CQL, current best-practice is to include the version of the QICore model. For more information about how this library is constructed, refer to the [Using ModelInfo topic in the Using CQL with FHIR IG](https://hl7.org/fhir/uv/cql/using-modelinfo.html).


Complete documentation for this tooling is provided in the CQFramework github repository:

[https://github.com/cqframework/cqf-tooling/blob/23c5f8b12b79cf1036c3d813a2dffe22d44c355b/tooling/src/main/java/org/opencds/cqf/tooling/modelinfo/StructureDefinitionToModelInfo.java#L45](https://github.com/cqframework/cqf-tooling/blob/23c5f8b12b79cf1036c3d813a2dffe22d44c355b/tooling/src/main/java/org/opencds/cqf/tooling/modelinfo/StructureDefinitionToModelInfo.java#L45)

As an example, to generate the ModelInfo file for QICore version 7.0.0, the following arguments are used:

```
-GenerateMIs -ip=C:\Users\UserName\Documents\Src\HL7\FHIR-Spec -rp="4.0.1;US-Core/7.0.0;QI-Core/7.0.0" -mn=QICore -mv=7.0.0 -im=false -ucp=true
```


