//
//  AAPTipViewController.m
//  tipster
//
//  Created by Abhishek Prabhudesai on 1/18/14.
//  Copyright (c) 2014 Abhishek Prabhudesai. All rights reserved.
//

#import "AAPTipViewController.h"

@interface AAPTipViewController ()

@property (nonatomic,strong) NSArray *tipAmounts;

- (void)updateValues;

@end

@implementation AAPTipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        self.tipAmounts = @[@(0.1),@(0.15), @(0.20)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.billTextField.delegate = self;
    self.tipControl.selectedSegmentIndex = 1;
    [self.tipControl addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventValueChanged];
    
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    self.navigationItem.rightBarButtonItem = nil;
    return YES;
}

#pragma mark - Private Methods
- (void) onDoneButton{
    [self.view endEditing:YES];
    [self updateValues];
    
}

- (void)updateValues{
    float bill = [self.billTextField.text floatValue];
    float tipPercentage = [self.tipAmounts[self.tipControl.selectedSegmentIndex] floatValue];
    float tip = bill * tipPercentage;
    float total = bill + tip;
    
    //Update Labels
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", total];
}
@end
