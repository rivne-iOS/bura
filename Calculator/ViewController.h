//
//  ViewController.h
//  Calculator
//
//  Created by Admin on 17/12/15.
//  Copyright © 2015 Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LandscapeContoller.h"

@interface ViewController : UIViewController
{
    IBOutlet UITextField *Screen;
    IBOutlet UILabel *CurrOperLabel;
}

-(IBAction)number1:(id)sender;
-(IBAction)number2:(id)sender;
-(IBAction)number3:(id)sender;
-(IBAction)number4:(id)sender;
-(IBAction)number5:(id)sender;
-(IBAction)number6:(id)sender;
-(IBAction)number7:(id)sender;
-(IBAction)number8:(id)sender;
-(IBAction)number9:(id)sender;
-(IBAction)number0:(id)sender;

-(IBAction)times:(id)sender;
-(IBAction)divide:(id)sender;
-(IBAction)subtract:(id)sender;
-(IBAction)plus:(id)sender;
-(IBAction)equals:(id)sender;
-(IBAction)allClear:(id)sender;
- (IBAction)changeToPosNeg:(id)sender;
- (IBAction)calcPercent:(id)sender;
- (IBAction)addDot:(id)sender;

@end

