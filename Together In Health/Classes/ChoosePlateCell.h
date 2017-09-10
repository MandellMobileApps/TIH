//
//  ChoosePlateCell.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/4/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChoosePlateViewController;
@class Plate;
@class Mood;
@class Food;

@interface ChoosePlateCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView* plateImage;
@property (nonatomic, strong) IBOutlet UIImageView* plateImageSelected;

@property(nonatomic, weak) ChoosePlateViewController* choosePlateViewController;
@property(nonatomic, strong) Plate* plate;
@property(nonatomic, strong) Mood* mood;
@property(nonatomic, strong) Food* food;
@property(nonatomic) BOOL isSelected;

-(void)refreshCell;

@end
