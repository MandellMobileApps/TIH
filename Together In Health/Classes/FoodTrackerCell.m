//
//  FoodTrackerCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "FoodTrackerCell.h"
#import "ChoosePlateCollectionView.h"
#import "Food.h"

@implementation FoodTrackerCell

-(void)refreshFoodCell {
    
    if (self.food)
    {
        self.plateImage.hidden = NO;
        self.proteinLabel.hidden = NO;
        self.carbsLabel.hidden = NO;
        self.vegetableLabel.hidden = NO;
        self.plateImage.image = [UIImage imageNamed:self.food.plate.plateImage];
        self.proteinLabel.text = self.food.plate.protein;
        self.carbsLabel.text = self.food.plate.carbs;
        self.vegetableLabel.text = self.food.plate.vegetables;
        self.moodImage.image = [UIImage imageNamed:self.food.mood.moodImage];
        
        self.waterLabel.hidden = YES;
        self.cupsLabel.hidden = YES;
    }
    else if (self.waterCups)
    {
        self.waterLabel.hidden = NO;
        self.cupsLabel.hidden = NO;
        self.waterLabel.text = self.waterCups;
        self.cupsLabel.text = @"Cup(s)";
        self.plateImage.hidden = YES;
        self.proteinLabel.hidden = YES;
        self.carbsLabel.hidden = YES;
        self.vegetableLabel.hidden = YES;
        self.locationLabel.hidden = YES;
        self.moodImage.hidden = YES;
    }

}


@end
