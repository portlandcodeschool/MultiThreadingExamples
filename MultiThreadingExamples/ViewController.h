//
//  ViewController.h
//  MultiThreadingExamples
//
//  Created by Erick Bennett on 2/15/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestOperation.h"

//Make sure we inport our testoperation.h so we can see its delegate protocol
@interface ViewController : UIViewController <TestOperationDelegate>

//Reference to our UILable on the main storyboard
@property (weak, nonatomic) IBOutlet UILabel *theLabel;


@end

