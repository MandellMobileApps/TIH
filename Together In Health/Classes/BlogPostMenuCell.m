//
//  BlogPostMenuCell.m
//  TIHMaster
//
//  Created by Cami Mandell on 8/10/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "BlogPostMenuCell.h"

@implementation BlogPostMenuCell

-(void)refreshSubviews
{
    
    self.blogLabel.text = [self.object objectForKey:@"Title"];
    self.dateLabel.text = [self.object objectForKey:@"Date"];
    self.blogImage.image = [UIImage imageNamed:[self.object objectForKey:@"Image"]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
   // self.blogImage.frame = CGRectMake(20, 10, 304,117);
    
   // self.blogImage.frame = CGRectMake(self.center.x, self.center.y, 304, 117);
    
}
@end
