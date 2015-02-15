//
//  TestOperation.m
//  MultiThreadingExamples
//
//  Created by Erick Bennett on 2/15/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import "TestOperation.h"

@implementation TestOperation

-(void)main {
    //Sleep the thread to see if it affects the main thread when running
    [NSThread sleepForTimeInterval:3];
    
    //After sleeping, choose a random number
    NSNumber *number = @(arc4random() % 100);
    
    //Use out delegate method to notify our controller that the operation is finished. We must execute this delegate call on the main thread otherwise it would be on the same thread as what this (void)main function ran on.
    [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
        [self.delegate hasNumber:number];
    }];
}

@end
