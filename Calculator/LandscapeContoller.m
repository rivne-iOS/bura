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
    Screen.text = [Screen.text stringByAppendingString:@"*"];
}
-(IBAction)divide:(id)sender{
    Screen.text = [Screen.text stringByAppendingString:@"/"];
}
-(IBAction)subtract:(id)sender{
    Screen.text = [Screen.text stringByAppendingString:@"-"];
}
-(IBAction)plus:(id)sender{
    Screen.text = [Screen.text stringByAppendingString:@"+"];
}
-(IBAction)equals:(id)sender{
    CurrOperLabel.text = [NSString stringWithFormat:@"%@", Screen.text];
    
    do {
    
        [self replaceConstants];
    
        NSString *occurrencesOfNeagtiveString = [self findMatchedStringByPattern:@"[(]{1}[\\-]{1}[m1234567890.]+[)]{1}" andString:Screen.text];
        if (occurrencesOfNeagtiveString != nil) {
            NSString *occurrencesOfNeagtiveNumString = [self findMatchedStringByPattern:@"[1234567890.]+" andString:occurrencesOfNeagtiveString];
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:occurrencesOfNeagtiveString withString:[NSString stringWithFormat:@"(m%@)", occurrencesOfNeagtiveNumString]];
        }
        
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\^]{1}[m1234567890.]+" andString:Screen.text];
        if (resultedString == nil) break;
        
        [self executeOperation:POWER_OPERATION withResultedString:Screen.text];
    } while (true);
        
    // Evaluate multiplication and division operations
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"[(]{1}[m1234567890.\\+\\-\\*\\/\\%]+[)]{1}" andString:Screen.text];
        
        if (resultedString == nil) break;
        
        NSRange rangeMultiply = [resultedString rangeOfString:@"*"];
        NSRange rangeDivision = [resultedString rangeOfString:@"/"];
    
        if (rangeMultiply.location == NSNotFound && rangeDivision.location == NSNotFound) break;
    
        if (rangeMultiply.location != NSNotFound && rangeMultiply.location < rangeDivision.location) {
            [self executeOperation:MULTIPLY_OPERATION withResultedString:resultedString];
        } else if (rangeDivision.location != NSNotFound && rangeMultiply.location > rangeDivision.location) {
            [self executeOperation:DIVISION_OPERATION withResultedString:resultedString];
        }
    } while  (YES);
    
    // Evaluate plus and minus operations
    do {
        NSRange rangeMinus;
        NSRange rangePlus;
        NSString *resultedString = [self findMatchedStringByPattern:@"([(]{1}[m1234567890.\\+\\-\\*\\/\\%]+[)]{1})" andString:Screen.text];
        
        if (resultedString == nil) break;
        
        NSString *checkOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\-]{1}[m1234567890.]+" andString:resultedString];
        if (checkOperationString != nil) {
            rangeMinus = [resultedString rangeOfString:@"-"];
        } else rangeMinus.location = NSNotFound;
        checkOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\+]{1}[m1234567890.]+" andString:resultedString];
        if (checkOperationString != nil) {
            rangePlus = [resultedString rangeOfString:@"+"];
        } else rangePlus.location = NSNotFound;
        
        if (rangeMinus.location == NSNotFound && rangePlus.location == NSNotFound) break;
        
        if (rangeMinus.location != NSNotFound && rangeMinus.location < rangePlus.location) {
            [self executeOperation:MINUS_OPERATION withResultedString:resultedString];
        } else if (rangePlus.location != NSNotFound && rangeMinus.location > rangePlus.location) {
            [self executeOperation:PLUS_OPERATION withResultedString:resultedString];
        }
    } while (YES);
    
    [self evaluateTrigonometricFunctions];
        
    NSString *resultedParenthesisJustNumberString = [self findMatchedStringByPattern:@"[(]{1}[m1234567890.]+[)]{1}" andString:Screen.text];
        if (resultedParenthesisJustNumberString != nil) {
            NSString *resultedParenthesisJustNumber = [self findMatchedStringByPattern:@"[m1234567890.]+" andString:resultedParenthesisJustNumberString];
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedParenthesisJustNumberString withString:resultedParenthesisJustNumber];
        }
     [self evaluateTrigonometricFunctions];
        
     NSString *totalCheck = [self findMatchedStringByPattern:@"[^()]+" andString:Screen.text];
     if ([totalCheck isEqualToString:Screen.text]) break;
    } while (YES);
    
    // Evaluate power
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\^]{1}[m1234567890.]+" andString:Screen.text];
        if (resultedString == nil) break;
        
        [self executeOperation:POWER_OPERATION withResultedString:Screen.text];
    } while (true);
    
    // Evaluate multiplication and division operations (no parenthesis)
    do {
        NSRange rangeMultiply = [Screen.text rangeOfString:@"*"];
        NSRange rangeDivision = [Screen.text rangeOfString:@"/"];
        
        if (rangeMultiply.location == NSNotFound && rangeDivision.location == NSNotFound) break;
        
        if (rangeMultiply.location != NSNotFound && rangeMultiply.location < rangeDivision.location) {
            [self executeOperation:MULTIPLY_OPERATION withResultedString:Screen.text];
        } else if (rangeDivision.location != NSNotFound && rangeMultiply.location > rangeDivision.location) {
            [self executeOperation:DIVISION_OPERATION withResultedString:Screen.text];
        }
    } while  (YES);
    
    do {
        NSRange rangeMinus;
        NSRange rangePlus;
        
        NSString *checkOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\-]{1}[m1234567890.]+" andString:Screen.text];
        if (checkOperationString != nil) {
            rangeMinus = [Screen.text rangeOfString:@"-"];
        } else rangeMinus.location = NSNotFound;
        checkOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\+]{1}[m1234567890.]+" andString:Screen.text];
        if (checkOperationString != nil) {
            rangePlus = [Screen.text rangeOfString:@"+"];
        } else rangePlus.location = NSNotFound;
        
        if (rangeMinus.location == NSNotFound && rangePlus.location == NSNotFound) break;
        
        if (rangeMinus.location != NSNotFound && rangeMinus.location < rangePlus.location) {
            [self executeOperation:MINUS_OPERATION withResultedString:Screen.text];
        } else if (rangePlus.location != NSNotFound && rangeMinus.location > rangePlus.location) {
            [self executeOperation:PLUS_OPERATION withResultedString:Screen.text];
        }
    } while (YES);

    Screen.text = [Screen.text stringByReplacingOccurrencesOfString:@"m" withString:@"-"];
}


