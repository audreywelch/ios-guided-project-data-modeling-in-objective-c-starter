//
//  ViewController.m
//  Quakes-Objc
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"

// Sometimes in Xcode 11, the compiler won't see our files if they are in folders
// Command + Shift + K: Clean
// Build: Command + B
// Build Unit Test: Command + Shift + U

#import "LSILog.h" // Error: 'LSILog.h' file not found
#import "LSIFirstResponder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Hey clean output!");
    
    NSMutableString *bobsName = [[NSMutableString alloc] initWithString:@"Bob"];
    NSLog(@"bobsName: %@", bobsName);
    
    
    LSIFirstResponder *bob = [[LSIFirstResponder alloc] initWithName:bobsName usingAge:37];
    
    NSLog(@"bob: %@", bob.name);
    
    [bobsName insertString:@"!" atIndex:0];
    NSLog(@"bobsName: %@", bobsName);
    
    //bob.name = bobsName; // !Bob
    
    NSLog(@"bob: %@", bob.name);
    
    [bobsName setString:@"Jimmy"];
    
    NSLog(@"bob: %@", bob.name);

    //bob.name = @"Bobby"; // we can't change to a new value
    
    
}


@end
