//
//  SeasonalVegInfoViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 7/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class SeasonalVegGameViewController;

@interface SeasonalVegInfoViewController : AbstractViewController

@property (strong, nonatomic) NSDictionary* object;
-(void)updateObject;

@property (nonatomic, strong) SeasonalVegGameViewController *seasonalVegGameViewController;

@property (nonatomic, strong) IBOutlet UIWebView *thisWebView;
@property (nonatomic, strong) IBOutlet UIButton *favoritesButton;
@property (nonatomic) BOOL *favoritesButtonOn;
@property (nonatomic, strong) IBOutlet UIButton *notesButton;
-(void)updateDetailWithObject:(NSDictionary*)newObject;

-(IBAction)favorites:(id)sender;
-(IBAction)updateNote:(id)sender;
-(void)saveRecipe;
-(void)updateNoteButton;
-(IBAction)updateFavoritesButton:(id)sender;
-(IBAction)updateFavorites:(id)sender;


-(NSString*)pathForFilename;

@end
