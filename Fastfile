# This file contains the fastlane.tools configuration
# You can find the documentation at https://docs.fastlane.tools
#
# For a list of all available actions, check out
#
#     https://docs.fastlane.tools/actions
#
# For a list of all available plugins, check out
#
#     https://docs.fastlane.tools/plugins/available-plugins
#

# Uncomment the line if you want fastlane to automatically update itself
# update_fastlane

default_platform(:ios)

platform :ios do

  #
  # CD Lanes 
  #

  desc "Push a new beta build to TestFlight"
  lane :publish_app do |options|
    # setup release notes
    release_notes = options[:release_notes]
    contact_email = options[:contact_email]
    contact_first_name = options[:contact_first_name]
    contact_last_name = options[:contact_last_name]
    contact_phone = options[:contact_phone]
    demo_account_name = options[:demo_account_name]
    demo_account_password = options[:demo_account_password]

    # push to testflight
    upload_to_testflight(
      api_key_path: "./api_key.json",
      beta_app_review_info: {
        contact_email: contact_email,
        contact_first_name: contact_first_name,
        contact_last_name: contact_last_name,
        contact_phone: contact_phone,
        demo_account_name: demo_account_name,
        demo_account_password: demo_account_password,
      },
      changelog: release_notes
    )
  end

  desc "Build App for TestFlight - Project"
  lane :build_release_project do |options|
    
    # Load inputs
    project = options[:project]
    scheme = options[:scheme]
    keychain_password = options[:keychain_password]
    keychain_path = options[:keychain_path]
    app_id = options[:app_id]
    provisioning_profile = options[:provisioning_profile]
  
    # Unlock keychain
    unlock_keychain(
      path: keychain_path,
      password: keychain_password
    )

    # Build app with provisioning profile mapping
    build_app(
      project: project,
      scheme: scheme,
      export_method: "app-store",
      export_options: {
        provisioningProfiles: {
          app_id => provisioning_profile
        }
      }
    )
  end

  desc "Build App for TestFlight - Workspace"
  lane :build_release_workspace do |options|
    
    # Load inputs
    workspace = options[:workspace] # Optional
    scheme = options[:scheme]
    keychain_password = options[:keychain_password]
    keychain_path = options[:keychain_path]
    app_id = options[:app_id]
    provisioning_profile = options[:provisioning_profile]
  
    # Unlock keychain
    unlock_keychain(
      path: keychain_path,
      password: keychain_password
    )

    # Build app with provisioning profile mapping
    build_app(
      workspace: workspace,
      scheme: scheme,
      export_method: "app-store",
      export_options: {
        provisioningProfiles: {
          app_id => provisioning_profile
        }
      }
    )
  end

  lane :build_release_multiple_targets do |options|
    
    # Load inputs
    scheme = options[:scheme]
    keychain_password = options[:keychain_password]
    keychain_path = options[:keychain_path]
    app_id = options[:app_id]
    provisioning_profile = options[:provisioning_profile]
    extension_app_id = options[:extension_app_id]
    extension_provisioning_profile = options[:extension_provisioning_profile]
  
    # Unlock keychain
    unlock_keychain(
      path: keychain_path,
      password: keychain_password
    )

    # Build app with provisioning profile mapping
    build_app(
      scheme: scheme,
      export_method: "app-store",
      export_options: {
        provisioningProfiles: {
          app_id => provisioning_profile, 
          extension_app_id => extension_provisioning_profile
        }
      }
    )
  end

  desc "Loads provisioning profile"
  lane :prepare_signing do |options|
    # load keychain pwd
    git_url = options[:git_url]
    app_id = options[:app_id]
    # match requires EnvVar MATCH_PASSWORD
    match(app_identifier: [app_id], git_url: git_url)
  end

  desc "Sets the build_number to certain value"
  lane :set_build_number do |options|
    build_number = options[:build_number]
    project = options[:project]
    #set build number
    increment_build_number(xcodeproj: project, build_number: build_number)
  end
  
  desc "Sets the API KEY for Appstore Connect"
  lane :set_api_key do |options|
    api_key_value = options[:api_key_value]
    api_key_path = "./api_key.json"
    # Write the ENV variable content to the file
    File.open(api_key_path, "w") do |file|
      file.write(api_key_value)
    end
  end

  #
  # CI Lanes 
  #

  desc "Run Tests"
  lane :test_app do |options|
    workspace = options[:workspace]
    project = options[:project]
    scheme = options[:scheme]
    testplan = options[:testplan]
    # run tests
    run_tests(
      workspace: workspace,
      project: project, 
      scheme: scheme,
      testplan: testplan,
      clean: true,
      code_coverage: true,
      configuration: "Debug"
    )
  end 

  desc "Run swiftlint"
  lane :code_quality do 
    swiftlint(
      mode: :lint,                            
      ignore_exit_status: false,               
      quiet: true,                            
      strict: false                            
    )
  end

  desc "Run sonar"
  lane :run_sonar do |options|
    # load variables 
    project_key = options[:project_key]
    sonar_token = options[:sonar_token]
    sonar_url = options[:sonar_url]
    # run sonar 
    sonar(
      project_key: project_key,
      sonar_token: sonar_token,
      sonar_url: sonar_url
    )
  end

  desc "Generate codecoverage"
  lane :code_coverage do |options|
    project = options[:project]
    scheme = options[:scheme]
    coverage = options[:coverage]
    # run coverage report
    xcov(
      project: project,
      scheme: scheme,
      output_directory: "./Reports/Coverage",
      json_report: true, 
      minimum_coverage_percentage: coverage
    )
  end 
  
  desc "Resign an existing IPA with a new profile and version"
  lane :resign_ipa do |options|
    ipa_path         = options[:ipa_path]
    profile_path     = options[:profile_path]
    signing_identity = options[:signing_identity]
    new_version      = options[:new_version]

    UI.user_error!("ipa_path is required") unless ipa_path
    UI.user_error!("profile_path is required") unless profile_path
    UI.user_error!("signing_identity is required") unless signing_identity
    UI.user_error!("new_version is required") unless new_version

    UI.user_error!("ipa_path does not exist: #{ipa_path}") unless File.exist?(ipa_path)
    UI.user_error!("profile_path does not exist: #{profile_path}") unless File.exist?(profile_path)

    UI.message("Resigning IPA: #{ipa_path}")
    UI.message("Using provisioning profile: #{profile_path}")
    UI.message("Signing identity: #{signing_identity}")
    UI.message("New version: #{new_version}")

    # Ensure the signing identity exists before attempting to resign
    verify_signing_identity(signing_identity: signing_identity)

    resign(
      ipa: ipa_path,
      signing_identity: signing_identity,
      provisioning_profile: profile_path,
      version: new_version
    )

    UI.success("✅ Successfully resigned IPA at: #{ipa_path}")
  end

  desc "List available code signing identities in the keychain"
  lane :list_signing_identities do
    UI.message("Listing available code signing identities (Keychain):")
    output = sh("security find-identity -v -p codesigning || true")
    if output.to_s.strip.empty?
      UI.important("No code signing identities found. Make sure your certificates are installed in the login keychain.")
    else
      UI.message(output)
    end
  end

  desc "Verify that a given signing identity exists"
  lane :verify_signing_identity do |options|
    identity = options[:signing_identity]
    UI.user_error!("signing_identity is required") unless identity

    output = sh("security find-identity -v -p codesigning || true")
    lines = output.to_s.split("\n")
    found = lines.any? { |l| l.include?(identity) }

    unless found
      UI.user_error!("Signing identity not found: #{identity}\nRun 'fastlane ios list_signing_identities' to see available identities.")
    end

    UI.success("✅ Found signing identity: #{identity}")
  end
end
