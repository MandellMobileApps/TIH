//
//  ChoosePlateViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/28/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ChoosePlateViewController.h"
#import "FoodTrackerViewController.h"
#import "FoodTrackerCell.h"
#import "Food.h"
#import "ChoosePlateCell.h"
#import "Day.h"
#import "AbstractViewController.h"
#import "AppDelegate.h"
#import "GenericWebViewController.h"
#import "PlateBreakdownViewController.h"
#import "MasterTrackerViewController.h"

@implementation ChoosePlateViewController
- (void)viewDidLoad
{
     [super viewDidLoad];

//	UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelData:)];
	self.navigationController.navigationBar.hidden = YES;
    
    self.navbarView.backgroundColor =  [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    self.navbarTitleLabel.font = [UIFont fontWithName:@"Arial" size:22.0];
    self.navbarTitleLabel.textColor = [UIColor whiteColor];
    
    UIImage* image = [UIImage imageNamed:@"QuestionMark.png"];
    
    CGRect frameimg = CGRectMake(0, 0, 30, 40);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(plateBreakdown:)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    
    [self.navigationItem setRightBarButtonItem:barBtn];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
    if (self.food)
    {
        self.food = [self copyFood:self.food];
        self.isNew = NO;
    }
    
    else
    {
    
        self.food = [[Food alloc]init];
        //self.food.plate = nil;//[self.appDelegate.allPlates objectAtIndex:0];
        self.food.plate = [[Plate alloc] init];
        self.food.plate.plateId = -1;
        self.food.mood = [[Mood alloc] init]; //[self.appDelegate.allMoods firstObject];
        self.food.mood.moodId = -1;
        self.food.mealType = self.mealType;
        self.isNew = YES;
    }
    [self.thisCollectionView reloadData];

}

-(void)viewDidDisappear:(BOOL)animated
{
   
    [super viewDidDisappear:animated];
}
-(Food*)copyFood:(Food*)food
{
    if (food)
    {
        Food* foodCopy = [[Food alloc]init];
        foodCopy.isChosen = food.isChosen;
        foodCopy.showFilledImage = food.showFilledImage;
        foodCopy.indexString = [food.indexString copy];
        foodCopy.mealType = food.mealType;
        foodCopy.foodArrayIndex = food.foodArrayIndex;
        foodCopy.moodArrayIndex = food.moodArrayIndex;
        
        if (food.plate)
        {
            Plate* plate = [[Plate alloc]init];
            plate.plateId = food.plate.plateId;
            plate.protein = [food.plate.protein copy];
            plate.carbs = [food.plate.carbs copy];
            plate.vegetables = [food.plate.vegetables copy];
            plate.plateImage = [food.plate.plateImage copy];
            foodCopy.plate = plate;
        
        }
        
        if (food.mood)
        {
        
            Mood* mood = [[Mood alloc]init];
            mood.moodId = food.mood.moodId;
            mood.moodImage = [food.mood.moodImage copy];
            foodCopy.mood = mood;
        }

        return foodCopy;
    }
    return nil;

}



- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    switch (self.appDelegate.subscriptionLevel) {
    
            
    case SubscriptionFree:
            return 2;
      case SubscriptionPaid1:
            return 2;
        break;
      case SubscriptionPaid2:
           return 2;
        break;
      default:
        break;
    }
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    switch (self.appDelegate.subscriptionLevel) {
            
        case SubscriptionFree:
            if (section == 0)
            {
                return 0;
            }
            return self.appDelegate.allPlates.count-2;
            break;

      case SubscriptionPaid1:
      
        if (section == 0)
        {
            return self.appDelegate.allMoods.count;
        }
            return self.appDelegate.allPlates.count;

        break;
      case SubscriptionPaid2:
      
        if (section == 0)
        {
           return self.appDelegate.allMoods.count;
        }
            return self.appDelegate.allPlates.count;
        break;
      default:
        break;
    }
    
    return self.appDelegate.allPlates.count;
    
}

