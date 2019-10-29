# frozen_string_literal: true

require 'xcpretty/formatters/formatter'
require "xcpretty/formatters/simple"
require "fixtures/constants"

module XCPretty

    describe Simple do

      before(:each) do
        @formatter = Simple.new(false, false, false)
      end

      it "formats analyzing" do
        @formatter.format_analyze("CCChip8DisplayView.m", 'path/to/file', "foo").should ==
        "[foo] > Analyzing CCChip8DisplayView.m"
      end

      it "formats build target/project/configuration with target" do
        @formatter.format_build_target("The Spacer", "Pods", "Debug").should ==
        "> Building Pods/The Spacer [Debug]"
      end

      it "formats build target/project/configuration with target" do
        @formatter.format_aggregate_target("Be Aggro", "AggregateExample", "Debug").should ==
        "> Aggregate AggregateExample/Be Aggro [Debug]"
      end

      it "formats analyze target/project/configuration with target" do
        @formatter.format_analyze_target("The Spacer", "Pods", "Debug").should ==
        "> Analyzing Pods/The Spacer [Debug]"
      end

      it "formats clean target/project/configuration" do
        @formatter.format_clean_target("Pods-ObjectiveSugar", "Pods", "Debug").should ==
        "> Cleaning Pods/Pods-ObjectiveSugar [Debug]"
      end

      it 'formats compiler warnings' do
        warning = 'warning: stuff is broken'
        @formatter.format_warning(warning, 'foo').should == '[foo]     ' + warning
      end

      it "formats compiling output" do
        @formatter.format_compile("NSMutableArray+ObjectiveSugar.m", 'path/to/file', "foo").should ==
        "[foo] > Compiling NSMutableArray+ObjectiveSugar.m"
      end

      it "formats compiling swift sources" do
        @formatter.format_compile_swift_sources("SomeTarget").should ==
        "[SomeTarget] > Compiling Swift sources"
      end

      it "formats compiling swift to bytecode" do
        @formatter.format_compile_swift("SomeTarget").should ==
        "[SomeTarget] > Compiling Swift to bytecode"
      end

      it "formats precompiling swift bridging header" do
        @formatter.format_precompile_swift_bridging_header("SomeTarget").should ==
        "[SomeTarget] > Precompiling Swift bridging header"
      end

      it "formats swift code generation command" do
        @formatter.format_swift_code_generation_command("SomeFile.bc", "SomeTarget").should ==
        "[SomeTarget] > Generating object file from SomeFile.bc"
      end

      it "formats merging swift module" do
        @formatter.format_merge_swift_module_command("path/to/SomeModule.swiftmodule", "SomeTarget").should ==
        "[SomeTarget] > Merging Swift module SomeModule.swiftmodule"
      end

      it "formats copying swift libs to bundle" do
        @formatter.format_copy_swift_libs("SomeApp.app", "SomeTarget").should ==
        "[SomeTarget] > Copying Swift libs for SomeApp.app"
      end

      it "formats compiling metal output" do
        @formatter.format_compile("MYMetalFile.metal", 'path/to/file', "foo").should ==
        "[foo] > Compiling MYMetalFile.metal"
      end

      it "formats compiling xib output" do
        @formatter.format_compile_xib("MainMenu.xib", 'path/to/file', "foo").should ==
        "[foo] > Compiling MainMenu.xib"
      end

      it "formats compiling storyboard output" do
        @formatter.format_compile_xib("Main.storyboard", 'path/to/file', "foo").should ==
        "[foo] > Compiling Main.storyboard"
      end

      it "formats compiling asset catalog output" do
        @formatter.format_compile_asset_catalog("sample/Assets.xcassets", "foo").should ==
        "[foo] > Compiling asset catalog sample/Assets.xcassets"
      end

      it "formats sym link output" do
        @formatter.format_sym_link('someDir/Source.h',
                                   'dir/Destination.h',
                                   'foo').should == '[foo] > SymLink Source.h'
      end

      it "formats creating build directory output" do
        @formatter.format_create_build_directory(
          "/Users/bas.broek/Documents/GitHub/ios/third_party_dependencies/Pods/../build",
          "foo"
        ).should ==
        "[foo] > Creating build directory /Users/bas.broek/Documents/GitHub/ios/third_party_dependencies/Pods/../build"
      end

      it "formats mkdir output" do
        @formatter.format_mkdir(
          "OnePasswordExtension.framework",
          "foo"
        ).should ==
        "[foo] > Mkdir OnePasswordExtension.framework"
      end

      it "formats process product packaging output" do
        @formatter.format_process_product_packaging(
          "Foo.entitlements",
          "MobileApp.app",
          "foo"
        ).should ==
        "[foo] > Processing product packaging Foo.entitlements for app MobileApp.app"
      end

      it "formats ditto output" do
        @formatter.format_ditto(
          "/Users/devel/Library/Developer/Xcode/DerivedData/MobileApp-aaohjqrvwtifihalptrdzutcoadu/Build/Intermediates/MobileApp.build/Debug-iphoneos/Masonry\ iOS.build/module.modulemap",
          "/Users/devel/Library/Developer/Xcode/DerivedData/MobileApp-aaohjqrvwtifihalptrdzutcoadu/Build/Intermediates/MobileApp.framework/Modules/module.modulemap",
          "foo"
        ).should ==
        "[foo] > Ditto /Users/devel/Library/Developer/Xcode/DerivedData/MobileApp-aaohjqrvwtifihalptrdzutcoadu/Build/Intermediates/MobileApp.build/Debug-iphoneos/Masonry\ iOS.build/module.modulemap /Users/devel/Library/Developer/Xcode/DerivedData/MobileApp-aaohjqrvwtifihalptrdzutcoadu/Build/Intermediates/MobileApp.framework/Modules/module.modulemap"
      end

      it "formats compile DTrace script output" do
        @formatter.format_compile_dtrace_script("RACCompoundDisposableProvider.d", "foo").should ==
        "[foo] > Compiling DTrace script RACCompoundDisposableProvider.d"
      end

      it "formats copy PNG file output" do
        @formatter.format_copy_png_file(
          "/Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphoneos/MyTarget.bundle/IMAGE.PNG",
          "VideoEngineBundle/IMAGE.PNG",
          "foo"
        ).should ==
        "[foo] > Copying PNG file /Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphoneos/MyTarget.bundle/IMAGE.PNG"
      end

      it "formats copy TIFF file output" do
        @formatter.format_copy_tiff_file(
          "/Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphonesimulator/MobileApp.app/PlugIns/MobileAppTests.xctest/ImageCompressorInput.tiff",
          "MobileAppTests/Resources/ImageCompressorInput.tiff",
          "foo"
        ).should ==
        "[foo] > Copying TIFF file /Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphonesimulator/MobileApp.app/PlugIns/MobileAppTests.xctest/ImageCompressorInput.tiff"
      end

      it "formats link storyboards" do
        @formatter.format_link_storyboards("foo").should ==
        "[foo] > Linking storyboards"
      end

      it "formats note" do
        @formatter.format_note("detected encoding of input file as Unicode (UTF-8)").should ==
        "> Note: detected encoding of input file as Unicode (UTF-8)"
      end

      it "formats write auxiliary file" do
        @formatter.format_write_auxiliary_file("Specta.hmap", "foo").should ==
        "[foo] > Writing auxiliary file Specta.hmap"
      end

      it "formats processing" do
        @formatter.format_processing_file(
          "/Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphoneos/test_packageBundle/de.lproj/Localizable.strings",
          "foo"
        ).should ==
        "[foo] > Processing /Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphoneos/test_packageBundle/de.lproj/Localizable.strings"
      end

      it "formats signing identity" do
        @formatter.format_signing_identity("Foo").should ==
        "> Signing identity \"Foo\""
      end

      it "formats provisioning profile" do
        @formatter.format_provisioning_profile("Foo").should ==
          "> Provisioning profile \"Foo\""
      end

      it 'formats copying header files' do
        @formatter.format_copy_header_file('Source.h',
                                           'dir/Destination.h',
                                           'foo').should == '[foo] > Copying Source.h'
      end

      it 'formats copying plist files' do
        @formatter.format_copy_plist_file("Source.plist",
                                          'dir/Destination.plist',
                                          'foo').should == '[foo] > Copying Source.plist'
      end

      it "formats copy resource" do
        @formatter.format_cpresource("ObjectiveSugar/Default-568h@2x.png", "foo").should ==
        "[foo] > Copying ObjectiveSugar/Default-568h@2x.png"
      end

      it "formats Copy strings file" do
        @formatter.format_copy_strings_file("InfoPlist.strings", "foo").should ==
        "[foo] > Copying InfoPlist.strings"
      end

      it "formats GenerateDSYMFile" do
        @formatter.format_generate_dsym("ObjectiveSugarTests.octest.dSYM", "foo").should ==
        "[foo] > Generating 'ObjectiveSugarTests.octest.dSYM'"
      end

      it "formats info.plist processing" do
        @formatter.format_process_info_plist("The Spacer-Info.plist", "The Spacer/The Spacer-Info.plist", "foo").should ==
        "[foo] > Processing The Spacer-Info.plist"
      end

      it "formats Linking" do
        @formatter.format_linking("ObjectiveSugar", 'normal', 'i386', "foo").should ==
        "[foo] > Linking ObjectiveSugar"
      end

      it "formats metal Linking" do
        @formatter.format_linking_metal("default.metallib", "foo").should ==
        "[foo] > Linking default.metallib"
      end

      it "formats Libtool" do
        @formatter.format_libtool("libPods-ObjectiveSugarTests-Kiwi.a", "foo").should ==
        "[foo] > Building library libPods-ObjectiveSugarTests-Kiwi.a"
      end

      it "formats failing tests" do
        @formatter.format_failing_test("RACCommandSpec", "enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES", "expected: 1, got: 0", 'path/to/file').should ==
        "    x enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0"
      end

      it "formats passing tests" do
        @formatter.format_passing_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object", "0.001").should ==
        "    . _tupleByAddingObject__should_add_a_non_nil_object (0.001 seconds)"
      end

      it "formats pending tests" do
        @formatter.format_pending_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object").should ==
        "    P _tupleByAddingObject__should_add_a_non_nil_object [PENDING]"
      end

      it "formats measuring tests" do
        @formatter.format_measuring_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object", "0.001").should ==
        "    T _tupleByAddingObject__should_add_a_non_nil_object measured (0.001 seconds)"
      end

      it "formats build success output" do
        @formatter.format_phase_success("BUILD").should == "> Build Succeeded"
      end

      it "formats clean success output" do
        @formatter.format_phase_success("CLEAN").should == "> Clean Succeeded"
      end

      it "formats Phase Script Execution" do
        @formatter.format_phase_script_execution("Check Pods Manifest.lock", "foo").should ==
        "[foo] > Running script 'Check Pods Manifest.lock'"
      end

      it "formats script rule execution" do
        @formatter.format_script_rule_execution("Check Pods Manifest.lock", "folder/", "foo").should ==
        "[foo] > Running script rule Check Pods Manifest.lock"
      end

      it "formats precompiling C output" do
        @formatter.format_process_pch("C", "Pods-CocoaLumberjack-prefix.pch", "foo").should ==
        "[foo] > Precompiling C Pods-CocoaLumberjack-prefix.pch"
      end

      it "formats precompiling C++ output" do
        @formatter.format_process_pch("C++", "Pods-CocoaLumberjack-prefix.pch", "foo").should ==
          "[foo] > Precompiling C++ Pods-CocoaLumberjack-prefix.pch"
      end

      it "formats stripping" do
        @formatter.format_strip("build/Release/CocoaChip.app", "foo").should ==
        "[foo] > Stripping build/Release/CocoaChip.app"
      end

      it "formats chown" do
        @formatter.format_chown("jenkins:staff", "build/Release/CocoaChip.app", "foo").should ==
        "[foo] > chown jenkins:staff build/Release/CocoaChip.app"
      end

      it "formats chmod" do
        @formatter.format_chmod("u+w,go-w,a+rX", "build/Release/CocoaChip.app", "foo").should ==
        "[foo] > chmod u+w,go-w,a+rX build/Release/CocoaChip.app"
      end

      it "formats validating" do
        @formatter.format_validate("build/Release/CocoaChip.app", "foo").should ==
        "[foo] > Validating build/Release/CocoaChip.app"
      end

      it "formats code signing" do
        @formatter.format_codesign("build/Release/CocoaChip.app", "foo").should ==
        "[foo] > Signing build/Release/CocoaChip.app"
      end

      it "formats preprocessing a file" do
        @formatter.format_preprocess("CocoaChip/CocoaChip-Info.plist", "foo").should ==
        "[foo] > Preprocessing CocoaChip/CocoaChip-Info.plist"
      end

      it "formats PBXCp" do
        @formatter.format_pbxcp("build/Release/CocoaChipCore.framework", "foo").should ==
        "[foo] > Copying build/Release/CocoaChipCore.framework"
      end

      it "formats test run start" do
        @formatter.format_test_run_started("ReactiveCocoaTests.octest(Tests)").should ==
        "Test Suite ReactiveCocoaTests.octest(Tests) started"
      end

      it "formats tests suite started" do
        @formatter.format_test_suite_started("RACKVOWrapperSpec").should ==
        "RACKVOWrapperSpec"
      end

      it "formats Touch" do
        @formatter.format_touch("/path/to/SomeFile.txt", "SomeFile.txt", "foo").should ==
        "[foo] > Touching SomeFile.txt"
      end

      it "formats TiffUtil" do
        @formatter.format_tiffutil("unbelievable.tiff", "foo").should ==
        "[foo] > Validating unbelievable.tiff"
      end

      it 'formats Check Dependencies' do
        @formatter.format_check_dependencies.should ==
          '> Check Dependencies'
      end

    end
end
