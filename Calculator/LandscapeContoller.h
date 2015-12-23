//
//  LandscapeContoller.h
//  Calculator
//
//  Created by Admin on 20/12/15.
//  Copyright © 2015 Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

static float selectNumber;
static int method;
static BOOL continueCounting = NO;
static float runningTotal;

static const int MULTIPLY_OPERATION = 1;
static const int DIVISION_OPERATION = 2;
static const int PLUS_OPERATION = 3;
static const int MINUS_OPERATION = 4;
static const int PERSENT_OPERATION = 5;
static const int POWER_OPERATION = 6;

@interface LandscapeContoller : UIViewController
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
- (IBAction)leftParenthesis:(id)sender;
- (IBAction)rightParenthesis:(id)sender;
- (IBAction)sinxFunction:(id)sender;
- (IBAction)cosxFunction:(id)sender;
- (IBAction)tanxFunction:(id)sender;
- (IBAction)ctanxFunction:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)sinhFunction:(id)sender;
- (IBAction)coshFunction:(id)sender;
- (IBAction)tanhFunction:(id)sender;
- (IBAction)ctanhFunction:(id)sender;
- (IBAction)power:(id)sender;
- (IBAction)logNatural:(id)sender;
- (IBAction)constantE:(id)sender;
- (IBAction)constantPi:(id)sender;

@end
