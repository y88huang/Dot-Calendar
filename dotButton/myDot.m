//
//  myDot.m
//  dotButton
//
//  Created by Ken Huang on 2014-04-12.
//  Copyright (c) 2014 Ken Huang. All rights reserved.
//

#import "myDot.h"

@implementation myDot

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.cornerRadius = frame.size.width/2.0;
        UIColor *myColor = [UIColor colorWithRed:255/255.0 green:52/255.0 blue:74/255.0 alpha:1.0];
        [self setBackgroundColor: myColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    //set new bounds
    CGFloat boundsExtension = 5.0f;
    CGRect outerBounds = CGRectInset(self.bounds, -1 * boundsExtension, -1 * boundsExtension);
    // 判断触摸位置
    BOOL touchOutside = !CGRectContainsPoint(outerBounds, [touch locationInView:self]);
    if(touchOutside)
    {
        // 判断是UIControlEventTouchDragExit/UIControlEventTouchDragOutside
        BOOL previousTouchInside = CGRectContainsPoint(outerBounds, [touch previousLocationInView:self]);
        if(previousTouchInside)
        {
            [self sendActionsForControlEvents:UIControlEventTouchDragExit];
        }else
        {
            [self sendActionsForControlEvents:UIControlEventTouchDragOutside];
        }
    }
    if(!touchOutside){
        BOOL previousTouchInside = CGRectContainsPoint(outerBounds, [touch previousLocationInView:self]);
        if(previousTouchInside){
            [self sendActionsForControlEvents:UIControlEventTouchDragEnter];
        }else{
            [self sendActionsForControlEvents:UIControlEventTouchDragInside];
        }
    }
    // 如果不是想要修改的control event，返回原操作
    return [super continueTrackingWithTouch:touch withEvent:event];
}

@end
