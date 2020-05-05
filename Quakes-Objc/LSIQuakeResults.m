//
//  LSIQuakeResults.m
//  Quakes-Objc
//
//  Created by Audrey Welch on 5/4/20.
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
    
    // This is where we do our parsing
    
    // features dictionary [Quake]
    // Objc: NSDictionary -> [LSIQuake]
    NSArray *quakeDictionaries = dictionary[@"features"];
    NSMutableArray *quakes = [[NSMutableArray alloc] init];
    
    // for in loop to iterate over every dictionary from the array of dictionaries
    for (NSDictionary *quakeDictionary in quakeDictionaries) {
        
        LSIQuake *quake = [[LSIQuake alloc] initWithDictionary: quakeDictionary];
        
        if (quake) { // if (quake != nil
            [quakes addObject:quake];
        } else {
            NSLog(@"Error: invalid quake found in LSIQuakeResults");
        }
    }
    
    self = [self initWithQuakes:quakes];
    
    return self;
    
}

@end
