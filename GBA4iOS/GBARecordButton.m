//
//  GBARecordButton.m
//  GBA4iOS
//
//  Created by Vladimir Ignatev on 25.03.16.
//  Copyright © 2016 Riley Testut. All rights reserved.
//

#import "GBARecordButton.h"

@implementation GBARecordButton

# pragma mark - Drawing functions

- (void)drawRect:(CGRect)rect {
    [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0] setFill];
    UIRectFill(rect);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect insetRect = CGRectInset(rect, self.borderWidth * 0.5, self.borderWidth * 0.5);
    const UIBezierPath* border = [UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:self.roundBorderRadius];
    CGColorRef strokeColor = self.state?[self.borderColorOn CGColor]:[self.borderColorOff CGColor];
    CGContextSetLineWidth(context, self.borderWidth);
    CGContextSetStrokeColorWithColor(context, strokeColor);
    [border stroke];
    
    CGColorRef circleColor = self.state?[self.circleColorOn CGColor ]:[self.circleColorOff CGColor];
    CGContextSetFillColorWithColor(context, circleColor);
    CGContextSetStrokeColorWithColor(context, circleColor);
    CGFloat radius = insetRect.size.height * 0.5 * 0.5;
    CGFloat circleX = rect.size.height * 0.5 + radius * 0.5;
    CGFloat circleY = rect.size.height * 0.5;
    CGContextAddArc(context, circleX, circleY, radius, 0.0, M_PI * 2, YES);
    CGContextFillPath(context);

    CGRect textRect = CGRectInset(insetRect, circleX + radius * 0.5 + circleX, 1.0);

    [self.recLabel setTextColor:(self.state?self.circleColorOn:self.borderColorOff)];
}


# pragma mark - Logic of the control

- (BOOL) isOn {
    return self.state == YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    self.state = !self.state;
    
    if (self.delegate != nil) {
        if (self.state) {
            [self.delegate startRecording];
        } else {
            [self.delegate stopRecording];
        }
    }
}

- (void) setState:(BOOL)newState {
    if ([self isOn] == newState) {
        return;
    }
    
    _state = newState;
    [self setNeedsDisplay];
}

@end
