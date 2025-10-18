#!/usr/bin/env python3
"""
Generate a minimal Xcode project with UI testing support for Cropper.
This script creates an Xcode project structure that can be built with xcodebuild.
"""

import os
import uuid

def generate_uuid():
    """Generate a unique ID for Xcode project elements."""
    return ''.join(str(uuid.uuid4()).split('-')[:3]).upper()

def create_xcode_project():
    """Create a minimal Xcode project with app and UI test targets."""
    
    # Generate unique IDs for various project elements
    ids = {
        'project': generate_uuid(),
        'app_target': generate_uuid(),
        'uitest_target': generate_uuid(),
        'app_group': generate_uuid(),
        'uitest_group': generate_uuid(),
        'products_group': generate_uuid(),
        'sources_group': generate_uuid(),
        'app_product': generate_uuid(),
        'uitest_product': generate_uuid(),
        'info_plist': generate_uuid(),
        
        # Source files
        'app_delegate': generate_uuid(),
        'cropper_app': generate_uuid(),
        'view_controller': generate_uuid(),
        'image_window': generate_uuid(),
        'ui_test': generate_uuid(),
        
        # Build phases
        'app_sources': generate_uuid(),
        'app_frameworks': generate_uuid(),
        'app_resources': generate_uuid(),
        'uitest_sources': generate_uuid(),
        'uitest_frameworks': generate_uuid(),
        'uitest_resources': generate_uuid(),
        
        # Build configurations
        'project_debug': generate_uuid(),
        'project_release': generate_uuid(),
        'app_debug': generate_uuid(),
        'app_release': generate_uuid(),
        'uitest_debug': generate_uuid(),
        'uitest_release': generate_uuid(),
        
        # Config lists
        'project_configs': generate_uuid(),
        'app_configs': generate_uuid(),
        'uitest_configs': generate_uuid(),
        
        # Target dependency
        'target_dependency': generate_uuid(),
        'container_proxy': generate_uuid(),
        
        # Build file references
        'build_app_delegate': generate_uuid(),
        'build_cropper_app': generate_uuid(),
        'build_view_controller': generate_uuid(),
        'build_image_window': generate_uuid(),
        'build_ui_test': generate_uuid(),
    }
    
    project_content = f'''// !$*UTF8*$!
{{
\tarchiveVersion = 1;
\tclasses = {{
\t}};
\tobjectVersion = 56;
\tobjects = {{

/* Begin PBXBuildFile section */
\t\t{ids['build_app_delegate']} /* AppDelegate.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {ids['app_delegate']} /* AppDelegate.swift */; }};
\t\t{ids['build_cropper_app']} /* CropperApp.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {ids['cropper_app']} /* CropperApp.swift */; }};
\t\t{ids['build_view_controller']} /* ViewController.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {ids['view_controller']} /* ViewController.swift */; }};
\t\t{ids['build_image_window']} /* ImageWindowController.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {ids['image_window']} /* ImageWindowController.swift */; }};
\t\t{ids['build_ui_test']} /* CropperUITests.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {ids['ui_test']} /* CropperUITests.swift */; }};
/* End PBXBuildFile section */

/* Begin PBXContainerItemProxy section */
\t\t{ids['container_proxy']} /* PBXContainerItemProxy */ = {{
\t\t\tisa = PBXContainerItemProxy;
\t\t\tcontainerPortal = {ids['project']} /* Project object */;
\t\t\tproxyType = 1;
\t\t\tremoteGlobalIDString = {ids['app_target']};
\t\t\tremoteInfo = Cropper;
\t\t}};
/* End PBXContainerItemProxy section */

/* Begin PBXFileReference section */
\t\t{ids['app_delegate']} /* AppDelegate.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppDelegate.swift; sourceTree = "<group>"; }};
\t\t{ids['cropper_app']} /* CropperApp.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = CropperApp.swift; sourceTree = "<group>"; }};
\t\t{ids['view_controller']} /* ViewController.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ViewController.swift; sourceTree = "<group>"; }};
\t\t{ids['image_window']} /* ImageWindowController.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ImageWindowController.swift; sourceTree = "<group>"; }};
\t\t{ids['ui_test']} /* CropperUITests.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = CropperUITests.swift; sourceTree = "<group>"; }};
\t\t{ids['info_plist']} /* Info.plist */ = {{isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = Info.plist; sourceTree = "<group>"; }};
\t\t{ids['app_product']} /* Cropper.app */ = {{isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = Cropper.app; sourceTree = BUILT_PRODUCTS_DIR; }};
\t\t{ids['uitest_product']} /* CropperUITests.xctest */ = {{isa = PBXFileReference; explicitFileType = wrapper.cfbundle; includeInIndex = 0; path = CropperUITests.xctest; sourceTree = BUILT_PRODUCTS_DIR; }};
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
\t\t{ids['app_frameworks']} /* Frameworks */ = {{
\t\t\tisa = PBXFrameworksBuildPhase;
\t\t\tbuildActionMask = 2147483647;
\t\t\tfiles = (
\t\t\t);
\t\t\trunOnlyForDeploymentPostprocessing = 0;
\t\t}};
\t\t{ids['uitest_frameworks']} /* Frameworks */ = {{
\t\t\tisa = PBXFrameworksBuildPhase;
\t\t\tbuildActionMask = 2147483647;
\t\t\tfiles = (
\t\t\t);
\t\t\trunOnlyForDeploymentPostprocessing = 0;
\t\t}};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
\t\t{ids['app_group']} = {{
\t\t\tisa = PBXGroup;
\t\t\tchildren = (
\t\t\t\t{ids['sources_group']} /* Sources */,
\t\t\t\t{ids['uitest_group']} /* CropperUITests */,
\t\t\t\t{ids['products_group']} /* Products */,
\t\t\t\t{ids['info_plist']} /* Info.plist */,
\t\t\t);
\t\t\tsourceTree = "<group>";
\t\t}};
\t\t{ids['sources_group']} /* Sources */ = {{
\t\t\tisa = PBXGroup;
\t\t\tchildren = (
\t\t\t\t{ids['app_delegate']} /* AppDelegate.swift */,
\t\t\t\t{ids['cropper_app']} /* CropperApp.swift */,
\t\t\t\t{ids['view_controller']} /* ViewController.swift */,
\t\t\t\t{ids['image_window']} /* ImageWindowController.swift */,
\t\t\t);
\t\t\tpath = Sources;
\t\t\tsourceTree = "<group>";
\t\t}};
\t\t{ids['uitest_group']} /* CropperUITests */ = {{
\t\t\tisa = PBXGroup;
\t\t\tchildren = (
\t\t\t\t{ids['ui_test']} /* CropperUITests.swift */,
\t\t\t);
\t\t\tpath = CropperUITests;
\t\t\tsourceTree = "<group>";
\t\t}};
\t\t{ids['products_group']} /* Products */ = {{
\t\t\tisa = PBXGroup;
\t\t\tchildren = (
\t\t\t\t{ids['app_product']} /* Cropper.app */,
\t\t\t\t{ids['uitest_product']} /* CropperUITests.xctest */,
\t\t\t);
\t\t\tname = Products;
\t\t\tsourceTree = "<group>";
\t\t}};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
\t\t{ids['app_target']} /* Cropper */ = {{
\t\t\tisa = PBXNativeTarget;
\t\t\tbuildConfigurationList = {ids['app_configs']} /* Build configuration list for PBXNativeTarget "Cropper" */;
\t\t\tbuildPhases = (
\t\t\t\t{ids['app_sources']} /* Sources */,
\t\t\t\t{ids['app_frameworks']} /* Frameworks */,
\t\t\t\t{ids['app_resources']} /* Resources */,
\t\t\t);
\t\t\tbuildRules = (
\t\t\t);
\t\t\tdependencies = (
\t\t\t);
\t\t\tname = Cropper;
\t\t\tproductName = Cropper;
\t\t\tproductReference = {ids['app_product']} /* Cropper.app */;
\t\t\tproductType = "com.apple.product-type.application";
\t\t}};
\t\t{ids['uitest_target']} /* CropperUITests */ = {{
\t\t\tisa = PBXNativeTarget;
\t\t\tbuildConfigurationList = {ids['uitest_configs']} /* Build configuration list for PBXNativeTarget "CropperUITests" */;
\t\t\tbuildPhases = (
\t\t\t\t{ids['uitest_sources']} /* Sources */,
\t\t\t\t{ids['uitest_frameworks']} /* Frameworks */,
\t\t\t\t{ids['uitest_resources']} /* Resources */,
\t\t\t);
\t\t\tbuildRules = (
\t\t\t);
\t\t\tdependencies = (
\t\t\t\t{ids['target_dependency']} /* PBXTargetDependency */,
\t\t\t);
\t\t\tname = CropperUITests;
\t\t\tproductName = CropperUITests;
\t\t\tproductReference = {ids['uitest_product']} /* CropperUITests.xctest */;
\t\t\tproductType = "com.apple.product-type.bundle.ui-testing";
\t\t}};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
\t\t{ids['project']} /* Project object */ = {{
\t\t\tisa = PBXProject;
\t\t\tattributes = {{
\t\t\t\tBuildIndependentTargetsInParallel = 1;
\t\t\t\tLastSwiftUpdateCheck = 1500;
\t\t\t\tLastUpgradeCheck = 1500;
\t\t\t\tTargetAttributes = {{
\t\t\t\t\t{ids['app_target']} = {{
\t\t\t\t\t\tCreatedOnToolsVersion = 15.0;
\t\t\t\t\t}};
\t\t\t\t\t{ids['uitest_target']} = {{
\t\t\t\t\t\tCreatedOnToolsVersion = 15.0;
\t\t\t\t\t\tTestTargetID = {ids['app_target']};
\t\t\t\t\t}};
\t\t\t\t}};
\t\t\t}};
\t\t\tbuildConfigurationList = {ids['project_configs']} /* Build configuration list for PBXProject "Cropper" */;
\t\t\tcompatibilityVersion = "Xcode 14.0";
\t\t\tdevelopmentRegion = en;
\t\t\thasScannedForEncodings = 0;
\t\t\tknownRegions = (
\t\t\t\ten,
\t\t\t\tBase,
\t\t\t);
\t\t\tmainGroup = {ids['app_group']};
\t\t\tproductRefGroup = {ids['products_group']} /* Products */;
\t\t\tprojectDirPath = "";
\t\t\tprojectRoot = "";
\t\t\ttargets = (
\t\t\t\t{ids['app_target']} /* Cropper */,
\t\t\t\t{ids['uitest_target']} /* CropperUITests */,
\t\t\t);
\t\t}};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
\t\t{ids['app_resources']} /* Resources */ = {{
\t\t\tisa = PBXResourcesBuildPhase;
\t\t\tbuildActionMask = 2147483647;
\t\t\tfiles = (
\t\t\t);
\t\t\trunOnlyForDeploymentPostprocessing = 0;
\t\t}};
\t\t{ids['uitest_resources']} /* Resources */ = {{
\t\t\tisa = PBXResourcesBuildPhase;
\t\t\tbuildActionMask = 2147483647;
\t\t\tfiles = (
\t\t\t);
\t\t\trunOnlyForDeploymentPostprocessing = 0;
\t\t}};
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
\t\t{ids['app_sources']} /* Sources */ = {{
\t\t\tisa = PBXSourcesBuildPhase;
\t\t\tbuildActionMask = 2147483647;
\t\t\tfiles = (
\t\t\t\t{ids['build_app_delegate']} /* AppDelegate.swift in Sources */,
\t\t\t\t{ids['build_cropper_app']} /* CropperApp.swift in Sources */,
\t\t\t\t{ids['build_view_controller']} /* ViewController.swift in Sources */,
\t\t\t\t{ids['build_image_window']} /* ImageWindowController.swift in Sources */,
\t\t\t);
\t\t\trunOnlyForDeploymentPostprocessing = 0;
\t\t}};
\t\t{ids['uitest_sources']} /* Sources */ = {{
\t\t\tisa = PBXSourcesBuildPhase;
\t\t\tbuildActionMask = 2147483647;
\t\t\tfiles = (
\t\t\t\t{ids['build_ui_test']} /* CropperUITests.swift in Sources */,
\t\t\t);
\t\t\trunOnlyForDeploymentPostprocessing = 0;
\t\t}};
/* End PBXSourcesBuildPhase section */

/* Begin PBXTargetDependency section */
\t\t{ids['target_dependency']} /* PBXTargetDependency */ = {{
\t\t\tisa = PBXTargetDependency;
\t\t\ttarget = {ids['app_target']} /* Cropper */;
\t\t\ttargetProxy = {ids['container_proxy']} /* PBXContainerItemProxy */;
\t\t}};
/* End PBXTargetDependency section */

/* Begin XCBuildConfiguration section */
\t\t{ids['project_debug']} /* Debug */ = {{
\t\t\tisa = XCBuildConfiguration;
\t\t\tbuildSettings = {{
\t\t\t\tALWAYS_SEARCH_USER_PATHS = NO;
\t\t\t\tCLANG_ANALYZER_NONNULL = YES;
\t\t\t\tCLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
\t\t\t\tCLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
\t\t\t\tCLANG_ENABLE_MODULES = YES;
\t\t\t\tCLANG_ENABLE_OBJC_ARC = YES;
\t\t\t\tCLANG_ENABLE_OBJC_WEAK = YES;
\t\t\t\tCLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
\t\t\t\tCLANG_WARN_BOOL_CONVERSION = YES;
\t\t\t\tCLANG_WARN_COMMA = YES;
\t\t\t\tCLANG_WARN_CONSTANT_CONVERSION = YES;
\t\t\t\tCLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
\t\t\t\tCLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
\t\t\t\tCLANG_WARN_DOCUMENTATION_COMMENTS = YES;
\t\t\t\tCLANG_WARN_EMPTY_BODY = YES;
\t\t\t\tCLANG_WARN_ENUM_CONVERSION = YES;
\t\t\t\tCLANG_WARN_INFINITE_RECURSION = YES;
\t\t\t\tCLANG_WARN_INT_CONVERSION = YES;
\t\t\t\tCLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
\t\t\t\tCLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
\t\t\t\tCLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
\t\t\t\tCLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
\t\t\t\tCLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
\t\t\t\tCLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
\t\t\t\tCLANG_WARN_STRICT_PROTOTYPES = YES;
\t\t\t\tCLANG_WARN_SUSPICIOUS_MOVE = YES;
\t\t\t\tCLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
\t\t\t\tCLANG_WARN_UNREACHABLE_CODE = YES;
\t\t\t\tCLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
\t\t\t\tCOPY_PHASE_STRIP = NO;
\t\t\t\tDEBUG_INFORMATION_FORMAT = dwarf;
\t\t\t\tENABLE_STRICT_OBJC_MSGSEND = YES;
\t\t\t\tENABLE_TESTABILITY = YES;
\t\t\t\tGCC_C_LANGUAGE_STANDARD = gnu17;
\t\t\t\tGCC_DYNAMIC_NO_PIC = NO;
\t\t\t\tGCC_NO_COMMON_BLOCKS = YES;
\t\t\t\tGCC_OPTIMIZATION_LEVEL = 0;
\t\t\t\tGCC_PREPROCESSOR_DEFINITIONS = (
\t\t\t\t\t"DEBUG=1",
\t\t\t\t\t"$(inherited)",
\t\t\t\t);
\t\t\t\tGCC_WARN_64_TO_32_BIT_CONVERSION = YES;
\t\t\t\tGCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
\t\t\t\tGCC_WARN_UNDECLARED_SELECTOR = YES;
\t\t\t\tGCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
\t\t\t\tGCC_WARN_UNUSED_FUNCTION = YES;
\t\t\t\tGCC_WARN_UNUSED_VARIABLE = YES;
\t\t\t\tMACOSX_DEPLOYMENT_TARGET = 13.0;
\t\t\t\tMTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
\t\t\t\tMTL_FAST_MATH = YES;
\t\t\t\tONLY_ACTIVE_ARCH = YES;
\t\t\t\tSDKROOT = macosx;
\t\t\t\tSWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG $(inherited)";
\t\t\t\tSWIFT_OPTIMIZATION_LEVEL = "-Onone";
\t\t\t\tSWIFT_VERSION = 6.0;
\t\t\t}};
\t\t\tname = Debug;
\t\t}};
\t\t{ids['project_release']} /* Release */ = {{
\t\t\tisa = XCBuildConfiguration;
\t\t\tbuildSettings = {{
\t\t\t\tALWAYS_SEARCH_USER_PATHS = NO;
\t\t\t\tCLANG_ANALYZER_NONNULL = YES;
\t\t\t\tCLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
\t\t\t\tCLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
\t\t\t\tCLANG_ENABLE_MODULES = YES;
\t\t\t\tCLANG_ENABLE_OBJC_ARC = YES;
\t\t\t\tCLANG_ENABLE_OBJC_WEAK = YES;
\t\t\t\tCLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
\t\t\t\tCLANG_WARN_BOOL_CONVERSION = YES;
\t\t\t\tCLANG_WARN_COMMA = YES;
\t\t\t\tCLANG_WARN_CONSTANT_CONVERSION = YES;
\t\t\t\tCLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
\t\t\t\tCLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
\t\t\t\tCLANG_WARN_DOCUMENTATION_COMMENTS = YES;
\t\t\t\tCLANG_WARN_EMPTY_BODY = YES;
\t\t\t\tCLANG_WARN_ENUM_CONVERSION = YES;
\t\t\t\tCLANG_WARN_INFINITE_RECURSION = YES;
\t\t\t\tCLANG_WARN_INT_CONVERSION = YES;
\t\t\t\tCLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
\t\t\t\tCLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
\t\t\t\tCLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
\t\t\t\tCLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
\t\t\t\tCLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
\t\t\t\tCLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
\t\t\t\tCLANG_WARN_STRICT_PROTOTYPES = YES;
\t\t\t\tCLANG_WARN_SUSPICIOUS_MOVE = YES;
\t\t\t\tCLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
\t\t\t\tCLANG_WARN_UNREACHABLE_CODE = YES;
\t\t\t\tCLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
\t\t\t\tCOPY_PHASE_STRIP = NO;
\t\t\t\tDEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
\t\t\t\tENABLE_NS_ASSERTIONS = NO;
\t\t\t\tENABLE_STRICT_OBJC_MSGSEND = YES;
\t\t\t\tGCC_C_LANGUAGE_STANDARD = gnu17;
\t\t\t\tGCC_NO_COMMON_BLOCKS = YES;
\t\t\t\tGCC_WARN_64_TO_32_BIT_CONVERSION = YES;
\t\t\t\tGCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
\t\t\t\tGCC_WARN_UNDECLARED_SELECTOR = YES;
\t\t\t\tGCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
\t\t\t\tGCC_WARN_UNUSED_FUNCTION = YES;
\t\t\t\tGCC_WARN_UNUSED_VARIABLE = YES;
\t\t\t\tMACOSX_DEPLOYMENT_TARGET = 13.0;
\t\t\t\tMTL_ENABLE_DEBUG_INFO = NO;
\t\t\t\tMTL_FAST_MATH = YES;
\t\t\t\tSDKROOT = macosx;
\t\t\t\tSWIFT_COMPILATION_MODE = wholemodule;
\t\t\t\tSWIFT_VERSION = 6.0;
\t\t\t}};
\t\t\tname = Release;
\t\t}};
\t\t{ids['app_debug']} /* Debug */ = {{
\t\t\tisa = XCBuildConfiguration;
\t\t\tbuildSettings = {{
\t\t\t\tCODE_SIGN_STYLE = Automatic;
\t\t\t\tCOMBINE_HIDPI_IMAGES = YES;
\t\t\t\tCURRENT_PROJECT_VERSION = 1;
\t\t\t\tGENERATE_INFOPLIST_FILE = NO;
\t\t\t\tINFOPLIST_FILE = Info.plist;
\t\t\t\tINFOPLIST_KEY_NSHumanReadableCopyright = "Copyright 2025 Elliotte Rusty Harold. All rights reserved.";
\t\t\t\tINFOPLIST_KEY_NSMainStoryboardFile = "";
\t\t\t\tINFOPLIST_KEY_NSPrincipalClass = NSApplication;
\t\t\t\tLD_RUNPATH_SEARCH_PATHS = (
\t\t\t\t\t"$(inherited)",
\t\t\t\t\t"@executable_path/../Frameworks",
\t\t\t\t);
\t\t\t\tMARKETING_VERSION = 1.0;
\t\t\t\tPRODUCT_BUNDLE_IDENTIFIER = com.elharo.cropper;
\t\t\t\tPRODUCT_NAME = "$(TARGET_NAME)";
\t\t\t\tSWIFT_EMIT_LOC_STRINGS = YES;
\t\t\t\tSWIFT_VERSION = 6.0;
\t\t\t}};
\t\t\tname = Debug;
\t\t}};
\t\t{ids['app_release']} /* Release */ = {{
\t\t\tisa = XCBuildConfiguration;
\t\t\tbuildSettings = {{
\t\t\t\tCODE_SIGN_STYLE = Automatic;
\t\t\t\tCOMBINE_HIDPI_IMAGES = YES;
\t\t\t\tCURRENT_PROJECT_VERSION = 1;
\t\t\t\tGENERATE_INFOPLIST_FILE = NO;
\t\t\t\tINFOPLIST_FILE = Info.plist;
\t\t\t\tINFOPLIST_KEY_NSHumanReadableCopyright = "Copyright 2025 Elliotte Rusty Harold. All rights reserved.";
\t\t\t\tINFOPLIST_KEY_NSMainStoryboardFile = "";
\t\t\t\tINFOPLIST_KEY_NSPrincipalClass = NSApplication;
\t\t\t\tLD_RUNPATH_SEARCH_PATHS = (
\t\t\t\t\t"$(inherited)",
\t\t\t\t\t"@executable_path/../Frameworks",
\t\t\t\t);
\t\t\t\tMARKETING_VERSION = 1.0;
\t\t\t\tPRODUCT_BUNDLE_IDENTIFIER = com.elharo.cropper;
\t\t\t\tPRODUCT_NAME = "$(TARGET_NAME)";
\t\t\t\tSWIFT_EMIT_LOC_STRINGS = YES;
\t\t\t\tSWIFT_VERSION = 6.0;
\t\t\t}};
\t\t\tname = Release;
\t\t}};
\t\t{ids['uitest_debug']} /* Debug */ = {{
\t\t\tisa = XCBuildConfiguration;
\t\t\tbuildSettings = {{
\t\t\t\tCODE_SIGN_STYLE = Automatic;
\t\t\t\tCURRENT_PROJECT_VERSION = 1;
\t\t\t\tGENERATE_INFOPLIST_FILE = YES;
\t\t\t\tMARKETING_VERSION = 1.0;
\t\t\t\tPRODUCT_BUNDLE_IDENTIFIER = com.elharo.cropper.CropperUITests;
\t\t\t\tPRODUCT_NAME = "$(TARGET_NAME)";
\t\t\t\tSWIFT_EMIT_LOC_STRINGS = NO;
\t\t\t\tSWIFT_VERSION = 6.0;
\t\t\t\tTEST_TARGET_NAME = Cropper;
\t\t\t}};
\t\t\tname = Debug;
\t\t}};
\t\t{ids['uitest_release']} /* Release */ = {{
\t\t\tisa = XCBuildConfiguration;
\t\t\tbuildSettings = {{
\t\t\t\tCODE_SIGN_STYLE = Automatic;
\t\t\t\tCURRENT_PROJECT_VERSION = 1;
\t\t\t\tGENERATE_INFOPLIST_FILE = YES;
\t\t\t\tMARKETING_VERSION = 1.0;
\t\t\t\tPRODUCT_BUNDLE_IDENTIFIER = com.elharo.cropper.CropperUITests;
\t\t\t\tPRODUCT_NAME = "$(TARGET_NAME)";
\t\t\t\tSWIFT_EMIT_LOC_STRINGS = NO;
\t\t\t\tSWIFT_VERSION = 6.0;
\t\t\t\tTEST_TARGET_NAME = Cropper;
\t\t\t}};
\t\t\tname = Release;
\t\t}};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
\t\t{ids['project_configs']} /* Build configuration list for PBXProject "Cropper" */ = {{
\t\t\tisa = XCConfigurationList;
\t\t\tbuildConfigurations = (
\t\t\t\t{ids['project_debug']} /* Debug */,
\t\t\t\t{ids['project_release']} /* Release */,
\t\t\t);
\t\t\tdefaultConfigurationIsVisible = 0;
\t\t\tdefaultConfigurationName = Release;
\t\t}};
\t\t{ids['app_configs']} /* Build configuration list for PBXNativeTarget "Cropper" */ = {{
\t\t\tisa = XCConfigurationList;
\t\t\tbuildConfigurations = (
\t\t\t\t{ids['app_debug']} /* Debug */,
\t\t\t\t{ids['app_release']} /* Release */,
\t\t\t);
\t\t\tdefaultConfigurationIsVisible = 0;
\t\t\tdefaultConfigurationName = Release;
\t\t}};
\t\t{ids['uitest_configs']} /* Build configuration list for PBXNativeTarget "CropperUITests" */ = {{
\t\t\tisa = XCConfigurationList;
\t\t\tbuildConfigurations = (
\t\t\t\t{ids['uitest_debug']} /* Debug */,
\t\t\t\t{ids['uitest_release']} /* Release */,
\t\t\t);
\t\t\tdefaultConfigurationIsVisible = 0;
\t\t\tdefaultConfigurationName = Release;
\t\t}};
/* End XCConfigurationList section */
\t}};
\trootObject = {ids['project']} /* Project object */;
}}
'''
    
    # Create project directory
    os.makedirs('Cropper.xcodeproj', exist_ok=True)
    
    # Write project.pbxproj file
    with open('Cropper.xcodeproj/project.pbxproj', 'w') as f:
        f.write(project_content)
    
    print("✅ Xcode project created successfully!")
    print("Project file: Cropper.xcodeproj/project.pbxproj")

if __name__ == '__main__':
    create_xcode_project()
