//
//  GBAOnboardingViewController.h
//  GBA4iOS
//
//  Created by Vladimir Ignatev on 06.04.16.
//  Copyright © 2016 Riley Testut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBAOnboardingViewController : UIViewController

@property(nonatomic,retain) UIViewController* onboardingVC;

-(id)initWithSkipHandler:(dispatch_block_t) skipHandler;

@end
