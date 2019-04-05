//
//  ViewController.m
//  ProgressViewWithIndicator
//
//  Created by Garg, Shweta on 05/04/19.
//  Copyright © 2019 Garg, Shweta. All rights reserved.
//

#import "ViewController.h"

#import "UICustomProgressBar.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UICustomProgressBar *customProgressBar;
@property (nonatomic) NSInteger totalSteps;
@property (nonatomic) NSInteger currentStep;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _currentStep = 0;
    _totalSteps = 5;

    [self.customProgressBar setTotalSteps:5];
    [self.customProgressBar setCurrentStep:0];
    [self.customProgressBar setProgress:0];
}

- (IBAction)previousTapped:(id)sender {
    if (_currentStep != 0) {
        _currentStep--;
    }
    [self.customProgressBar setCurrentStep:_currentStep];
}
- (IBAction)nextTapped:(id)sender {
    if (_currentStep != (_totalSteps - 1)) {
        _currentStep++;
    }
    [self.customProgressBar setCurrentStep:_currentStep];
}

@end
