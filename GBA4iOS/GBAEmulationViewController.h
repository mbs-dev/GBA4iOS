//
//  GBAEmulationViewController.h
//  GBA4iOS
//
//  Created by Riley Testut on 7/19/13.
//  Copyright (c) 2013 Riley Testut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReplayKit/ReplayKit.h>

#import "GBAROM.h"
#import "GBARecordButton.h"

@interface GBAEmulationViewController : UIViewController <RPScreenRecorderDelegate, RPPreviewViewControllerDelegate, GBARecordButtonDelegate>

@property (strong, nonatomic) GBAROM *rom;
@property (assign, nonatomic) CGFloat blurAlpha;
@property (strong, nonatomic) UIImageView *blurredContentsImageView;

@property (strong, nonatomic) IBOutlet GBARecordButton *recordButton;
@property (strong, nonatomic) IBOutlet UILabel *buildsioLabel;

@property (strong, nonatomic) RPScreenRecorder *replayRecorder;
@property (strong, nonatomic) RPPreviewViewController *previewViewController;

@property (assign, nonatomic) BOOL isRecording;

- (void)showSplashScreen;

- (void)blurWithInitialAlpha:(CGFloat)alpha;
- (void)removeBlur;

- (void)refreshLayout;

- (void)pauseEmulation;
- (void)resumeEmulation;

- (void)prepareAndPresentViewController:(UIViewController *)viewController;
- (void)prepareForDismissingPresentedViewController:(UIViewController *)dismissedViewController;

- (void)autoSaveIfPossible;

- (void)launchGameWithCompletion:(void (^)(void))completionBlock;

- (IBAction)startRecording:(id) sender;
- (IBAction)stopRecording:(id) sender;


@end
