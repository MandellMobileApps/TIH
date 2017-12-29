//
//  MenuPlanCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/1/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuDay;

@interface MenuPlanCell : UITableViewCell

@property (nonatomic, strong) MenuDay* selectedMenuDay;
@property (nonatomic, strong) IBOutlet UILabel *menuTypeLabel;
@property (nonatomic, strong) IBOutlet UILabel *menuItemsLabel;
@property (nonatomic) NSInteger row;

-(void)refreshCell;
-(NSString*)menuItemsStringForArray:(NSMutableArray*)meals;
@end
