//
//  LSIFirstResponder.m
//  Quakes-Objc
//
//  Created by Paul Solt on 3/18/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIFirstResponder.h"

@implementation LSIFirstResponder

// Control + Option + C: Commit Dialog
@synthesize name = _name; // Tells the compiler to please create instance variable

// We need to uphold the contract for copy in our init/setters

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {

        // upholds the properties contract for "copy"
        _name = [name copy]; // copy on write
    }
    return self;
}

// Swift
//var name: String {
//    didSet {
//        updateViews()
//    }
//}

- (void)setName:(NSString *)name {
    // willSet
    
    // You must set the value to your instance variable
    _name = [name copy];
    //self.name = name; // BUG: recursively calls our setName:
    
    // didSet
    [self updateViews];
}

- (NSString *)name {
    return _name;
}

- (void)updateViews {
    
}


@end
