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

### ios publish_ipa

```sh
[bundle exec] fastlane ios publish_ipa
```

Push a build to TestFlight

### ios build_release_project

```sh
[bundle exec] fastlane ios build_release_project
```

Build App for TestFlight - Project

### ios build_release_workspace

```sh
[bundle exec] fastlane ios build_release_workspace
```

Build App for TestFlight - Workspace

### ios build_release_workspace_multiple_targets

```sh
[bundle exec] fastlane ios build_release_workspace_multiple_targets
```



### ios build_release_multiple_targets

```sh
[bundle exec] fastlane ios build_release_multiple_targets
```



### ios prepare_signing

```sh
[bundle exec] fastlane ios prepare_signing
```

Loads provisioning profile

### ios prepare_signing_pat

```sh
[bundle exec] fastlane ios prepare_signing_pat
```

Loads provisioning profiles using PAT

### ios match_all

```sh
[bundle exec] fastlane ios match_all
```

Runs match for every app id / extension across all environments for the given type

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

### ios resign_ipa

```sh
[bundle exec] fastlane ios resign_ipa
```

Resign an existing IPA with a new profile and version

### ios list_signing_identities

```sh
[bundle exec] fastlane ios list_signing_identities
```

List available code signing identities in the keychain

### ios verify_signing_identity

```sh
[bundle exec] fastlane ios verify_signing_identity
```

Verify that a given signing identity exists

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
