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

  desc "Build App for TestFlight"
  lane :build_release do |options|
    
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
    workspace = options[:workspace] # Optional
    scheme = options[:scheme]
    keychain_password = options[:keychain_password]
    keychain_path = options[:keychain_path]
    provisioning_profiles = eval(options[:provisioning_profiles]) # Ex: { "com.example.app" => "AppProfile", "com.example.app.NotificationService" => "NotificationProfile" }

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
        provisioningProfiles: provisioning_profiles
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
end