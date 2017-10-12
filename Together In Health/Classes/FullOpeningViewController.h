//
//  FullOpeningViewController.h
//  SimpleTable
//
//  Created by Cami Mandell on 3/27/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

enum webViewType {
    groupExplanations = 0,
    plateExamples = 1,
    foodLabels = 2,

};

enum webViewType2 {
    aboutTIH = 0,
    balance = 1,
    fAQs = 2,
    directions = 3,
    disclaimer = 7,

};

@class FullOpeningCell;

@interface FullOpeningViewController : AbstractViewController

@property (nonatomic, strong) FullOpeningCell *fullOpeningCell;

@property (nonatomic, strong) NSArray *menuFreeArray0;
@property (nonatomic, strong) NSArray *menuFreeArray1;
@property (nonatomic, strong) NSArray *menuFreeArray2;
@property (nonatomic, strong) NSArray *menuFreeArray3;

@property (nonatomic, strong) NSArray *menuArrayS0;
@property (nonatomic, strong) NSArray *menuArrayS1;
@property (nonatomic, strong) NSArray *menuArrayS2;
@property (nonatomic, strong) NSArray *menuArrayS3;
@property (nonatomic, strong) NSArray *menuArrayS4;
@property (nonatomic, strong) NSArray *menuArrayS5;

@property (nonatomic, strong) NSArray *menuImageArrayS1;
@property (nonatomic, strong) NSArray *menuImageArrayS2;
@property (nonatomic, strong) NSArray *menuImageArrayS3;
@property (nonatomic, strong) NSArray *menuImageArrayS4;



@end
