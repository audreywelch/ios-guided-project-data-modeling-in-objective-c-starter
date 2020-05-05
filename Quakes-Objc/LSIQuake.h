//
//  LSIQuake.h
//  Quakes-Objc
//
//  Created by Audrey Welch on 5/4/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIQuake : NSObject

@property (nonatomic, readonly) double magnitude;
@property (nonatomic, readonly, copy) NSString *place;
@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

- (instancetype)initWithMagnitude:(double)magnitude
                            place:(NSString *)place
                             time:(NSDate *)time
                         latitude:(double)latitude
                        longitude:(double)longitude;

// We want to initialize content from a dictionary
// So write an initializer that can do that
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
