//
//  LSIQuakeTests.m
//  Quakes-ObjcTests
//
//  Created by Paul Solt on 4/15/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "LSIQuake.h" // Rebuild Unit Test: Command + Shift + U
#import "LSILog.h"

@interface LSIQuakeTests : XCTestCase

@end

@implementation LSIQuakeTests

- (void)testParseQuake {
    NSData *data = loadFile(@"Quake.json", [LSIQuakeTests class]);
    
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];  // & = address of
    
    if (error) {  // if (error != nil) {
        XCTFail(@"Error parsing JSON: %@", error);
    }
    NSLog(@"JSON: %@", json);
    
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:1388620296020 / 1000.0];
    LSIQuake *quake = [[LSIQuake alloc] initWithDictionary:json];
    
    NSLog(@"quake: %@", quake);
    
    // Double?
    // NSNumber = nil
    XCTAssertEqualWithAccuracy(1.29, quake.magnitude, 0.0001);
    XCTAssertEqualObjects(@"10km SSW of Idyllwild, CA", quake.place);
    XCTAssertEqualObjects(time, quake.time);
    
    // For now we'll just set the alert to nil, you may want to use @"" instead
    XCTAssertEqualWithAccuracy(33.663333299999998, quake.latitude, 0.0001);
    XCTAssertEqualWithAccuracy(-116.7776667, quake.longitude, 0.0001);

}

@end
