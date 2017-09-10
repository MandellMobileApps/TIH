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

@implementation ChoosePlateViewController
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
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.food)
    {
        self.food = [self copyFood:self.food];
        self.isNew = NO;
    }
    else
    {
        self.food = [[Food alloc]init];
        self.food.plate = [self.appDelegate.allPlates firstObject];
        self.food.mood = [self.appDelegate.allMoods objectAtIndex:3];
        self.isNew = YES;
    }
    [self.thisCollectionView reloadData];

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
    
      case SubscriptionPaid1:
      
        if (section == 0)
        {
            return self.appDelegate.allMoods.count;
        }

        break;
      case SubscriptionPaid2:
      
        if (section == 0)
        {
           return self.appDelegate.allMoods.count;
        }
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
            return UIEdgeInsetsMake(20, 20, 65, 5);
        }

        break;
      case SubscriptionPaid2:
      
        if (section == 0)
        {
           return UIEdgeInsetsMake(20, 20, 65, 5);
        }
        break;
      default:
        break;
    }
    return UIEdgeInsetsMake(5, 5, 65, 5);
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    switch (self.appDelegate.subscriptionLevel) {
    
      case SubscriptionPaid1:
      
        if (indexPath.section == 0)
        {
            return CGSizeMake(40,40);
        }

        break;
      case SubscriptionPaid2:
      
        if (indexPath.section == 0)
        {
            return CGSizeMake(40,40);
        }
        break;
      default:
        break;
    }
    return CGSizeMake(90,90);

}


// The cell that is returned must be retrieved from a call to - dequeueReusableCellWithReuseIdentifier:forIndexPath:

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChoosePlateCell* MyCell;
    switch (self.appDelegate.subscriptionLevel) {
    
      case SubscriptionFree:
      
        if (indexPath.section == 0)
        {
            MyCell = [self plateCellForIndexPath:indexPath];
        }
        break;
        
      case SubscriptionPaid1:
      
        if (indexPath.section == 0)
        {
            MyCell = [self moodCellForIndexPath:indexPath];
        }
        else if (indexPath.section == 1)
        {
            MyCell = [self plateCellForIndexPath:indexPath];
        }

        break;
      case SubscriptionPaid2:
      
        if (indexPath.section == 0)
        {
            MyCell = [self moodCellForIndexPath:indexPath];
        }
        else if (indexPath.section == 1)
        {
            MyCell = [self plateCellForIndexPath:indexPath];
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
    
      case SubscriptionFree:
      
        if (indexPath.section == 0)
        {
            Plate* thisPlate = [self.appDelegate.allPlates objectAtIndex:indexPath.row];
            self.food.plate = thisPlate;
        }
        break;
        
      case SubscriptionPaid1:
      
        if (indexPath.section == 0)
        {
            [self goToUpGrade];
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

}

-(IBAction)saveData:(id)sender {
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
        [alertView show];
        
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    
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