// Evaluate one operation
-(void)executeOperation:(int)operation withResultedString:(NSString *)resultedString {
    NSString *resultedOperationString = [[NSString alloc] init];

        float total;
        switch (operation) {
            case MULTIPLY_OPERATION:
                resultedOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\*]{1}[m1234567890.]+" andString:resultedString];
                break;
            case DIVISION_OPERATION:
                resultedOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\/]{1}[m1234567890.]+" andString:resultedString];
                break;
            case MINUS_OPERATION:
                resultedOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\-]{1}[m1234567890.]+" andString:resultedString];
                break;
            case PLUS_OPERATION:
                resultedOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\+]{1}[m1234567890.]+" andString:resultedString];
                break;
            case PERSENT_OPERATION:
                resultedOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\%]{1}[m1234567890.]+" andString:resultedString];
                break;
            case POWER_OPERATION:
                resultedOperationString = [self findMatchedStringByPattern:@"[m1234567890.]+[\\^]{1}[m1234567890.]+" andString:resultedString];
                break;
            default:
                break;
        }
        NSString *savedResultedOperationString = [resultedOperationString copy];
        
    float firstNumber, secondNumber;
        NSString *resultedNumberString = [self findMatchedStringByPattern:@"([m]{1}[1234567890.]+)|([1234567890.]+)" andString:resultedOperationString];
    if ([resultedNumberString containsString:@"m"]) {
        resultedOperationString = [resultedOperationString stringByReplacingOccurrencesOfString:resultedNumberString withString:@"" options:NSLiteralSearch range:[resultedOperationString rangeOfString:resultedNumberString]];
        resultedNumberString = [resultedNumberString stringByReplacingOccurrencesOfString:@"m" withString:@""];
        firstNumber = -[resultedNumberString floatValue];
    } else {
        resultedOperationString = [resultedOperationString stringByReplacingOccurrencesOfString:resultedNumberString withString:@"" options:NSLiteralSearch range:[resultedOperationString rangeOfString:resultedNumberString]];
        firstNumber = [resultedNumberString floatValue];
    }
    
    resultedNumberString = [self findMatchedStringByPattern:@"([m]{1}[1234567890.]+)|([1234567890.]+)" andString:resultedOperationString];
    if ([resultedNumberString containsString:@"m"]) {
        resultedOperationString = [resultedOperationString stringByReplacingOccurrencesOfString:resultedNumberString withString:@"" options:NSLiteralSearch range:[resultedOperationString rangeOfString:resultedNumberString]];
        resultedNumberString = [resultedNumberString stringByReplacingOccurrencesOfString:@"m" withString:@""];
        secondNumber = -[resultedNumberString floatValue];
    } else {
        resultedOperationString = [resultedOperationString stringByReplacingOccurrencesOfString:resultedNumberString withString:@"" options:NSLiteralSearch range:[resultedOperationString rangeOfString:resultedNumberString]];
        secondNumber = [resultedNumberString floatValue];
    }
    
        switch (operation) {
            case MULTIPLY_OPERATION:
                total = firstNumber * secondNumber;
                break;
            case DIVISION_OPERATION:
                total = firstNumber / secondNumber;
                break;
            case MINUS_OPERATION:
                total = firstNumber - secondNumber;
                break;
            case PLUS_OPERATION:
                total = firstNumber + secondNumber;
                break;
            case PERSENT_OPERATION:
                total = (firstNumber * secondNumber) / 100;
                break;
            case POWER_OPERATION:
                total = powf(firstNumber, secondNumber);
            default:
                break;
        }
        if (total < 0)
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:savedResultedOperationString withString:[NSString stringWithFormat:@"m%g", -total] options:NSLiteralSearch range:[Screen.text rangeOfString:savedResultedOperationString]];
        else
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:savedResultedOperationString withString:[NSString stringWithFormat:@"%g", total] options:NSLiteralSearch range:[Screen.text rangeOfString:savedResultedOperationString]];
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
        break;
    }
    return matchText;
}

