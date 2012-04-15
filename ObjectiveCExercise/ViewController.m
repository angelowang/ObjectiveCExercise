//
//  ViewController.m
//  ObjectiveCExercise
//
//  Created by Haibo Wang on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    label.text = @"Exercise: \r\n"
    "1. Write a Shape class, with a readonly name property; and an initWithName: method;\r\n"
    "2. Write a Drawable protocol, with a draw method which returns an NSString *;\r\n"
    "3. Write Rectangle, Circle classes inheriting from Shape, and adopting Drawable;\r\n"
    "4. Draw method should return \"Rectangle XX\", and \"Circle YY\"\r\n\r\n"
    "Bonus:\r\n"
    "5. Play with categories and extensions;\r\n"
    "6. Prepare the model class for calculator brain.";
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
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                        message:@""
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    // 1. class Shape exists
    Class shapeClass = NSClassFromString(@"Shape");
    if (!shapeClass) {
        alertView.message = @"You haven't defined Shape class.";
        [alertView show];
        return;
    }
    // 2. Shape.name
    if (![shapeClass instancesRespondToSelector:@selector(name)]) {
        alertView.message = @"No name property defined.";
        [alertView show];
        return;
    }
    // 3. name is readonly.
    if ([shapeClass instancesRespondToSelector:@selector(setName:)]) {
        alertView.message = @"Name property should be readonly.";
        [alertView show];
        return;
    }
    // 4. [Shape initWithName:]
    if (![shapeClass instancesRespondToSelector:@selector(initWithName:)]) {
        alertView.message = @"No initWithName: method defined.";
        [alertView show];
        return;
    }
    // 5. initWithName: should set the name.
    id shape = [shapeClass alloc];
    shape = [shape performSelector:@selector(initWithName:) withObject:@"MyShape"];
    NSString *shapeName = (NSString *)[shape performSelector:@selector(name)];
    if (!shapeName || ![shapeName isEqualToString:@"MyShape"]) {
        alertView.message = @"initWithName: method doens't set the name correctly.";
        [alertView show];
        return;
    }
    // 6. protocol Drawable exists
    Protocol *drawableProtocol = NSProtocolFromString(@"Drawable");
    if (!drawableProtocol) {
        alertView.message = @"You haven't defined Drawable protocol. Or the protocol you declared are not used yet.\r\nUnused protocols are not visible during runtime.";
        [alertView show];
        return;
    }
    // 7. class Rectangle exists
    Class rectangleClass = NSClassFromString(@"Rectangle");
    if (!rectangleClass) {
        alertView.message = @"You haven't defined Rectangle class.";
        [alertView show];
        return;
    }    
    if (![rectangleClass isSubclassOfClass:shapeClass]) {
        alertView.message = @"Rectangle is not subclass of Shape.";
        [alertView show];
        return;
    }
    if (![rectangleClass conformsToProtocol:drawableProtocol]) {
        alertView.message = @"Rectangle doesn't adopt Drawable protocol.";
        [alertView show];
        return;
    }
    // 8. class Circle exists
    Class circleClass = NSClassFromString(@"Circle");
    if (!circleClass) {
        alertView.message = @"You haven't defined Circle class.";
        [alertView show];
        return;
    }
    
    if (![circleClass isSubclassOfClass:shapeClass]) {
        alertView.message = @"Circle is not subclass of Shape.";
        [alertView show];
        return;
    }
    if (![circleClass conformsToProtocol:drawableProtocol]) {
        alertView.message = @"Circle doesn't adopt Drawable protocol.";
        [alertView show];
        return;
    }
    // 9. [Rectangle draw] should return "Rectangle XX"
    id rectangle = [rectangleClass alloc];
    rectangle = [rectangle performSelector:@selector(initWithName:) withObject:@"XX"];
    NSString *rectangleDraw = [rectangle performSelector:@selector(draw)];
    if (![rectangleDraw isEqualToString:@"Rectangle XX"]) {
        alertView.message = @"Rectangle XX draw method doens't return \"Rectangle XX\"";
        [alertView show];
        return;
    }
    // 10. [Circle draw] should return "Circle YY"
    id circle = [circleClass alloc];
    circle = [circle performSelector:@selector(initWithName:) withObject:@"YY"];
    NSString *circleDraw = [rectangle performSelector:@selector(draw)];
    if (![circleDraw isEqualToString:@"Rectangle XX"]) {
        alertView.message = @"Circle YY draw method doens't return \"Circle YY\"";
        [alertView show];
        return;
    }
    
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:30.0];
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"Congratulations!";
    
    [circle release];
    [rectangle release];
    [shape release];
    [alertView release];
}


@end
