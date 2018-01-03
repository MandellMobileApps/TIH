//
//  AddMenuItemViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 8/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class MenuItem;
@class MenuDay;
@interface AddMenuItemViewController : AbstractViewController




@property (nonatomic, strong) MenuDay *selectedMenuDay;
@property (nonatomic, retain) IBOutlet UISearchBar* searchBar;
@property (nonatomic)  CGRect searchBarHideRect;
@property (nonatomic)  CGRect searchBarShowRect;
@property (nonatomic, retain) IBOutlet UILabel* searchLabel;

@property (nonatomic, strong) NSMutableArray *filteredItemsArray;
@property (nonatomic, strong) NSMutableArray *selectedItemsArray;
@property (nonatomic, strong) NSString *filterString;

@property (nonatomic, strong) IBOutlet UITableView *thisTableView;

-(void)addMenuItemToSelectedArray:(MenuItem*)thisItem;
-(void)removeMenuItemFromSelectedArray:(MenuItem*)thisItem;
-(void)addMenuItemToAllArray:(MenuItem*)thisItem;
-(void)removeMenuItemFromAllArray:(MenuItem*)thisItem;
@end
