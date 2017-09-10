//
//  ChooseDrinkCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/29/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ChooseDrinkCell.h"
#import "Drink.h"
#import "ChooseDrinkViewController.h"
#import "Day.h"

@implementation ChooseDrinkCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(10,10,25,25);
}

-(IBAction)addDrink:(id)sender{
    
    if (self.addDrinkButtonOn) {
        self.addDrinkButtonOn = NO;
        [self.addDrinkButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.checkImage.hidden = YES;
        
    }
    else {
        
        self.addDrinkButtonOn = YES;
        [self.addDrinkButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
        [self.chooseDrinkViewController addHealthDrinkArrayObjectAtIndex];
       // self.day.drinkArray = [NSMutableArray arrayWithObjects:@"test1", @"test2", nil];
        self.checkImage.hidden = NO;
        
    }
    
}

@end
