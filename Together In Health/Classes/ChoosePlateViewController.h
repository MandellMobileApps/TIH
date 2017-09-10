//
//  ChoosePlateViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/28/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"
#import "AbstractViewController.h"

enum plateType {
    balance1 = 1,
    balance2 = 2,
    balance3 = 3,
    balance4 = 4,
    balance5 = 5,
    balance6 = 6,
};

@class FoodTrackerViewController;
@class Food;


@interface ChoosePlateViewController : AbstractViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@property (nonatomic, weak) FoodTrackerViewController* foodTrackerViewController;

@property (nonatomic, strong) Food* food;
@property (nonatomic) NSInteger mealType;
@property (nonatomic) BOOL isNew;
@property (nonatomic) BOOL changesMade;

@property (nonatomic, strong) IBOutlet UIButton *saveButton;
-(IBAction)saveData:(id)sender;

@property (nonatomic, strong) IBOutlet UICollectionView *thisCollectionView;





@end
