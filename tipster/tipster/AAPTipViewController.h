//
//  AAPTipViewController.h
//  tipster
//
//  Created by Abhishek Prabhudesai on 1/18/14.
//  Copyright (c) 2014 Abhishek Prabhudesai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAPTipViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *billTextField;
@property (nonatomic,weak) IBOutlet UILabel *tipLabel;
@property (nonatomic,weak) IBOutlet UILabel *totalLabel;
@property (nonatomic,weak) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onDoneButton;

@end
