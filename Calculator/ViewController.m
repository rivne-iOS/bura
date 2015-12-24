//
//  ViewController.m
//  Calculator
//
//  Created by Admin on 17/12/15.
//  Copyright © 2015 Maxim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)number1:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"1"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"1"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number2:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"2"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"2"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number3:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"3"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"3"];
        selectNumber = [Screen.text floatValue];
    }
}

-(IBAction)number4:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"4"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"4"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number5:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"5"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"5"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number6:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"6"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"6"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number7:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"7"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"7"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number8:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"8"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"8"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number9:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"9"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"9"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number0:(id)sender{
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"0"];
        selectNumber = [Screen.text floatValue];
    }
}

-(IBAction)times:(id)sender{
    if (selectNumber != 0) {
        if (runningTotal == 0 || continueCounting) {
            runningTotal = selectNumber;
        } else {
            [self chooseMethod:method];
        }
    }
    
    Screen.text = @"0";
    method = 1;
    selectNumber = 0;
    CurrOperLabel.text = @"Current operation is: \"*\"";
    selectNumber = runningTotal;
}
-(IBAction)divide:(id)sender{
    if (selectNumber != 0) {
        if (runningTotal == 0 || continueCounting) {
            runningTotal = selectNumber;
        } else {
            [self chooseMethod:method];
        }
    }
    
    Screen.text = @"0";
    method = 2;
    selectNumber = 0;
    CurrOperLabel.text = @"Current operation is: \"/\"";
    selectNumber = runningTotal;
}
-(IBAction)subtract:(id)sender{
    if (selectNumber != 0) {
        if (runningTotal == 0 || continueCounting) {
            runningTotal = selectNumber;
        } else {
            [self chooseMethod:method];
        }
    }
    
    Screen.text = @"0";
    method = 3;
    selectNumber = 0;
    CurrOperLabel.text = @"Current operation is: \"-\"";
    selectNumber = runningTotal;
}
-(IBAction)plus:(id)sender{
    if (selectNumber != 0) {
        if (runningTotal == 0 || continueCounting) {
            runningTotal = selectNumber;
        } else {
            [self chooseMethod:method];
        }
    }
    
    Screen.text = @"0";
    method = 4;
    selectNumber = 0;
    CurrOperLabel.text = @"Current operation is: \"+\"";
    selectNumber = runningTotal;
}
-(IBAction)equals:(id)sender{
    if (selectNumber != 0) {
        if (runningTotal == 0) {
            runningTotal = selectNumber;
        } else {
            [self chooseMethod:method];
        }
    }
    
    method = 0;
    selectNumber = 0;
    Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
    CurrOperLabel.text = @"";
    continueCounting = YES;
    selectNumber = runningTotal;
}
-(IBAction)allClear:(id)sender{
    
    method = 0;
    selectNumber = 0;
    runningTotal = 0;
    continueCounting = NO;
    
    Screen.text = [NSString stringWithFormat:@"0"];
}

- (IBAction)changeToPosNeg:(id)sender {
    if (![Screen.text isEqualToString:@"0"]) {
//        if (continueCounting == NO) {
            selectNumber = -selectNumber;
            Screen.text = [NSString stringWithFormat:@"%g", selectNumber];
//        } else {
//            runningTotal = -runningTotal;
//            Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
//        }
    }
}

- (IBAction)calcPercent:(id)sender {
    if (selectNumber != 0) {
        if (runningTotal == 0 || continueCounting) {
            runningTotal = selectNumber;
        } else {
            [self chooseMethod:method];
        }
    }
    
    Screen.text = @"0";
    method = 5;
    selectNumber = 0;
    CurrOperLabel.text = @"Current operation is: \"%\"";
}

- (void)chooseMethod:(int)method {
//void chooseMethod(int method) {
    switch (method) {
        case 1:
            runningTotal *= selectNumber;
            Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
            break;
        case 2:
            runningTotal /= selectNumber;
            Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
            break;
        case 3:
            runningTotal -= selectNumber;
            Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
            break;
        case 4:
            runningTotal += selectNumber;
            Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
            break;
        case 5:
            runningTotal = (runningTotal * selectNumber) / 100;
            Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
            break;
        default:
            break;
    }
}

- (IBAction)addDot:(id)sender {
    if (![Screen.text containsString:@"."]) {
        Screen.text = [Screen.text stringByAppendingString:@"."];
        selectNumber = [Screen.text floatValue];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationDidChanged: (NSNotification *) notification {
    UIDeviceOrientation devOrientation = [UIDevice currentDevice].orientation;
    
    if (UIDeviceOrientationIsLandscape(devOrientation)) {
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LandscapeContoller *landscape = [main instantiateViewControllerWithIdentifier:@"landscape"];
        
        [self presentViewController:landscape animated:YES completion:nil];
    } else if (UIDeviceOrientationIsPortrait(devOrientation)) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
