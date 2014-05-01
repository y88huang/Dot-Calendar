//
//  dbClockView.h
//  dotButton
//
//  Created by Ken Huang on 2014-04-18.
//  Copyright (c) 2014 Ken Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbLineSegment.h"
@interface dbClockView : UIView
-(id)initWithView:(UIView*)view;
@property (strong,nonatomic) UIButton* addButton;
@property (strong,nonatomic) dbLineSegment* line;
@end
