//
//  MenuPlanCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/1/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Menu;
@interface MenuPlanCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *menuNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *menuItemsLabel;
@property (nonatomic, strong)  NSMutableArray *menuItems;

-(void)refreshCell;
-(NSString*)menuItemsStringFrom:(NSMutableArray*)items;
@end
