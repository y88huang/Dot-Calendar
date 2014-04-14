//
//  dbViewController.m
//  dotButton
//
//  Created by Ken Huang on 2014-04-11.
//  Copyright (c) 2014 Ken Huang. All rights reserved.
//

#import "dbViewController.h"

@interface dbViewController ()
@end

@implementation dbViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _month = @[@"January",@"Febuary",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"];
    //init page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"redDotPageViewController"];
    dbContentViewController *startingViewController = [self viewControllerAtIndex:0];
    self.pageViewController.dataSource = self;
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    //Change size
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(dbContentViewController *)viewControllerAtIndex: (NSInteger) index
{
    if(([self.month count]==0)||(index>=[self.month count])){
        return nil;
    }
    dbContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"redDotePageContentViewController"];
    pageContentViewController.monthTitle = self.month[index];
    pageContentViewController.pageIndex = index;
    return pageContentViewController;
}


#pragma mark - Page View Controller Data Source
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((dbContentViewController *) viewController).pageIndex;
    if((index==0)||index == NSNotFound){
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((dbContentViewController *) viewController).pageIndex;
    if(index == NSNotFound){
        return nil;
    }
    index++;
    if (index == [self.month count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

@end
