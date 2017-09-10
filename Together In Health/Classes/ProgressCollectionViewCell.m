//
//  MyCollectionViewCell.m
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "ProgressCollectionViewCell.h"
#import "Completed.h"

@implementation ProgressCollectionViewCell


-(void)refreshCell {

if (self.completed.isDone)
    {
        [self.myButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    
    else {
        [self.myButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
    }
    
}


-(IBAction)doneButton:(id)sender {
    
    if (self.myButtonOn) {
        self.myButtonOn = NO;
        self.completed.isDone = NO;
        [self.myButton setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        
        
    }
    else {

        self.myButtonOn = YES;
        self.completed.isDone = YES;
        [self.myButton setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
        
    }
    
}

@end
