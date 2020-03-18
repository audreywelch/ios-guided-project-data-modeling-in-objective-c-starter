//
//  ViewController.m
//  Quakes-Objc
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSIFirstResponder.h"
#import "LSILog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LSIFirstResponder *firstResponder = [[LSIFirstResponder alloc] initWithName:@"Steve"];

    NSLog(@"responder: %@", firstResponder);
    NSLog(@"name: %@", firstResponder.name);  // dot syntax
    // Command + Alt + [ = move up
    // Command + Alt + ] = move down
    
    firstResponder.name = @"John";  // dot syntax
    [firstResponder setName:@"John"]; // method calling
    
    NSLog(@"name: %@", [firstResponder name]); // method calling (dot syntax turns into this)
}


@end
