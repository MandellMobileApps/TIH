//
//  HealthQuestionsCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/31/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "HealthQuestionsCell.h"

@implementation HealthQuestionsCell

-(void)refreshSubiews
{
    
    self.hqLabel.text = [self.object objectForKey:@"Question"];
    
}


@end
