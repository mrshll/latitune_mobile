//
//  KIFTestScenario+LTAdditions.m
//  
//
//  Created by Marshall Moutenot on 11/15/12.
//
//

#import "KIFTestScenario+LTAdditions.h"
#import "KIFTestStep.h"
#import "KIFTestStep+LTAdditions.h"

@implementation KIFTestScenario (LTAdditions)

+ (id) scenarioTrue{
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Always Succeed"];
  [scenario addStep:[KIFTestStep stepThatSucceeds]];
  return scenario;
}

+ (id) scenarioToRegisterUserWithValidData{
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Register User With Valid Data"];
  [scenario addStepsFromArray:[KIFTestStep stepsToRegisterUserWithUsername:@"testuser" email:@"mmoutenot@gmail.com" passwordA:@"testpass" passwordB:@"testpass"]];
  [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Register Submit Button"]];
  [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Instructions View"]];
  [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Close Instructions Button"]];
  return scenario;
}

+ (id) scenarioToRegisterUserWithInvalidEmail{
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Register User With Invalid Email"];
  NSArray *invalidEmails = @[@"test@.com", @"test@gmail", @"test", @"test@g."];
  for (NSString *invalidEmail in invalidEmails) {
    [scenario addStepsFromArray:[KIFTestStep stepsToRegisterUserWithUsername:@"testuser" email:invalidEmail passwordA:@"testpass" passwordB:@"testpass"]];
    [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Register Submit Button"]];
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Invalid Email"]];
    [scenario addStep:[KIFTestStep stepToWaitForAbsenceOfViewWithAccessibilityLabel:@"Invalid Email"]];
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Register View"]];
    [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Authenticate"]];
  }
  return scenario;
}

//+ (id) scenarioToRegisterUserWithInvalidPasswords{
//  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Register User With Invalid Email"];
//  [scenario addStepsFromArray:[KIFTestStep stepsToRegisterUserWithUsername:@"testuser" email:invalidEmail passwordA:@"testpass" passwordB:@"testpass"]];
//  [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Register Submit Button"]];
//  [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Invalid Email"]];
//  [scenario addStep:[KIFTestStep stepToWaitForAbsenceOfViewWithAccessibilityLabel:@"Invalid Email"]];
//  [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Register View"]];
//  return scenario;
//}

+ (id) scenarioToLogIn {
  KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Login User"];
  [scenario addStep:[KIFTestStep stepToCreateDefaultUser]];
  [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Login Button"]];
  [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Login View"]];
  [scenario addStep:[KIFTestStep stepToEnterText:@"testuser" intoViewWithAccessibilityLabel:@"Username field"]];
  [scenario addStep:[KIFTestStep stepToEnterText:@"testpass" intoViewWithAccessibilityLabel:@"Password field"]];
  [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Login Submit Button"]];
  [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Main View"]];
  return scenario;
}

@end
