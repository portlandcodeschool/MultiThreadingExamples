//
//  TestOperation.h
//  MultiThreadingExamples
//
//  Created by Erick Bennett on 2/15/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import <Foundation/Foundation.h>

//Setup the delegate call
@protocol TestOperationDelegate <NSObject>

-(void)hasNumber:(NSNumber *)theNumber;

@end

@interface TestOperation : NSOperation

//For the delegate cal
@property (nonatomic, retain) id <TestOperationDelegate> delegate;

@end
