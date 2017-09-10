//
//  MyCollectionViewCell.h
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressViewController.h"

@class Completed;

@interface ProgressCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIButton* myButton;
@property (nonatomic, strong) Completed* completed;

-(IBAction)doneButton:(id)sender;
@property (nonatomic) BOOL myButtonOn;
@property(nonatomic, weak) ProgressViewController* progressViewController;

-(void)refreshCell;
@end
