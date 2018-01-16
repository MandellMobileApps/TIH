//
//  RecipeTableViewCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/11/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "RecipeTableViewCell.h"
#import "RecipeViewController.h"
#import "AppDelegate.h"

@implementation RecipeTableViewCell

-(void)refreshSubviews
{
    
    self.recipeLabel.text = [self.object objectForKey:@"Recipe"];
}

-(IBAction)addMenuItem:(id)sender {
    
//    if (self.addItemIsOn) {
//        [self.menuPlanButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
//        self.addItemIsOn = NO;
//         self.recipeViewController.menuPlanView.hidden = NO;
//        self.favoritesImage.hidden = NO;
//    }
//
//
//
//    else {
//        [self.menuPlanButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
//        self.addItemIsOn = YES;
//        self.recipeViewController.menuPlanView.hidden = YES;
//    }
    [self.recipeViewController recipeItemAdded:self.object];
   
}

@end
