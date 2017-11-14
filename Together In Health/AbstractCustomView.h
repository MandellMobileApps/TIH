//
//  AbstractCusomView.h
//  Traveler1
//
//  Created by Jon Mandell on 4/5/13.
//  Copyright (c) 2013 Jon Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AbstractCustomView : UIView

@property(nonatomic,weak) AppDelegate* appDelegate;

-(void)setupSubviews;
-(void)prepareForUnload;
-(void)addBorderRounded:(id)object withColor:(UIColor*)color;
-(void) updateForOrientationChangeByParent;
@end
