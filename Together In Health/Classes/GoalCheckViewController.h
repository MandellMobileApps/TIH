//
//  GoalCheckViewController.h
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "AbstractViewController.h"

@interface GoalCheckViewController : AbstractViewController

@property (nonatomic, strong) Goal *goal;

@property (nonatomic,strong) IBOutlet UIButton* checkButton;
@property (nonatomic,strong) IBOutlet UILabel* goalTitleLabel;
@property (nonatomic,strong) IBOutlet UITextView* textViewGoalCheck;
@property (nonatomic,strong) IBOutlet UITextView* textViewGoalCheck2;
@property (strong, nonatomic) IBOutlet UISegmentedControl *checkConfident;
@property (strong, nonatomic) IBOutlet UISegmentedControl *checkImportant;
@property (nonatomic,strong) NSArray* numberTypeArray;
@property (nonatomic) BOOL checkButtonOn;
@property (nonatomic, strong) IBOutlet UIScrollView* thisScrollView;

-(IBAction)goalCheck;

-(IBAction)segmentImportant:(id)sender;
-(IBAction)segmentConfident:(id)sender;
@property (nonatomic) NSUInteger importantRating;
@property (nonatomic) NSUInteger confidentRating;

@end
