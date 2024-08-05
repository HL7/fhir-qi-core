
# Quality Improvement Core Profiles (QI-Core)
This repository contains the source for the QI-Core implementation guide, which defines a set of FHIR profiles and extensions for use in clinical quality measurement and decision support. The implementation guide is the result of a harmonization of data requirements between the Quality Data Model (QDM) and the virtual Medical Record (vMR).

The implementation guide is based on [FHIR version 4.0.1 (R4 release)](http://hl7.org/fhir/R4/index.html) and depends on the [US Core implementation guide (STU 7)](http://hl7.org/fhir/us/core/).

Commits to this repository will automatically trigger a new build of the IG, which will then be published to the following location:

[http://build.fhir.org/ig/HL7/fhir-qi-core](http://build.fhir.org/ig/HL7/fhir-qi-core)

Build log is available here:

[http://ig-build.fhir.org.s3-website-us-east-1.amazonaws.com/logs/HL7/fhir-qi-core/](http://ig-build.fhir.org.s3-website-us-east-1.amazonaws.com/logs/HL7/fhir-qi-core/)

Full debugging information is available here:

[http://build.fhir.org/ig/HL7/fhir-qi-core/debug.tgz](http://build.fhir.org/ig/HL7/fhir-qi-core/debug.tgz)

## Local Build

To initially build locally, clone the repository and run the following commands in order below in the root command:

  1. **_updatePublisher[.bat | .sh]** - <i>Process retrieves the current version of the IG publisher and stores it within the input-cache folder. The IG publisher is updated on a regular basis but this process does not have to be executed for every instance of the publication process.</i>

  2. **_genonce[.bat | .sh]** - <i>This initiates the publication process. Launching the .bat file (Windows) or .sh file (Unix/Mac) will launch HL7's IGPublisher program and build/publish the IG one time.</i>


## Dependencies

Before the instructions in the above "Local Build" section will work, you
need to install several primary dependencies.

### Java

Go to [http://www.oracle.com/technetwork/java/javase/downloads/](
http://www.oracle.com/technetwork/java/javase/downloads/) and download the
latest (version 8 or higher) JDK for your platform, and install it.

### Ruby

Jekyll requires Ruby version 2.1 or greater.  Depending on your operating
system, you may already have Ruby bundled with it.  Otherwise, or if you
need a newer version, go to [https://www.ruby-lang.org/en/downloads/](
https://www.ruby-lang.org/en/downloads/) for directions.

### Jekyll

Go to [https://jekyllrb.com](https://jekyllrb.com) and follow the
instructions there, for example `gem install jekyll bundler`.  The end
result of this should be that the binary "jekyll" is now in your path.

The latest version of the IG publisher is available here:

[https://github.com/FHIR/latest-ig-publisher/raw/master/org.hl7.fhir.publisher.jar](https://github.com/FHIR/latest-ig-publisher/raw/master/org.hl7.fhir.publisher.jar)
