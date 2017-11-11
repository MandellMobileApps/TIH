//
//  HealthMeasuresViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/13/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Health;
@class HealthMeasuresCell;

@interface HealthMeasuresViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITableView* thisTableView;
@property (nonatomic, strong) IBOutlet UIScrollView* thisScrollView;

@property (nonatomic, strong) NSArray* cholArray;
@property (nonatomic, strong) NSArray* sugarArray;
@property (nonatomic, strong) NSArray* inflamArray;
@property (nonatomic, strong) NSArray* whmeasuresArray;
@property (nonatomic, strong) NSArray* bpArray;

@property (nonatomic, strong) Health* health;
@property (nonatomic, strong) HealthMeasuresCell* healthMeasuresCell;

@property (nonatomic, strong) NSMutableArray* healthPackage;

-(void)loadHealthPersistent;
-(void)saveHealthPersistent;
-(IBAction)resignKeyboard:(id)sender;

@property (nonatomic) int dayOffset;
@property (nonatomic, strong) IBOutlet UILabel *dayLabel;



@end
