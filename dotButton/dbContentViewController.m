//
//  dbContentViewController.m
//  dotButton
//
//  Created by Ken Huang on 2014-04-13.
//  Copyright (c) 2014 Ken Huang. All rights reserved.
//

#import "dbContentViewController.h"

@interface dbContentViewController ()

@end

@implementation dbContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.monthLabel.text = self.monthTitle;
    if(!self.dotCollection){
        self.dotCollection = [[NSMutableArray alloc] init];
    }
//    self.dotContainer.alpha = 0.0;
    [self.dotContainer setBackgroundColor:[UIColor clearColor]];
    if(self.dotContainer){
        [self createCollectionOfDotWithView:self.dotContainer onArray:self.dotCollection having:31];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - settingUpDots
-(void)createCollectionOfDotWithView:(UIView *)dotContainer onArray:(NSMutableArray *)dotCollection having:(NSUInteger)numberOfDots
{
    NSUInteger numberOfRows = numberOfDots/7;
    NSUInteger numberOfCols = 7;
    NSUInteger gap = 15;
    float dotWidth = 25;
    float containerX = 0;
    float containerY = 0;
    if(numberOfDots%7!=0) {
        numberOfRows++;
    }
    for(NSUInteger i=0; i<numberOfRows;i++){
        if(i==numberOfRows-1){
            numberOfCols = numberOfDots%7;
        }
        for (NSUInteger j=0; j<numberOfCols; j++) {
            float x = j*(dotWidth+gap)+containerX;
            float y = i*(dotWidth+gap)+containerY;
            CGRect rect = CGRectMake(x, y, dotWidth, dotWidth);
            myDot* tmpDot = [[myDot alloc] initWithFrame:rect];
            [tmpDot addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown|UIControlEventTouchDragEnter];
            [tmpDot addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchDragExit];
            UIColor *myColor = [UIColor colorWithRed:255/255.0 green:52/255.0 blue:74/255.0 alpha:1.0];
            [tmpDot setBackgroundColor: myColor];
            [dotCollection addObject:tmpDot];
            [self.dotContainer addSubview:tmpDot];
        }
    }
}
#pragma mark - touchEvent
-(void)touchDown:(id)sender{
    myDot *dot = sender;
    NSInteger index = [self.dotCollection indexOfObject:sender];
    NSLog(@"%d",index);
    dot.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^(){
        dot.transform= CGAffineTransformMakeScale(1.0, 1.0);
    } completion:nil];
    [self spreadOutForIndex:index withMagnitude:7.5];
}
-(void)touchUp:(id)sender{
    myDot *dot = sender;
    NSInteger index = [self.dotCollection indexOfObject:sender];
    dot.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^(){
        dot.transform= CGAffineTransformMakeScale(1.0, 1.0);
    } completion:nil];
    [self huddleUpForIndex:index];
    NSLog(@"%f",dot.frame.size.height);
    NSLog(@"%f",dot.bounds.size.height);
}


#pragma mark - spreadOutDotMethod
-(void)spreadOutForIndex:(NSInteger)index withMagnitude:(CGFloat) mag{
    NSInteger left = index -1;
    NSInteger right = index+1;
    NSInteger top = index-7;
    NSInteger down = index+7;
    NSInteger topLeft = index-8;
    NSInteger topRight = index-6;
    NSInteger downLeft = index+6;
    NSInteger downRight = index+8;
    if(left>=0&&index%7!=0){
        myDot *leftDot = [self.dotCollection objectAtIndex:left];
        [self translate:leftDot For:-mag and:0];
    }
    if (right%7!=0&&right<[self.dotCollection count]){
        myDot *rightDot = [self.dotCollection objectAtIndex:right];
        [self translate:rightDot For:mag and:0];
    }
    if (top>=0){
        myDot *topDot = [self.dotCollection objectAtIndex:top];
        [self translate:topDot For:0 and:-mag];
    }
    if (down<[self.dotCollection count]){
        myDot *downDot = [self.dotCollection objectAtIndex:down];
        [self translate:downDot For:0 and:mag];
    }
    if(topLeft>=0&&top%7!=0){
        myDot *topLeftDot = [self.dotCollection objectAtIndex:topLeft];
        [self translate:topLeftDot For:-mag and:-mag];
    }
    if(topRight%7!=0&&topRight>=0){
        myDot *topRightDot = [self.dotCollection objectAtIndex:topRight];
        [self translate:topRightDot For:mag and:-mag];
    }
    if(downLeft<[self.dotCollection count]&&down%7!=0){
        myDot *downLeftDot = [self.dotCollection objectAtIndex:downLeft];
        [self translate:downLeftDot For:-mag and:mag];
    }
    if(downRight<[self.dotCollection count]&&downRight%7!=0){
        myDot *downRightDot = [self.dotCollection objectAtIndex:downRight];
        [self translate:downRightDot For:mag and:mag];
    }
}
-(void)huddleUpForIndex:(NSInteger)index{
    NSInteger left = index -1;
    NSInteger right = index+1;
    NSInteger top = index-7;
    NSInteger down = index+7;
    NSInteger topLeft = index-8;
    NSInteger topRight = index-6;
    NSInteger downLeft = index+6;
    NSInteger downRight = index+8;
    if(left>=0&&index%7!=0){
        myDot *leftDot = [self.dotCollection objectAtIndex:left];
        [self translate:leftDot For:0 and: 0 ];
    }
    if (right%7!=0&&right<[self.dotCollection count]){
        myDot *rightDot = [self.dotCollection objectAtIndex:right];
        [self translate:rightDot For:0 and: 0];
    }
    if (top>=0){
        myDot *topDot = [self.dotCollection objectAtIndex:top];
        [self translate:topDot For:0 and:0];
    }
    if (down<[self.dotCollection count]){
        myDot *downDot = [self.dotCollection objectAtIndex:down];
        [self translate:downDot For:0 and:0];
    }
    if(topLeft>=0&&top%7!=0){
        myDot *topLeftDot = [self.dotCollection objectAtIndex:topLeft];
        [self translate:topLeftDot For:0 and:0];
    }
    if(topRight%7!=0&&topRight>=0){
        myDot *topRightDot = [self.dotCollection objectAtIndex:topRight];
        [self translate:topRightDot For:0 and:0];
    }
    if(downLeft<[self.dotCollection count]&&down%7!=0){
        myDot *downLeftDot = [self.dotCollection objectAtIndex:downLeft];
        [self translate:downLeftDot For:0 and:0];
    }
    if(downRight<[self.dotCollection count]&&downRight%7!=0){
        myDot *downRightDot = [self.dotCollection objectAtIndex:downRight];
        [self translate:downRightDot For:0 and:0];
    }
}

-(void)translate:(myDot *)button For:(NSInteger) x and:(NSInteger) y{
    [UIView animateWithDuration:0.5 animations:^(){
        button.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, x,y);
    }completion:nil];
}
@end
