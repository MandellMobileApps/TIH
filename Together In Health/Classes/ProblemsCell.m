//
//  ProblemsCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 7/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "ProblemsCell.h"

@implementation ProblemsCell

-(void)refreshSubviews
{
    
    self.problemLabel.text = [self.object objectForKey:@"Problem"];
}

@end
