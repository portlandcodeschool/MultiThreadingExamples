//
//  ViewController.m
//  MultiThreadingExample
//
//  Created by Erick Bennett on 2/15/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)executeOnMainThread:(id)sender {
    //this is the action linked our Main Thread button the storyboard viewconroller.
    
    //Standard execution on main thread. This will block the user from all input while the sleep is happening
    [NSThread sleepForTimeInterval:3];
    
    //Choose a random number
    int i = arc4random() % 100;
    
    //Update our labels text property
    self.theLabel.text = [[NSString alloc]initWithFormat:@"Result: %d", i];
    
}
- (IBAction)executeGCD:(id)sender {
    //this is the action linked our GCD button the storyboard viewconroller.
    
    // call the method on a background thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:3];
        int i = arc4random() % 100;
        
        // update UILabel on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            self.theLabel.text = [[NSString alloc]initWithFormat:@"Result: %d", i];
        });
    });
    
}
- (IBAction)OperationQueue:(id)sender {
    //this is the action linked our OperationQueue button the storyboard viewconroller.
    
    //Create a new NSOperationQueue
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //Alloc and init our test operation
    TestOperation *operation = [[TestOperation alloc] init];
    
    //In this case we are using a delegate call to be notified when the operation is finished. This is specific to our example, if you are processing data, you may just be updating your data and notifiying your objects in some other way.
    operation.delegate = self;
    
    //Add our operation to our NSOperationQueue. This will then eschedule and execute the operation
    [queue  addOperation:operation];
}
-(void)hasNumber:(NSNumber *)theNumber {
    //This is our delegate callback. We are notifying this delegate on the main thread so no need to tell out label update code to be on the main thread since it already is.
    self.theLabel.text = [[NSString alloc]initWithFormat:@"Result: %@", theNumber];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
