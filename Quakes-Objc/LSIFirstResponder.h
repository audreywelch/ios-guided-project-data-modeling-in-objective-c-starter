//
//  LSIFirstResponder.h
//  Quakes-Objc
//
//  Created by Paul Solt on 4/15/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//class FirstResponder: NSObject {
//
//}

@interface LSIFirstResponder : NSObject

@property (nonatomic, copy) NSString *name;
@property int age;

// Swift
//initWithName(_ name: String, usingAge age: Int)

- (instancetype)initWithName:(NSString *)name
                    usingAge:(int)age;

@end

NS_ASSUME_NONNULL_END
