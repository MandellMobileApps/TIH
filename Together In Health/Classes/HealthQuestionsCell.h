//
//  HealthQuestionsCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/31/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthQuestionsCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *hqLabel;
@property(nonatomic,strong) NSDictionary* object;
@property (nonatomic,strong) NSString* thisReuseIdentifier;
-(void)refreshSubiews;

@end
