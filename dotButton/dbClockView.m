//
//  dbClockView.m
//  dotButton
//
//  Created by Ken Huang on 2014-04-18.
//  Copyright (c) 2014 Ken Huang. All rights reserved.
//

#import "dbClockView.h"

@implementation dbClockView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
//        [self setBackgroundColor: myColor];
//        self.opaque = NO;
    }
    return self;
}

-(id)initWithView:(UIView*)view
{
    CGFloat widthX = view.frame.size.width*0.8;
    CGRect newRect = CGRectMake(view.center.x - widthX/2.0, view.center.y-widthX/2.0, widthX, widthX);
    self = [super initWithFrame:newRect];
    self.opaque = NO;
    CGRect buttonRect =CGRectMake(self.frame.size.width/2.0-widthX*0.2/2.0,self.frame.size.height/2.0-widthX*0.2/2.0,widthX*0.2, widthX*0.2);
    self.addButton = [[UIButton alloc] initWithFrame:buttonRect];
    _addButton.layer.cornerRadius = widthX*0.2/2.0;
    [_addButton setBackgroundColor:[UIColor clearColor]];
    [_addButton setTitle:@"+" forState:UIControlStateNormal];
//    _addButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [[_addButton layer] setBorderWidth:1.0];
    [[_addButton layer] setBorderColor:[UIColor whiteColor].CGColor];
//    [self.addButton setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:_addButton];
    //UILabelView
    UILabel *zero = [[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.height/2.0-20, 40, 40)];
    zero.text = @"0";
    [zero setTextColor:[UIColor whiteColor]];
    UILabel *six = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0-20, 0, 40, 40)];
    six.text = @"6";
    [six setTextColor:[UIColor whiteColor]];
    six.textAlignment = NSTextAlignmentCenter;
    UILabel *twelve = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-40, self.frame.size.height/2.0-20, 40, 40)];
    twelve.text = @"12";
    [twelve setTextColor:[UIColor whiteColor]];
    twelve.textAlignment = NSTextAlignmentCenter;
    
    UILabel *sixteen = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0-20, self.frame.size.height-40, 40, 40)];
    sixteen.text = @"18";
    [sixteen setTextColor:[UIColor whiteColor]];
    sixteen.textAlignment = NSTextAlignmentCenter;
    [self addSubview:zero];
    [self addSubview:six];
    [self addSubview:twelve];
    [self addSubview:sixteen];
    self.line = [[dbLineSegment alloc] initWithFrame:CGRectMake(0,0, 40, 1.0)];
    self.line.center = CGPointMake(six.center.x-20, zero.center.y);

    [self addSubview:self.line];
    NSLog(@"%@", [NSValue valueWithCGPoint:self.center]);
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
     CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
     UIColor *myColor = [UIColor colorWithRed:255/255.0 green:52/255.0 blue:74/255.0 alpha:1.0];
    CGContextSetFillColor(ctx, CGColorGetComponents([myColor CGColor]));
    CGContextFillPath(ctx);
}

-(CGFloat) getDistanceFrom: (CGPoint) Point1 to: (CGPoint) Point2{
    float a = powf((Point1.x - Point2.x), 2);
    float b = powf((Point2.y - Point2.y), 2);
    return sqrtf(a+b);
}

-(BOOL)isTouchInsideView:(CGPoint)touchLocation{
    CGFloat x = self.frame.size.width/2.0;
    CGFloat y = self.frame.size.height/2.0;
    CGPoint center = {x,y};
    CGFloat distance = [self getDistanceFrom:center to:touchLocation];
    CGFloat widthX = self.frame.size.width;
    NSLog(@"the dist is %f",distance);
    if (distance >=widthX){
        NSLog(@"NONONON");
        return NO;
    }

    
//    self.line.layer.anchorPoint = CGPointMake(1.0f, 0);
    [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse animations:^(){
        CGFloat x = self.frame.size.width/2.0-self.line.frame.origin.x - self.line.frame.size.width/2.0;
        CGFloat y = 0.0;
        
        CGAffineTransform transform = CGAffineTransformMakeTranslation(x, y);
            transform = CGAffineTransformRotate(transform,M_PI);
            transform = CGAffineTransformTranslate(transform, -x, -y);
        self.line.transform = transform;
    }completion:nil];
//    NSLog(@"kkk");
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
    if([self isTouchInsideView:touchLocation]==NO){
        NSLog(@"is NOT IN view");
        [self removeFromSuperview];
    }
    else{
    }
}
-(BOOL)canBecomeFirstResponder
{
    return YES;
}


@end
