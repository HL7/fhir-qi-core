
# Quality Improvement Core Profiles (QI-Core)
This repository contains the source for the QI-Core implementation guide, which defines a set of FHIR profiles and extensions for use in clinical quality measurement and decision support. The implementation guide is the result of a harmonization of data requirements between the Quality Data Model (QDM) and the virtual Medical Record (vMR).

The implementation guide is based on [FHIR version 4.0.0 (R4 release)](http://hl7.org/fhir/R4/index.html) and depends on the [US Core implementation guide (STU 3)](http://hl7.org/fhir/us/core/STU3/index.html).

Commits to this repository will automatically trigger a new build of the IG, which will then be published to the following location:

[http://build.fhir.org/ig/cqframework/qi-core](http://build.fhir.org/ig/cqframework/qi-core)

Build log is available here:

[http://ig-build.fhir.org.s3-website-us-east-1.amazonaws.com/logs/cqframework/qi-core/](http://ig-build.fhir.org.s3-website-us-east-1.amazonaws.com/logs/cqframework/qi-core/)

Full debugging information is available here:

[http://build.fhir.org/ig/cqframework/qi-core/debug.tgz](http://build.fhir.org/ig/cqframework/qi-core/debug.tgz)

## Local Build

The HL7 IG Publisher is committed to this repository to make building as easy as possible. To build locally, clone the repository and issue the following command in the root:

    java -jar "org.hl7.fhir.publisher.jar" -ig ig.json

The latest version of the IG publisher is available here:

[https://github.com/FHIR/latest-ig-publisher/raw/master/org.hl7.fhir.publisher.jar](https://github.com/FHIR/latest-ig-publisher/raw/master/org.hl7.fhir.publisher.jar)

