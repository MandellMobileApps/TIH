//
//  ChooseActivityCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ChooseActivityCell.h"
#import "Activity.h"
#import "ActivityTrackerViewController.h"
#import "ChooseActivityViewController.h"

@implementation ChooseActivityCell

-(void)refreshActivtyCell {
    
    self.activityLabel.text = self.activity.activityName;
    
    if (self.activity.isFavorite) {
        self.activity.isFavorite = NO;
       [self.favoritesButton setImage:[UIImage imageNamed:@"Blankstar.png"] forState: UIControlStateNormal];
        
        
    }
    else {
        
        self.activity.isFavorite = YES;
        [self.favoritesButton setImage:[UIImage imageNamed:@"Star.png"] forState: UIControlStateNormal];
    }
    
}


@end
