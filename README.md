fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios publish_app

```sh
[bundle exec] fastlane ios publish_app
```

Push a new beta build to TestFlight

### ios build_release

```sh
[bundle exec] fastlane ios build_release
```

Build App for TestFlight

### ios prepare_signing

```sh
[bundle exec] fastlane ios prepare_signing
```

Loads provisioning profile

### ios set_build_number

```sh
[bundle exec] fastlane ios set_build_number
```

Sets the build_number to certain value

### ios set_api_key

```sh
[bundle exec] fastlane ios set_api_key
```

Sets the API KEY for Appstore Connect

### ios test_app

```sh
[bundle exec] fastlane ios test_app
```

Run Tests

### ios code_quality

```sh
[bundle exec] fastlane ios code_quality
```

Run swiftlint

### ios run_sonar

```sh
[bundle exec] fastlane ios run_sonar
```

Run sonar

### ios code_coverage

```sh
[bundle exec] fastlane ios code_coverage
```

Generate codecoverage

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