-(UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    

    switch (self.appDelegate.subscriptionLevel) {
    
      case SubscriptionPaid1:
      
        if (section == 0)
        {
            return UIEdgeInsetsMake(5, 5, 40, 5);
            
        }

        break;
      case SubscriptionPaid2:
      
        if (section == 0)
        {
           return UIEdgeInsetsMake(0, 0, 20, 0);
        }
        break;
      default:
        break;
    }
    return UIEdgeInsetsMake(5, 5, 40, 5);
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    switch (self.appDelegate.subscriptionLevel) {
    
//      case SubscriptionPaid1:
//      
//        if (indexPath.section == 0)
//        {
//            return CGSizeMake(60,60);
//        }
//
//        break;
//      case SubscriptionPaid2:
//      
//        if (indexPath.section == 0)
//        {
//            return CGSizeMake(60,60);
//        }
//        break;
//      default:
//        break;
    }
    
    if (indexPath.section == 0) {
        if (self.view.bounds.size.width > 355)
        {
        return CGSizeMake(65,65);
        }
        return CGSizeMake(54,54);
    }
    
    else {
    return CGSizeMake(90,90);
    }
}


// The cell that is returned must be retrieved from a call to - dequeueReusableCellWithReuseIdentifier:forIndexPath:

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChoosePlateCell* MyCell;
    switch (self.appDelegate.subscriptionLevel) {
    
      case SubscriptionFree:
//            if (indexPath.section ==)
//            {
            MyCell = [self plateCellForIndexPath:indexPath];
            MyCell.plateImage.frame = CGRectMake(0, 0, 90, 90);
            MyCell.plateImageSelected.frame = CGRectMake(0, 0, 90, 90);
//            }

        break;
        
      case SubscriptionPaid1:
      
        if (indexPath.section == 0)
        {
            if (self.view.bounds.size.height >355) {
                MyCell = [self moodCellForIndexPath:indexPath];
                MyCell.plateImage.frame = CGRectMake(2.5, 2.5, 58, 58);
                MyCell.plateImageSelected.frame = CGRectMake(0, 0, 65, 65);
            }
            {
                MyCell = [self moodCellForIndexPath:indexPath];
                MyCell.plateImage.frame = CGRectMake(2.5, 2.5, 50, 50);
                MyCell.plateImageSelected.frame = CGRectMake(0, 0, 54, 54);
            }
            
        }
        else if (indexPath.section == 1)
        {
            MyCell = [self plateCellForIndexPath:indexPath];
            MyCell.plateImage.frame = CGRectMake(0, 0, 90, 90);
            MyCell.plateImageSelected.frame = CGRectMake(0, 0, 90, 90);
        }

        break;
      case SubscriptionPaid2:
      
        if (indexPath.section == 0)
        {
            if (self.view.bounds.size.height >355) {
                MyCell = [self moodCellForIndexPath:indexPath];
                MyCell.plateImage.frame = CGRectMake(2.5, 2.5, 58, 58);
                MyCell.plateImageSelected.frame = CGRectMake(0, 0, 65, 65);
            }
            {
                MyCell = [self moodCellForIndexPath:indexPath];
                MyCell.plateImage.frame = CGRectMake(2.5, 2.5, 50, 50);
                MyCell.plateImageSelected.frame = CGRectMake(0, 0, 54, 54);
            }
        }
        else if (indexPath.section == 1)
        {
            MyCell = [self plateCellForIndexPath:indexPath];
            MyCell.plateImage.frame = CGRectMake(0, 0, 90, 90);
            MyCell.plateImageSelected.frame = CGRectMake(0, 0, 90, 90);
        }
        break;
      default:
        MyCell = [self.thisCollectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
        break;
    }
    
    
    return MyCell;
}


