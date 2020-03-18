//
//  LSIQuakeResults.m
//  Quakes-Objc
//
//  Created by Paul Solt on 3/18/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIQuakeResults.h"
#import "LSIQuake.h"

@implementation LSIQuakeResults

- (instancetype)initWithQuakes:(NSArray<LSIQuake *> *)quakes {
    self = [super init];
    if (self) {
        _quakes = [quakes copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    // To parse an array you need to iterate over the array of dictionaries
    NSArray *quakeDictionaries = dictionary[@"features"];
    NSMutableArray<LSIQuake *> *quakes = [[NSMutableArray alloc] init];
    
    for (NSDictionary *quakeDictionary in quakeDictionaries) {
        LSIQuake *quake = [[LSIQuake alloc] initWithDictionary:quakeDictionary];
        if (quake) { // if (quake != nil) {
            [quakes addObject: quake];
        } else {
            NSLog(@"Unable to parse quake dictionary: %@", quakeDictionary);
        }
    }
    self = [self initWithQuakes:quakes];
    return self;
}

@end
