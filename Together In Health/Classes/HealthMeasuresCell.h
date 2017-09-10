//
//  HealthMeasuresCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/13/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Health;

@interface HealthMeasuresCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* healthLabel;
@property (nonatomic, strong) IBOutlet UITextField* userData;
@property (nonatomic, strong) IBOutlet UITextView* testView;
@property (nonatomic, strong) IBOutlet UIButton* testButton;

@property (nonatomic) BOOL testButtonOn;

@property (nonatomic, strong) Health* health;

-(void)refreshHealthCell;

@end
