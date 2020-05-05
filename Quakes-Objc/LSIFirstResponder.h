//
//  LSIFirstResponder.h
//  Quakes-Objc
//
//  Created by Audrey Welch on 5/4/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// class FirstResponder: NSObject { }

@interface LSIFirstResponder : NSObject

@property (nonatomic, copy) NSString *name;
@property () int age;

// Swift
// init(name: String, age: Int)
// initWithName(_ name: String, usingAge age: Int)

// name, age: parameter of the argument
- (instancetype)initWithName:(NSString *)name
                    usingAge:(int)age;


@end

NS_ASSUME_NONNULL_END
