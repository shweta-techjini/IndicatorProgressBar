//
//  UICustomProgressBar.h
//  ModifiedProgressView
//
//  Created by Garg, Shweta on 21/03/19.
//  Copyright © 2019 Garg, Shweta. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface UICustomProgressBar : UIProgressView

- (void)setTotalSteps:(NSInteger)totalSteps;
- (void)setCurrentStep:(NSInteger)currentStep;

@end

NS_ASSUME_NONNULL_END
