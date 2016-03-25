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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    UIBezierPath* border = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, self.borderWidth, self.borderWidth) cornerRadius:self.roundBorderRadius];
    
    CGContextSetStrokeColorWithColor(context, [self.on?self.borderColorOn:self.borderColorOff CGColor]);
    [border stroke];
    
    CGContextRestoreGState(context);
    
    CGColorRef circleColor = [self.on?self.circleColorOn:self.circleColorOff CGColor];
    CGContextSetFillColorWithColor(context, circleColor);
    CGContextSetStrokeColorWithColor(context, [self.on?self.circleColorOn:self.circleColorOff CGColor]);
    
    CGContextAddArc(context, 8.0, 8.0, 6.0, 0.0, M_PI * 2, YES);
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
    
    
}


-(BOOL) isOn {
    return self.on == YES;
}

# pragma mark - Component logic

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    self.on = !self.on;
    
    if (self.on) {
        
    }
}

@end
