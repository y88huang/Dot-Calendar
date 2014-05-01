//
//  dbLineSegment.m
//  dotButton
//
//  Created by Ken Huang on 2014-04-20.
//  Copyright (c) 2014 Ken Huang. All rights reserved.
//

#import "dbLineSegment.h"

@implementation dbLineSegment

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 2.0);
//    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
//    CGFloat components[] = {0.0, 0.0, 0.0, 1.0};
//    CGColorRef color = CGColorCreate(colorspace, components);
//    CGContextSetStrokeColorWithColor(context, color);
////    CGContextMoveToPoint(context, 30, 30);
////    CGContextAddLineToPoint(context, 300, 400);
//    CGContextStrokePath(context);
//    CGColorSpaceRelease(colorspace);
//    CGColorRelease(color);
//}

@end
