//
//  LSIQuake.m
//  Quakes-Objc
//
//  Created by Audrey Welch on 5/4/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIQuake.h"

@implementation LSIQuake

- (instancetype)initWithMagnitude:(NSNumber *)magnitude
                            place:(NSString *)place
                             time:(NSDate *)time
                         latitude:(double)latitude
                        longitude:(double)longitude {
    self = [super init];
    if (self) {
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
    
    // Temporary variables to check for non-nil
    NSNumber *magnitude = properties[@"mag"]; // Can be null
    
    if ([magnitude isKindOfClass:[NSNull class]]) {
        magnitude = nil; // let's treat as an optional
    }
    
    NSString *place = properties[@"place"];
    NSNumber *timeNumber = properties[@"time"]; // time in milliseconds
    
    // Prevent a crash, so we can gracefully prase a JSON data without coordinates
    NSNumber *longitude = nil;
    NSNumber *latitude = nil;
    
    if (coordinates.count >= 2) {
        // Longitude is first in the array
        longitude = coordinates[0];
        latitude = coordinates[1];
    }

    // If all required values are present, call the init method
    
    // All fields are required (except magnitude) to initialize (assumption in this example)
    if (place && timeNumber && latitude && longitude) {
        // create the object
        NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeNumber.longValue / 1000.0];
        
        // call other initializer
        self = [self initWithMagnitude:magnitude place:place time:time latitude:latitude.doubleValue longitude:longitude.doubleValue];
        
    } else {
        // return nil
        NSLog(@"Error: Invalid object, unable to parse, %@", dictionary);
        return nil;
    }
    
    return self;
}

@end
