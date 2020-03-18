//
//  LSIQuake.m
//  Quakes-Objc
//
//  Created by Paul Solt on 3/18/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIQuake.h"

@implementation LSIQuake

- (instancetype)initWithMagnitude:(NSNumber *)magnitude
                            place:(NSString *)place
                             time:(NSDate *)time
                         latitude:(double)latitude
                        longitude:(double)longitude {
    if (self = [super init]) {
        // Always use the _instanceVariable, so we don't have property setter side effects (database sync)
        _magnitude = magnitude;
        _place = [place copy];
        _time = time;
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    // Containers
    NSDictionary *properties = dictionary[@"properties"];
    NSDictionary *geometry = dictionary[@"geometry"];
    NSArray *coordinates = geometry[@"coordinates"];
    
    NSNumber *magnitude = properties[@"mag"];
    NSString *place = properties[@"place"];
    NSNumber *timeNumber = properties[@"time"]; // milliseconds since 1970
    
    NSNumber *latitudeNumber = nil;
    NSNumber *longitudeNumber = nil;
    
    if (coordinates.count >= 2) {
        longitudeNumber = coordinates[0]; // Longitude is before latitude
        latitudeNumber = coordinates[1];
    }
    
    // Question: How do we want it to behave when values are nil?
    
    if ([magnitude isKindOfClass:[NSNull class]]) {
        // null value in the JSON
        magnitude = nil; // UI display "N/A"
    }
    
    // Failable initializer to require all fields but the magnitude
    
    // We're assuming these values are required for valid object creation
    if (!(place || timeNumber || latitudeNumber || longitudeNumber)) { // place && timeNumber && ...
        return nil;
    }
    
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeNumber.longValue / 1000.0];
    
    self = [self initWithMagnitude:magnitude
                             place:place
                              time:time
                          latitude:latitudeNumber.doubleValue
                         longitude:longitudeNumber.doubleValue];
    return self;
}

@end
