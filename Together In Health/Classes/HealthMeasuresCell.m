//
//  HealthMeasuresCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/13/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "HealthMeasuresCell.h"
#import "Health.h"

@implementation HealthMeasuresCell

-(void)refreshHealthCell {
    
    if (self.health.healthValue)
    {
        self.userData.text = @"saved";
//        self.userData.text = self.health.healthValue;
    }
    
    else {
        
        self.userData.text = @"test";
    }
    
    if (self.health.isDone)
    {
        [self.testButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    
    else {
        [self.testButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
    }
    
}

-(IBAction)doneButton:(id)sender {
    
    if (self.testButtonOn) {
        self.testButtonOn = NO;
        self.health.isDone = NO;
        [self.testButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        
        
    }
    else {
        
        self.testButtonOn = YES;
        self.health.isDone = YES;
        [self.testButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
        
    }
    
}


@end
