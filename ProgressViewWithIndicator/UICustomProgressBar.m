//
//  UICustomProgressBar.m
//  ModifiedProgressView
//
//  Created by Garg, Shweta on 21/03/19.
//  Copyright © 2019 Garg, Shweta. All rights reserved.
//

#import "UICustomProgressBar.h"

@interface UICustomProgressBar ()

@property (strong, nonatomic) UIView* progressIndicator;

@property (nonatomic) NSInteger totalSteps;
@property (nonatomic) NSInteger currentStep;

@end

@implementation UICustomProgressBar

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setGradientImageAsProgressImage];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setGradientImageAsProgressImage];
    }
    return self;
}

- (void)setTotalSteps:(NSInteger)totalSteps {
    _totalSteps = totalSteps;
    if (_totalSteps > 0) {
        [self addGreenIndicatorOnProgressBar];
    }
}

- (void)setCurrentStep:(NSInteger)currentStep {
    _currentStep = currentStep;
    float progress = (((float)_currentStep))/((float)_totalSteps);
    [self setProgress:progress];
    [self updateProgressIndicatorFrame];
}

/**
 * Create horizontal gradient and set it to progressbar's progress image
 */
- (void)setGradientImageAsProgressImage {
    CGSize size = CGSizeMake(self.bounds.size.width, 2);
    CAGradientLayer* layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(0, 0, size.width, size.height);
    layer.colors = @[(__bridge id)[UIColor whiteColor].CGColor,  // start color
                     (__bridge id)[UIColor whiteColor].CGColor,
                     (__bridge id)[UIColor colorWithRed:0.21f green:0.20f blue:0.21f alpha:1.0f].CGColor]; // end color
    layer.locations = @[@0.f, @0.35f, @1.f];
    layer.startPoint = CGPointMake(0.f, 0.5f); //end point of start gradient
    layer.endPoint = CGPointMake(1.f, 0.5f); // end point of end gradient

    @autoreleasepool {
        UIGraphicsBeginImageContext(size);
        @try {
            [layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
            self.progressImage = image;
        } @finally {
            UIGraphicsEndImageContext();
        }
    }
}

// add green rounded corner rectangle to the progress bar
- (void)addGreenIndicatorOnProgressBar {
    if (_progressIndicator) {
        [self updateProgressIndicatorFrame];
        return;
    }

    CGFloat width = (_totalSteps != 0) ? self.bounds.size.width/_totalSteps : 0.f;
    CGFloat height = 8.f;

    CGFloat x = self.bounds.origin.x;
    CGFloat y = -(height - self.bounds.size.height)/2;

    _progressIndicator = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    _progressIndicator.backgroundColor = [UIColor colorWithRed:0.36 green:0.72 blue:0.23 alpha:1.0];
    _progressIndicator.layer.cornerRadius = 4.f;
    _progressIndicator.layer.masksToBounds = YES;
    [self addSubview:_progressIndicator];
}

- (void)updateProgressIndicatorFrame {
    CGFloat width = (_totalSteps != 0) ? self.bounds.size.width/_totalSteps : 0.f;

    CGFloat x = self.bounds.origin.x + (_currentStep * width);
    _progressIndicator.frame = CGRectMake(x, _progressIndicator.frame.origin.y, width, _progressIndicator.bounds.size.height);
}

@end
