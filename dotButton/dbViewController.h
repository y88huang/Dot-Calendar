//
//  dbViewController.h
//  dotButton
//
//  Created by Ken Huang on 2014-04-11.
//  Copyright (c) 2014 Ken Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "dbContentViewController.h"
#import "myDot.h"

@interface dbViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong,nonatomic) UIPageViewController *pageViewController;
@property (strong,nonatomic) UIViewController *pageContentViewController;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSArray *month;
@end
