//
//  CheckBoxView.m
//  Traveler1
//
//  Created by Jon Mandell on 11/16/13.
//  Copyright (c) 2013 Jon Mandell. All rights reserved.
//

#import "CheckBoxView.h"

#define EmptyCheckBox @"checkbox-empty.V2"
#define FilledCheckMark @"checkbox-filled"


@interface CheckBoxView ()

@property(nonatomic,strong) UIImageView* checkboxImageView;
@property(nonatomic,strong) UIButton* checkboxButton;

-(void) checkBoxStatusChanged;

@end

@implementation CheckBoxView

@synthesize checkboxDelegate = _checkboxDelegate;
@synthesize checked = _checked;

+(CheckBoxView*) checkboxWithFrame:(CGRect)frame isChecked:(BOOL)isChecked delegate:(id)delegate tag:(int)thisTag
{
	CheckBoxView* temp = [[CheckBoxView alloc] initWithFrame:frame];
    temp.checkboxDelegate = delegate;
    temp.tag = thisTag;
    temp.checked = isChecked;
    temp.changeMade = NO;

	return temp;
}

-(void) awakeFromNib
{
    [super awakeFromNib];
    self.checkboxButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkboxButton.frame = self.bounds;
    [self.checkboxButton addTarget:self action:@selector(checkBoxStatusChanged) forControlEvents:UIControlEventTouchUpInside];
    self.checkboxImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.checkboxImageView.image = [UIImage imageNamed:EmptyCheckBox];
	self.checked = NO;
    self.changeMade = NO;
    [self addSubview:self.checkboxImageView];
    [self addSubview:self.checkboxButton];


}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.checkboxButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.checkboxButton.frame = self.bounds;
        [self.checkboxButton addTarget:self action:@selector(checkBoxStatusChanged) forControlEvents:UIControlEventTouchUpInside];
        self.checkboxImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.checkboxImageView.image = [UIImage imageNamed:EmptyCheckBox];
        self.changeMade = NO;

        [self addSubview:self.checkboxImageView];
        [self addSubview:self.checkboxButton];
        
    }
    return self;
}

-(void) checkBoxStatusChanged
{
self.changeMade = YES;

    if (self.checked)
    {
    	self.checked = NO;
        self.checkboxImageView.image = [UIImage imageNamed:EmptyCheckBox];
    }
    else
    {
    	self.checked = YES;
        self.checkboxImageView.image = [UIImage imageNamed:FilledCheckMark];
    }
	if (self.checkboxDelegate)
    {
        if ([self.checkboxDelegate respondsToSelector:@selector(checkBoxStatusChanged:)])
        {
            [self.checkboxDelegate checkBoxStatusChanged:self];
            
        }
    }
}


-(void) setChecked:(BOOL)checked  // overrides the setter method
{

    _checked = checked;
    if (self.checked)
    {
        self.checkboxImageView.image = [UIImage imageNamed:FilledCheckMark];
    }
    else
    {
        self.checkboxImageView.image =[UIImage imageNamed:EmptyCheckBox];
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
