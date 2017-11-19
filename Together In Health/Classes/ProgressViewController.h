//
//  ProgressViewController.h
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//


#import "AbstractViewController.h"

enum goalNumber {
    goal1 = 1,
    goal2 = 2,
    goal3 = 3,
    
};

@class Completed;
@class MyCollectionViewCell;
@class ProgressCollectionView;
@class ViewControllerGoal1;

@interface ProgressViewController : AbstractViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) int goalNumber;
@property (nonatomic, strong) Goal *goal;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet UISegmentedControl* changeGoalSegment;


@property (nonatomic, weak) ViewControllerGoal1* viewControllerGoal1;
@property (nonatomic, weak) ProgressCollectionView* progressCollectionView;

@property (nonatomic, strong) IBOutlet UIScrollView* thisScrollView;

@property (nonatomic, strong) NSMutableArray* complete;

@property (nonatomic, strong) IBOutlet UITextField* textFieldBy;
@property (nonatomic, strong) IBOutlet UITextField* textFieldBy2;


@property (nonatomic, strong) IBOutlet UIView *baseContentView;
//
//-(void) saveGoal1Persistent;
//-(void) loadGoal1Persistent;
//-(void) saveGoal2Persistent;
//-(void) loadGoal2Persistent;
//-(void) saveGoal3Persistent;
//-(void) loadGoal3Persistent;

@property (nonatomic, strong) IBOutlet UIButton* refreshProgressButton;
-(IBAction)refreshProgress:(id)sender;
-(IBAction)changeGoal:(id)sender;
-(IBAction)goal:(id)sender;
-(IBAction)gamePlan:(id)sender;


- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile;
- (NSString *)dataFilePathofBundle:(NSString *)nameoffile;
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

@end
