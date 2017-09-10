//
//  ProgressViewController.m
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressCollectionViewCell.h"
#import "Completed.h"
#import "ProgressCollectionView.h"
#import "ProgressHeaderView.h"
#import "ViewControllerGoal.h"
#import "ViewControllerGamePlan.h"

@implementation ProgressViewController

-(void)loadBundle:(NSString*)bundlePath
{
    
}



-(void)viewDidLoad {
    
//    [self loadGoal1Persistent];
//    [self loadGoal2Persistent];
//    [self loadGoal3Persistent];
    
    self.title = @"Track goal progress";
    //    self.navigationController.navigationBar.backgroundColor= [UIColor blackColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    [self.progressCollectionView reloadData];
    
    self.thisScrollView.contentSize = CGSizeMake(320, 800);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.textFieldBy.text = [defaults objectForKey:@"By1"];
    self.textFieldBy2.text = [defaults objectForKey:@"By2"];


}


-(UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 65, 5);
    
}


- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 2;
}


// The cell that is returned must be retrieved from a call to - dequeueReusableCellWithReuseIdentifier:forIndexPath:

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ProgressCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        
    myCell.completed = [self.complete objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1) {
        myCell.completed = [self.complete objectAtIndex:indexPath.row +28];
    }
    
    [myCell refreshCell];
    
    return myCell;
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 28;
            break;
        case 1:
            return 28;
            break;
        default:
            break;
            
    }
    
    return 0;
    
}

-(void)viewWillDisappear:(BOOL)animated {
    
    
}

-(IBAction)refreshProgress:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to reset progress?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset progress",nil];
    [alert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
    }
    else if (buttonIndex == 1) {
        for (Completed* item in self.complete)
        {
            item.isDone = NO;
        }
        [self.collectionView reloadData];
    }
}

-(IBAction)goal:(id)sender {
    ViewControllerGoal* viewControllerGoal = (ViewControllerGoal*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"ViewControllerGoal"];
    viewControllerGoal.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:viewControllerGoal animated:NO];
}

-(IBAction)gamePlan:(id)sender {
    ViewControllerGamePlan* viewControllerGamePlan = (ViewControllerGamePlan*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"ViewControllerGamePlan"];
   // viewControllerGamePlan.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:viewControllerGamePlan animated:NO];
    
}

-(UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ProgressHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ProgressHeaderView" forIndexPath:indexPath];
    return headerView;
}

- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:nameoffile];
    return documentsPath ;
}

- (NSString *)dataFilePathofBundle:(NSString *)nameoffile {
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nameoffile];
    return bundlePath;
}

@end
