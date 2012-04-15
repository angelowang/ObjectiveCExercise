//
//  ViewController.m
//  ObjectiveCExercise
//
//  Created by Haibo Wang on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    label.text = @"Exercise: \r\n"
    "1. Write a Shape class, with a name property; and an initWithName: method;\r\n"
    "2. Write a Drawable protocol, with a draw method which returns a NSString *;\r\n"
    "3. Write Rectangle, Circle classes inheriting Shape, and adopting Drawable;\r\n"
    "4. Draw method should return \"Rectangle XX\", and \"Circle YY\"\r\n\r\n"
    "Bonus:\r\n"
    "Prepare the model class for calculator brain.";
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)startTest:(id)sender {
}


@end
