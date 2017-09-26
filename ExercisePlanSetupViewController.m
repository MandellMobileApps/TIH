//
//  ExercisePlanSetupViewController.m
//  Together In Health
//
//  Created by Cami Mandell on 9/18/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import "ExercisePlanSetupViewController.h"

@interface ExercisePlanSetupViewController ()

@end

@implementation ExercisePlanSetupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //	UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelData:)];
    self.navigationController.navigationBar.hidden = YES;
    
    UIImage* image = [UIImage imageNamed:@"QuestionMark.png"];
    
    CGRect frameimg = CGRectMake(0, 0, 30, 40);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(plateBreakdown:)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    
    [self.navigationItem setRightBarButtonItem:barBtn];
    
    self.goalArray = [NSArray arrayWithObjects:
                      @"Build Muscle",
                      @"", nil];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
  //  [self.thisCollectionView reloadData];
    
}


- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {

    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    switch (section) {
//        case 0:
//            return self.goalArray.count;
//            break;
//        case 1:
//            return self.activityArray.count;
//            break;
//        case 2:
//            return self.timeArray.count;
//            break;
//        default:
//            break;
//            
//    }
//    return 0;
    
    return 4;
}

-(UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    
//    switch (self.appDelegate.subscriptionLevel) {
//            
//        case SubscriptionPaid1:
//            
//            if (section == 0)
//            {
//                return UIEdgeInsetsMake(20, 20, 65, 5);
//            }
//            
//            break;
//        case SubscriptionPaid2:
//            
//            if (section == 0)
//            {
//                return UIEdgeInsetsMake(20, 20, 65, 5);
//            }
//            break;
//        default:
//            break;
//    }
    return UIEdgeInsetsMake(5, 5, 65, 5);
  
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    switch (self.appDelegate.subscriptionLevel) {
//            
//        case SubscriptionPaid1:
//            
//            if (indexPath.section == 0)
//            {
//                return CGSizeMake(40,40);
//            }
//            
//            break;
//        case SubscriptionPaid2:
//            
//            if (indexPath.section == 0)
//            {
//                return CGSizeMake(40,40);
//            }
//            break;
//        default:
//            break;
//    }
    return CGSizeMake(120,120);
    
}


// The cell that is returned must be retrieved from a call to - dequeueReusableCellWithReuseIdentifier:forIndexPath:

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ExercisePlanCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
    self.label.text = [self.goalArray objectAtIndex:indexPath.row];
    return myCell;


}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    
    //for paid
    //if free send to upgrade view
    //if paid, continue with code

    
}

-(void)goToUpGrade
{
    
}

-(IBAction)saveData:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)cancelData:(id)sender {

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    //[self.foodTrackerCell refreshFoodCell];
}



-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
// return CGSizeMake(90, 90);
//}



-(IBAction)plateBreakdown:(id)sender {
    

    
}


@end
