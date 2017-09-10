//
//  ProblemsCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 7/5/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProblemsCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* problemLabel;
@property (nonatomic,strong) NSString* thisReuseIdentifier;
@property (nonatomic,strong) NSDictionary* object;

-(void)refreshSubviews;

@end
