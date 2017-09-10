//
//  ChoosePlateCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/4/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ChoosePlateCell.h"
#import "ChoosePlateViewController.h"
#import "Plate.h"
#import "Mood.h"
#import "Food.h"

@implementation ChoosePlateCell

-(void)refreshCell {

    if (self.plate)
    {
        self.plateImage.image = [UIImage imageNamed:self.plate.plateImage];
        if (self.food.plate.plateId == self.plate.plateId)
        {
            self.plateImageSelected.image = [UIImage imageNamed:@"ChosenPlate.png"];
            self.plateImageSelected.hidden = NO;
        }
        else
        {
            self.plateImageSelected.hidden = YES;
        }
    }
    else if (self.mood)
    {
        self.plateImage.image = [UIImage imageNamed:self.mood.moodImage];
        if (self.food.mood.moodId == self.mood.moodId)
        {
            self.plateImageSelected.image = [UIImage imageNamed:@"ChosenPlate.png"];
            self.plateImageSelected.hidden = NO;
        }
        else
        {
            self.plateImageSelected.hidden = YES;
        }
    
    }

    
}

@end
