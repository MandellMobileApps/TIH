//
//  DrinkTrackerCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "DrinkTrackerCell.h"
#import "Drink.h"

@implementation DrinkTrackerCell

-(void)refreshDrinkCell {
    
    if (self.drink.isChosen)
    {
        self.thisTextField.text = self.drink.drinkTextField.text;
    }
    
    else {
        

    }
}

-(IBAction)addDrink:(id)sender {
    
    if (self.drinkButtonOn) {
        self.drinkButtonOn = NO;
        self.drink.isChosen = NO;
        [self.addDrinkButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        
        
    }
    else {
        
        self.drinkButtonOn = YES;
        self.drink.isChosen = YES;
        [self.addDrinkButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
        
    }
    
}

@end
