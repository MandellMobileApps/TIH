//
//  BlogPostMenuCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/10/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogPostMenuCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* blogLabel;
@property (nonatomic, strong) IBOutlet UILabel* dateLabel;
@property (nonatomic, strong) IBOutlet UIImageView* favoritesImage;
@property (nonatomic, strong) IBOutlet UIImageView* blogImage;
@property (nonatomic,strong) NSString* thisReuseIdentifier;
@property (nonatomic,strong) NSDictionary* object;
-(void)refreshSubviews;

@end
