//
//  TempConverterViewController.h
//  temperatureConverter
//
//  Created by Abhishek Prabhudesai on 1/19/14.
//  Copyright (c) 2014 Abhishek Prabhudesai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempConverterViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitText;
@property (weak, nonatomic) IBOutlet UITextField *celsiusText;
@property (weak, nonatomic) IBOutlet UIButton *convertBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segCtrl;
- (IBAction)onDoneBtn;

@end