-(void)evaluateTrigonometricFunctions {
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"ln[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = logf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
    
    // Cos evaluation
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"cos[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = cosf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
    
    // Sin evaluation
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"sin[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = sinf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
    
    // Ctan evaluation
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"ctan[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = 1 / tanf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
    
    // Tan evaluation
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"tan[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = tanf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
    
    // Cosh evaluation
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"cosh[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = coshf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
    
    // Sinh evaluation
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"sinh[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = sinhf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
    
    // Ctanh evaluation
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"ctanh[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = 1 / tanhf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
    
    // Tanh evaluation
    do {
        NSString *resultedString = [self findMatchedStringByPattern:@"tanh[(]{1}[1234567890.m]+[)]{1}" andString:Screen.text];
        if (resultedString == nil) break;
        
        NSString *resultedNumString = [self findMatchedStringByPattern:@"[1234567890.m]+" andString:resultedString];
        float resultedNumber;
        
        if ([resultedNumString containsString:@"m"]) {
            [resultedNumString stringByReplacingOccurrencesOfString:@"m" withString:@""];
            resultedNumber = -[resultedNumString floatValue];
        } else {
            resultedNumber = [resultedNumString floatValue];
        }
        
        float result = tanhf(resultedNumber);
        if (result < 0) {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"m%g", -result]];
        } else {
            Screen.text = [Screen.text stringByReplacingOccurrencesOfString:resultedString withString:[NSString stringWithFormat:@"%g", result]];
        }
    } while (YES);
}

-(void)replaceConstants {
    Screen.text = [Screen.text stringByReplacingOccurrencesOfString:@"E" withString:[NSString stringWithFormat:@"%g", M_E]];
    Screen.text = [Screen.text stringByReplacingOccurrencesOfString:@"PI" withString:[NSString stringWithFormat:@"%g", M_PI]];
}

-(IBAction)allClear:(id)sender{
    
    method = 0;
    selectNumber = 0;
    runningTotal = 0;
    continueCounting = NO;
    
    Screen.text = [NSString stringWithFormat:@""];
    CurrOperLabel.text = [NSString stringWithFormat:@""];
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
        Screen.text = [Screen.text stringByAppendingString:@"("];
        selectNumber = [Screen.text floatValue];
}

- (IBAction)rightParenthesis:(id)sender {
        Screen.text = [Screen.text stringByAppendingString:@")"];
        selectNumber = [Screen.text floatValue];
}

- (IBAction)sinxFunction:(id)sender {
    if ([Screen.text  isEqual: @"0"])
        Screen.text = [NSString stringWithFormat:@"sin("];
    else
        Screen.text = [Screen.text stringByAppendingString:@"sin("];
}

- (IBAction)cosxFunction:(id)sender {
    if ([Screen.text  isEqual: @"0"])
        Screen.text = [NSString stringWithFormat:@"cos("];
    else
        Screen.text = [Screen.text stringByAppendingString:@"cos("];}

- (IBAction)tanxFunction:(id)sender {
    if ([Screen.text  isEqual: @"0"])
        Screen.text = [NSString stringWithFormat:@"tan("];
    else
        Screen.text = [Screen.text stringByAppendingString:@"tan("];
}

- (IBAction)ctanxFunction:(id)sender {
    if ([Screen.text  isEqual: @"0"])
        Screen.text = [NSString stringWithFormat:@"ctan("];
    else
        Screen.text = [Screen.text stringByAppendingString:@"ctan("];}

- (IBAction)clear:(id)sender {
    Screen.text = [Screen.text substringWithRange:NSMakeRange(0, [Screen.text length] - 1)];
}

- (IBAction)sinhFunction:(id)sender {
    Screen.text = [Screen.text stringByAppendingString:@"sinh("];
}

- (IBAction)coshFunction:(id)sender {
    Screen.text = [Screen.text stringByAppendingString:@"cosh("];
}

- (IBAction)tanhFunction:(id)sender {
    Screen.text = [Screen.text stringByAppendingString:@"tanh("];
}

- (IBAction)ctanhFunction:(id)sender {
    Screen.text = [Screen.text stringByAppendingString:@"ctanh("];
}

- (IBAction)power:(id)sender {
    Screen.text = [Screen.text stringByAppendingString:@"^("];
}

- (IBAction)logNatural:(id)sender {
    Screen.text = [Screen.text stringByAppendingString:@"ln("];
}

- (IBAction)constantE:(id)sender {
    Screen.text = [Screen.text stringByAppendingString:@"E"];
}

- (IBAction)constantPi:(id)sender {
    Screen.text = [Screen.text stringByAppendingString:@"PI"];
}

@end
