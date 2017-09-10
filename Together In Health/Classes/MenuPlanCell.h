//
//  MenuPlanCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/1/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuPlanCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UITextField *breakfast;
@property (nonatomic, strong) IBOutlet UITextField *lunch;
@property (nonatomic, strong) IBOutlet UITextField *dinner;
@property (nonatomic, strong) IBOutlet UITextField *snacks;

-(void)resetCell;

@end
