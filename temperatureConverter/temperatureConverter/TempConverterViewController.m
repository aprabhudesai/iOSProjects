//
//  TempConverterViewController.m
//  temperatureConverter
//
//  Created by Abhishek Prabhudesai on 1/19/14.
//  Copyright (c) 2014 Abhishek Prabhudesai. All rights reserved.
//

#import "TempConverterViewController.h"

@interface TempConverterViewController ()

- (void) convertTemperature;

@end

@implementation TempConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CALayer *btnLayer = [self.convertBtn layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    
    self.fahrenheitText.delegate = self;
    self.celsiusText.delegate = self;
    [self.convertBtn addTarget:self action:@selector(convertTemperature) forControlEvents:UIControlEventTouchUpInside];
    [self.segCtrl addTarget:self action:@selector(convertTemperature) forControlEvents:UIControlEventValueChanged];
    self.segCtrl.selectedSegmentIndex = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneBtn)];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    self.navigationItem.rightBarButtonItem = nil;
    return YES;
}

#pragma mark Private Methods
- (void)onDoneBtn{
    
    [self.view endEditing:YES];
}

-(void)convertTemperature{
    
    if(self.segCtrl.selectedSegmentIndex == 0){
    float fahrenheitInput = [self.fahrenheitText.text floatValue];
    float celsiusInput = (fahrenheitInput - 32.0) * 5/9;
    
    self.celsiusText.text = [NSString stringWithFormat: @"%0.2f", celsiusInput];

    }
    else{
    
        float celsiusInput = [self.celsiusText.text floatValue];
        float fahrenheitInput = (celsiusInput
                                 * 9/5) + 32.0;
        
        self.fahrenheitText.text = [NSString stringWithFormat: @"%0.2f", fahrenheitInput];
    }
}
@end