-(ChoosePlateCell*)moodCellForIndexPath:(NSIndexPath*)indexPath
{

    ChoosePlateCell *MyCell = [self.thisCollectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    MyCell.choosePlateViewController = self;
    Mood* thisMood = [self.appDelegate.allMoods objectAtIndex:indexPath.row];
    MyCell.food = self.food;
    MyCell.mood = thisMood;
    MyCell.plate = nil;
    [MyCell refreshCell];
    return MyCell;

}

-(ChoosePlateCell*)plateCellForIndexPath:(NSIndexPath*)indexPath
{

    ChoosePlateCell *MyCell = [self.thisCollectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    MyCell.choosePlateViewController = self;
    Plate* thisPlate = [self.appDelegate.allPlates objectAtIndex:indexPath.row];
    MyCell.food = self.food;
    MyCell.plate = thisPlate;
    MyCell.mood = nil;
    [MyCell refreshCell];
    return MyCell;

}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    
    //for paid
    //if free send to upgrade view
    //if paid, continue with code
    self.changesMade = YES;
    
    switch (self.appDelegate.subscriptionLevel) {
    
      case SubscriptionFree:{
      
//        if (indexPath.section == 0)
//        {
            Plate* thisPlate = [self.appDelegate.allPlates objectAtIndex:indexPath.row];
            self.food.plate = thisPlate;
//        }
        break;}
        
      case SubscriptionPaid1:
      
        if (indexPath.section == 0)
        {
            Mood* thisMood = [self.appDelegate.allMoods objectAtIndex:indexPath.row];
            self.food.mood = thisMood;
        }
        else if (indexPath.section == 1)
        {
            Plate* thisPlate = [self.appDelegate.allPlates objectAtIndex:indexPath.row];
            self.food.plate = thisPlate;
        }

        break;
      case SubscriptionPaid2:
      
        if (indexPath.section == 0)
        {
            Mood* thisMood = [self.appDelegate.allMoods objectAtIndex:indexPath.row];
            self.food.mood = thisMood;
        }
        else if (indexPath.section == 1)
        {
            Plate* thisPlate = [self.appDelegate.allPlates objectAtIndex:indexPath.row];
            self.food.plate = thisPlate;
        }
        break;
      default:
        break;
    }
    [self.thisCollectionView reloadData];
    
}

-(void)goToUpGrade
{
    [self loadUpgradeViewController];
}

-(IBAction)saveData:(id)sender {
  
    switch (self.appDelegate.subscriptionLevel) {
            
        case SubscriptionFree:{
            
            if (self.food.plate.plateId > -1)
            {
                [self saveFood];

            }
            else
            {
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You must select a Plate\nbefore you save." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                alertView.tag = 2;
                [alertView show];
            }
                 break;}
        case SubscriptionPaid1: {
             if ((self.food.mood.moodId > -1)&&(self.food.plate.plateId > -1))
            {
                [self saveFood];

            }
            else
            {
            
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You must select a Mood and a Plate\nbefore you save." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                alertView.tag = 2;
                [alertView show];
            }
                break;}
            
        case SubscriptionPaid2:{
            
            if ((self.food.mood.moodId > -1)&&(self.food.plate.plateId > -1))
            {
                
                [self saveFood];
            }
            else
            {
            
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You must select a Mood and a Plate\nbefore you save." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                alertView.tag = 2;
                [alertView show];

 
            }

            break;}
        default:
            break;
        }

}

-(void) saveFood
{
        if (self.isNew)
        {
            [self.appDelegate.day.foodArray addObject:self.food];
        }
        else
        {
            [self.appDelegate.day.foodArray replaceObjectAtIndex:self.food.foodArrayIndex withObject:self.food];
        
        }

    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)cancelData:(id)sender {
    if (self.isNew || self.changesMade)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Are you sure you want to cancel" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        alertView.tag = 1;
        [alertView show];
        
    }
    else
    {

        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 2)
    {
    
    
    }
    else
    {

        if (buttonIndex == 1)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
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
    
        PlateBreakdownViewController* plateBreakdownViewController = (PlateBreakdownViewController*)
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
         instantiateViewControllerWithIdentifier:@"PlateBreakdownViewController"];
        [self.navigationController pushViewController:plateBreakdownViewController animated:YES];
    
}


@end
