//
//  dbContentViewController.h
//  dotButton
//
//  Created by Ken Huang on 2014-04-13.
//  Copyright (c) 2014 Ken Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myDot.h"
@interface dbContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak,nonatomic) NSString  *monthTitle;
@property (weak, nonatomic) IBOutlet UIView *dotContainer;
@property NSUInteger pageIndex;
@property NSMutableArray *dotCollection;

@end
