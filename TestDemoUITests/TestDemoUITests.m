//
//  TestDemoUITests.m
//  TestDemoUITests
//
//  Created by Apple on 2018/6/11.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TestDemoUITests : XCTestCase

@end

@implementation TestDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"8"]/*[[".cells.staticTexts[@\"8\"]",".staticTexts[@\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ swipeUp];
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"9"]/*[[".cells.staticTexts[@\"9\"]",".staticTexts[@\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ swipeDown];
    [app.navigationBars[@"Root View Controller"].buttons[@"Push"] tap];
    [app.navigationBars[@"UIView"].buttons[@"Root View Controller"] tap];
    
}

@end
