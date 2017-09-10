//
//  ActivityTrackerCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ActivityTrackerCell.h"
#import "Activity.h"

@implementation ActivityTrackerCell

-(void)refreshActivityCell {
//    if (self.activity.isChosen) {
//        self.activityLabel.text = self.activity.activityType;
//        
//    }
//    
//    else {
//        
//    }
    
    self.activityLabel.text = self.activity.activityName;
    self.timeLabel.text = self.activity.time;
}

@end
