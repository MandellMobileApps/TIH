//
//  AbstractCusomView.m
//  Traveler1
//
//  Created by Jon Mandell on 4/5/13.
//  Copyright (c) 2013 Jon Mandell. All rights reserved.
//

#import "AbstractCustomView.h"


@interface AbstractCustomView ()




@end

@implementation AbstractCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews
{

}

-(void) updateForOrientationChangeByParent
{
}
-(void) updateForOrientationChange
{}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)prepareForUnload
{
}

-(void)addBorderRounded:(id)object withColor:(UIColor*)color
{

    if ([object isKindOfClass:[UIButton class]])
    {
        UIButton* thisObject = (UIButton*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        [thisObject.layer setCornerRadius:8.0f];
        [thisObject.layer setMasksToBounds:YES];
//        thisObject.layer.shadowColor = [UIColor lightGrayColor].CGColor;
//        thisObject.layer.shadowOffset = CGSizeMake(5.0f,5.0f);
//        thisObject.layer.masksToBounds = NO;
//        thisObject.layer.shadowRadius = 2.0f;
//        thisObject.layer.shadowOpacity = 1.0;
    
    }
    else if ([object isKindOfClass:[UITextField class]])
    {
        UITextField* thisObject = (UITextField*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        [thisObject.layer setCornerRadius:8.0f];
        [thisObject.layer setMasksToBounds:YES];
    
    }
     else if ([object isKindOfClass:[UITextView class]])
    {
        UITextView* thisObject = (UITextView*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        [thisObject.layer setCornerRadius:8.0f];
        [thisObject.layer setMasksToBounds:YES];
    
    }
     else if ([object isKindOfClass:[UILabel class]])
    {
        UILabel* thisObject = (UILabel*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        [thisObject.layer setCornerRadius:8.0f];
        [thisObject.layer setMasksToBounds:YES];
    
    }
     else if ([object isKindOfClass:[UIView class]])
    {
        UIView* thisObject = (UIView*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        [thisObject.layer setCornerRadius:8.0f];
        [thisObject.layer setMasksToBounds:YES];
    
    }
}


@end
