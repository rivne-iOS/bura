//
//  LandscapeContoller.m
//  Calculator
//
//  Created by Admin on 20/12/15.
//  Copyright © 2015 Maxim. All rights reserved.
//

#import "LandscapeContoller.h"

@implementation LandscapeContoller

-(IBAction)number1:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 1;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
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
    //    selectNumber *= 10;
    //    selectNumber += 2;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
}
-(IBAction)number3:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 3;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"3"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"3"];
        selectNumber = [Screen.text floatValue];
    }
}

-(IBAction)number4:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 4;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"4"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"4"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number5:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 5;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"5"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"5"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number6:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 6;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"6"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"6"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number7:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 7;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"7"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"7"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number8:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 8;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"8"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"8"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number9:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 9;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"9"];
        selectNumber = [Screen.text floatValue];
    } else {
        Screen.text = [NSString stringWithFormat:@"9"];
        selectNumber = [Screen.text floatValue];
    }
}
-(IBAction)number0:(id)sender{
    //    selectNumber *= 10;
    //    selectNumber += 0;
    //    Screen.text = [NSString stringWithFormat:@"%i", selectNumber];
    if (![Screen.text  isEqual: @"0"]) {
        Screen.text = [Screen.text stringByAppendingString:@"0"];
        selectNumber = [Screen.text floatValue];
    }
}

-(IBAction)times:(id)sender{
//    if (selectNumber != 0) {
//        if (runningTotal == 0 || continueCounting) {
//            runningTotal = selectNumber;
//        } else {
//            [self chooseMethod:method];
//        }
//    }
//    
//    Screen.text = @"0";
//    method = 1;
//    selectNumber = 0;
//    CurrOperLabel.text = @"Current operation is: \"*\"";
    Screen.text = [Screen.text stringByAppendingString:@"*"];
}
-(IBAction)divide:(id)sender{
//    if (selectNumber != 0) {
//        if (runningTotal == 0 || continueCounting) {
//            runningTotal = selectNumber;
//        } else {
//            [self chooseMethod:method];
//        }
//    }
//    
//    Screen.text = @"0";
//    method = 2;
//    selectNumber = 0;
//    CurrOperLabel.text = @"Current operation is: \"/\"";
    Screen.text = [Screen.text stringByAppendingString:@"/"];
}
-(IBAction)subtract:(id)sender{
//    if (selectNumber != 0) {
//        if (runningTotal == 0 || continueCounting) {
//            runningTotal = selectNumber;
//        } else {
//            [self chooseMethod:method];
//        }
//    }
//    
//    Screen.text = @"0";
//    method = 3;
//    selectNumber = 0;
//    CurrOperLabel.text = @"Current operation is: \"-\"";
    Screen.text = [Screen.text stringByAppendingString:@"-"];
}
-(IBAction)plus:(id)sender{
//    if (selectNumber != 0) {
//        if (runningTotal == 0 || continueCounting) {
//            runningTotal = selectNumber;
//        } else {
//            [self chooseMethod:method];
//        }
//    }
//    
//    Screen.text = @"0";
//    method = 4;
//    selectNumber = 0;
//    CurrOperLabel.text = @"Current operation is: \"+\"";
    Screen.text = [Screen.text stringByAppendingString:@"+"];
}
-(IBAction)equals:(id)sender{
//    if (selectNumber != 0) {
//        if (runningTotal == 0) {
//            runningTotal = selectNumber;
//        } else {
//            [self chooseMethod:method];
//        }
//    }
//    
//    method = 0;
//    selectNumber = 0;
//    Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
//    CurrOperLabel.text = @"";
//    continueCounting = YES;
    NSString *resultedString = [self findMatchedStringByPattern:@"[(]{1}[1234567890.\\+\\-\\*\\/\\%]+[)]{1}" andString:Screen.text];
    
    BOOL find = false;
    do {
        float total;
        find = false;
        
        NSString *resultedOperationString = [self findMatchedStringByPattern:@"[1234567890.]+[\\*]{1}[1234567890.]+" andString:resultedString];
        NSString *savedResultedOperationString = resultedOperationString;
        
        if (resultedString != nil) {
            find = true;
        }
        
        NSString *resultedNumberString = [self findMatchedStringByPattern:@"[1234567890.]+" andString:resultedOperationString];
        resultedOperationString = [resultedOperationString stringByReplacingOccurrencesOfString:resultedNumberString withString:@""];
        float firstNumber = [resultedNumberString floatValue];
        
        resultedNumberString = [self findMatchedStringByPattern:@"[1234567890.]+" andString:resultedOperationString];
        resultedOperationString = [resultedOperationString stringByReplacingOccurrencesOfString:resultedNumberString withString:@""];
        float secondNumber = [resultedNumberString floatValue];
        
        total = firstNumber * secondNumber;
        
        Screen.text = [Screen.text stringByReplacingOccurrencesOfString:savedResultedOperationString withString:[NSString stringWithFormat:@"%g", total]];
        // * - has dissapeared
        NSLog(@"%@", [NSString stringWithFormat:@"%g", total]);
        
    } while (find);
}

-(NSString *)findMatchedStringByPattern:(NSString *)inputPattern andString:(NSString *)inputString {
    NSString *searchedString = inputString;
    NSRange  searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = inputPattern;
    NSError  *error = nil;
    NSString *matchText;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:searchedString options:0 range: searchedRange];
    for (NSTextCheckingResult* match in matches) {
        matchText = [searchedString substringWithRange:[match range]];
        NSLog(@"match: %@", matchText);
    }
    return matchText;
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
        if (method != 0) {
            selectNumber = -selectNumber;
            Screen.text = [NSString stringWithFormat:@"%g", selectNumber];
        } else {
            runningTotal = -runningTotal;
            Screen.text = [NSString stringWithFormat:@"%g", runningTotal];
        }
    }
}

- (IBAction)calcPercent:(id)sender {
//    if (selectNumber != 0) {
//        if (runningTotal == 0 || continueCounting) {
//            runningTotal = selectNumber;
//        } else {
//            [self chooseMethod:method];
//        }
//    }
//    
//    Screen.text = @"0";
//    method = 5;
//    selectNumber = 0;
//    CurrOperLabel.text = @"Current operation is: \"%\"";
    Screen.text = [Screen.text stringByAppendingString:@"%"];
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
        Screen.text = [Screen.text stringByAppendingString:@"."];
}

- (IBAction)leftParenthesis:(id)sender {
//    if ([Screen.text characterAtIndex:[Screen.text length] - 1 ] == '+' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '-' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '/' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '*' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '%') {
//        Screen.text = [Screen.text stringByAppendingString:@"("];
//        selectNumber = [Screen.text floatValue];
//    } else if ([Screen.text isEqualToString:@"0"]){
        Screen.text = [Screen.text stringByAppendingString:@"("];
        selectNumber = [Screen.text floatValue];
//    }
}

- (IBAction)rightParenthesis:(id)sender {
//    if ([Screen.text characterAtIndex:[Screen.text length] - 1 ] == '1' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '2' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '3' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '4' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '5' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '6' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '7' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '8' ||
//        [Screen.text characterAtIndex:[Screen.text length] - 1 ] == '9' ||
//        ([Screen.text characterAtIndex:[Screen.text length] - 1 ] == '0' &&
//        [Screen.text containsString:@"("])) {
        Screen.text = [Screen.text stringByAppendingString:@")"];
        selectNumber = [Screen.text floatValue];
//    }
}

@end
