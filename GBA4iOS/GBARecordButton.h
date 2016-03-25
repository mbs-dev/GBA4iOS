//
//  GBARecordButton.h
//  GBA4iOS
//
//  Created by Vladimir Ignatev on 25.03.16.
//  Copyright © 2016 Riley Testut. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface GBARecordButton : UIView

@property(nonatomic, copy) IBInspectable UIColor* borderColorOn;
@property(nonatomic, copy) IBInspectable UIColor* borderColorOff;
@property(strong, nonatomic) IBInspectable UIColor* circleColorOn;
@property(strong, nonatomic) IBInspectable UIColor* circleColorOff;
//@property(strong, nonatomic) IBInspectable UIColor* textColorOn;
//@property(strong, nonatomic) IBInspectable UIColor* textColorOff;

@property(nonatomic) IBInspectable CGFloat borderWidth;
@property(nonatomic) IBInspectable CGFloat roundBorderRadius;

@property(nonatomic, getter=isOn) IBInspectable BOOL on;

- (IBAction)valueChanged:(id)sender;
- (IBAction)userTapped:(id)sender;

@end
