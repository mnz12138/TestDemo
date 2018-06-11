//
//  TestDemoTests.m
//  TestDemoTests
//
//  Created by Apple on 2018/6/11.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface TestDemoTests : XCTestCase

@end

@implementation TestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *i = @"a";
    NSString *j = @"a";
    XCTAssertEqual(i, j, @"数不一致");
    XCTestExpectation *tExpectation = [[XCTestExpectation alloc] initWithDescription:@"Code 200"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tExpectation fulfill];
    });
    [self waitForExpectations:@[tExpectation] timeout:5.0];
//    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError * _Nullable error) {
//        NSLog(@"%@",error);
//    }];
}

- (void)testUrlParams {
//    NSDictionary *dict1 = @{@"urlStr": @"rgj:", @"result": @[@"rgj:",@{}]};
//    NSArray *result = dict1[@"result"];
//    NSArray *results = [ViewController getParamsWithUrlString:dict1[@"urlStr"]];
//    XCTAssertEqual(result[0], results[0], @"url不对");
//    XCTAssertEqual(result[1], results[1], @"参数不对");
    
    NSArray *urls = @[@{@"urlStr": @"rgj:", @"result": @[@"rgj:",@{}]},
                      @{@"urlStr": @"rgj://", @"result": @[@"rgj://",@{}]},
                      @{@"urlStr": @"rgj://package/list", @"result": @[@"rgj://package/list",@{}]},
                      @{@"urlStr": @"rgj://package/list?", @"result": @[@"rgj://package/list",@{}]},
                      @{@"urlStr": @"rgj://package/list?&", @"result": @[@"rgj://package/list",@{}]},
                      @{@"urlStr": @"rgj://package/list?a=1", @"result": @[@"rgj://package/list",@{@"a":@"1"}]},
                      @{@"urlStr": @"rgj://package/list?a=1&b=2", @"result": @[@"rgj://package/list",@{@"a":@"1",@"b":@"2"}]},
                      ];
    for (NSDictionary *dict in urls) {
        NSArray *results = [ViewController getParamsWithUrlString:dict[@"urlStr"]];
        NSArray *array = dict[@"result"];
        XCTAssertGreaterThanOrEqual(array.count, 2, @"预期值格式错误");
        XCTAssertGreaterThanOrEqual(results.count, 2, @"结果只格式错误");
        XCTAssertEqualObjects(array[0], results[0], @"url不对");
        for (NSString *key in array[1]) {
            id value = array[1][key];
            XCTAssertEqualObjects(value, results[1][key], @"参数不对");
        }
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        //性能测试
        [ViewController getParamsWithUrlString:@"rgj://package/list?a=1&b=2"];
    }];
}

@end
