//
//  ViewController.m
//  Quakes-Objc
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSILog.h" // Error: 'LSILog.h' file not found // Removes time stamp

// Sometimes in Xcode 11, the compiler won't see our files if they are in folders
// Command + Shift + K: Clean
// Build: Command + B
// Build Unit Test: Command + Shift + U

#import "LSIFirstResponder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Hey clean output!");
    
    NSMutableString *bobsName = [[NSMutableString alloc] initWithString:@"Bob"];
    
                                 
    
    LSIFirstResponder *bob = [[LSIFirstResponder alloc] initWithName:@"Bob" usingAge:37];
    //bob.name = @"Bobby"; // we can't change to a new name b/c `readonly`
}


@end
