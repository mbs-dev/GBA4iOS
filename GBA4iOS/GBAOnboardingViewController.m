//
//  GBAOnboardingViewController.m
//  GBA4iOS
//
//  Created by Vladimir Ignatev on 06.04.16.
//  Copyright © 2016 Riley Testut. All rights reserved.
//

#import "GBAOnboardingViewController.h"

#import "OnboardingContentViewController.h"
#import "OnboardingViewController.h"
#import "GBAAnalyticsTracker.h"

@implementation GBAOnboardingViewController

+ (void)followBuildStore {
    NSArray *urls = [NSArray arrayWithObjects:
                     @"twitter://user?screen_name={handle}", // Twitter
                     @"tweetbot:///user_profile/{handle}", // TweetBot
                     @"echofon:///user_timeline?{handle}", // Echofon
                     @"twit:///user?screen_name={handle}", // Twittelator Pro
                     @"x-seesmic://twitter_profile?twitter_screen_name={handle}", // Seesmic
                     @"x-birdfeed://user?screen_name={handle}", // Birdfeed
                     @"tweetings:///user?screen_name={handle}", // Tweetings
                     @"simplytweet:?link=http://twitter.com/{handle}", // SimplyTweet
                     @"icebird://user?screen_name={handle}", // IceBird
                     @"fluttr://user/{handle}", // Fluttr
                     @"http://twitter.com/{handle}",
                     nil];
    
    UIApplication *application = [UIApplication sharedApplication];
    
    for (NSString *candidate in urls) {
        NSURL *url = [NSURL URLWithString:[candidate stringByReplacingOccurrencesOfString:@"{handle}"
                                                                               withString:@"builds_io"]];
        if ([application canOpenURL:url]) {
            [application openURL:url];
            
            [GBAAnalyticsTracker trackEventWithCategory:@"Onboarding" action:@"Entered Twitter" label:@"User entered 'Follow' scenario"];
            // Stop trying after the first URL that succeeds
            return;
        }
    }
}


+ (OnboardingViewController*)generateOnboardingViewControllerWithSkipHandler:(dispatch_block_t)skipHandler {
    NSArray<OnboardingContentViewController*> * pages = @[
      [OnboardingContentViewController contentWithTitle:@"Congratulations!"
                                                   body:@"In your hands is the incredible Gameboy emulator GBA4iOS"
                                                  image:[UIImage imageNamed:@"onboarding-welcome"]
                                             buttonText:nil
                                                 action:nil],
      
//      [OnboardingContentViewController contentWithTitle:@"Install ROMs easily"
//                                                   body:@"Choose from thousands of game ROMs online or upload them via Dropbox"
//                                                  image:[UIImage imageNamed:@"onboarding-roms"]
//                                             buttonText:nil
//                                                 action:nil],
      
      [OnboardingContentViewController contentWithTitle:@"Let's play"
                                                   body:@"Record gameplay screencasts and share them with friends"
                                                  image:[UIImage imageNamed:@"onboarding-recbutton"]
                                             buttonText:nil
                                                 action:nil],
      
      [OnboardingContentViewController contentWithTitle:@"Play hard"
                                                   body:@"GBA4iOS supports many gamepads made specifically for your iOS device"
                                                  image:[UIImage imageNamed:@"onboarding-gamepads"]
                                             buttonText:nil
                                                 action:nil],
      
      [OnboardingContentViewController contentWithTitle:@"Join the Club"
                                                   body:@"GBA4iOS is brought to you by Builds.io. Join the great community!"
                                                  image:[UIImage imageNamed:@"onboarding-buildstore"]
                                             buttonText:@"Follow @builds_io"
                                                 action:^{
                                                     [self.class followBuildStore];
                                                 }]
      ];
    
    
    OnboardingViewController *onboardingVC = [OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@"onboarding-background"]
                                                                                         contents:pages];
    onboardingVC.shouldFadeTransitions = YES;
    onboardingVC.fadePageControlOnLastPage = YES;
    onboardingVC.titleFontSize = 28;
    onboardingVC.bodyFontSize = 22;
    onboardingVC.topPadding = 40.0;
    onboardingVC.underIconPadding = 50.0;
    onboardingVC.shouldMaskBackground = NO;
    onboardingVC.titleTextColor = [UIColor blackColor];
    onboardingVC.bodyTextColor = [UIColor blackColor];
    onboardingVC.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    onboardingVC.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [onboardingVC.skipButton setTitle:@"Skip" forState:UIControlStateNormal];
    [onboardingVC.skipButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    // If you want to allow skipping the onboarding process, enable skipping and set a block to be executed
    // when the user hits the skip button.
    onboardingVC.allowSkipping = YES;
    onboardingVC.skipHandler = skipHandler;
    onboardingVC.buttonTextColor = [UIColor colorWithRed:52/255.0 green:137/255.0 blue:227/255.0 alpha:1.0];
    
    return onboardingVC;
}


-(id)initWithSkipHandler:(dispatch_block_t) skipHandler {
    self = [super init];
    
    if (self) {
        self.onboardingVC = [self.class generateOnboardingViewControllerWithSkipHandler:skipHandler];
        [self addChildViewController:self.onboardingVC];
        self.onboardingVC.view.frame = self.view.frame;
        [self.view addSubview:self.onboardingVC.view];
//        [self.onboardingVC didMoveToParentViewController:self];

    }
    
    return self;
}

-(BOOL)shouldAutorotate {
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }
    else {
        return NO;
    }
}
@end
