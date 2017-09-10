//
//  RecipeTableViewCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/11/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipeViewController;

@interface RecipeTableViewCell : UITableViewCell

@property (nonatomic, strong) RecipeViewController* recipeViewController;

@property (nonatomic, strong) IBOutlet UILabel* recipeLabel;
@property (nonatomic, strong) IBOutlet UIImageView* favoritesImage;
@property (nonatomic,strong) NSString* thisReuseIdentifier;
@property (nonatomic,strong) NSDictionary* object;
@property (nonatomic, strong) IBOutlet UIButton *menuPlanButton;

-(IBAction)addMenuItem:(id)sender;

-(void)refreshSubviews;

@property (nonatomic) BOOL addItemIsOn;

@end
