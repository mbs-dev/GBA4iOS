//
//  GBARecordButton.h
//  GBA4iOS
//
//  Created by Vladimir Ignatev on 25.03.16.
//  Copyright © 2016 Riley Testut. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@protocol GBARecordButtonDelegate

- (void) startRecording;
- (void) stopRecording;

@end


@interface GBARecordButton : UIView

#pragma mark - Styling properties

@property(nonatomic, copy) IBInspectable UIColor* borderColorOn;
@property(nonatomic, copy) IBInspectable UIColor* borderColorOff;
@property(strong, nonatomic) IBInspectable UIColor* circleColorOn;
@property(strong, nonatomic) IBInspectable UIColor* circleColorOff;

@property(nonatomic) IBInspectable CGFloat borderWidth;
@property(nonatomic) IBInspectable CGFloat roundBorderRadius;

@property(strong, nonatomic) IBOutlet UILabel* recLabel;

@property(nonatomic, setter=setState:) IBInspectable BOOL state;

@property(nonatomic, weak) id<GBARecordButtonDelegate> delegate;

#pragma mark - Events

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event;

- (BOOL) isOn;
- (void) setState:(BOOL)newValue;

@end
