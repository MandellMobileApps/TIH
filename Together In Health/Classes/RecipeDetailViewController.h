//
//  RecipeDetailViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/11/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class RecipeDetailViewController;
@class NoteViewController;
@class RecipeViewController;

@interface RecipeDetailViewController : AbstractViewController

@property (strong, nonatomic) NSDictionary* object;
-(void)updateObject;

@property (nonatomic, strong) RecipeDetailViewController *recipeDetailViewController;
@property (nonatomic, strong) NoteViewController *noteViewController;
@property (nonatomic, strong) RecipeViewController *recipeViewController;

@property (nonatomic, strong) IBOutlet UIWebView *thisWebView;
@property (nonatomic, strong) IBOutlet UIButton *favoritesButton;
@property (nonatomic) BOOL *favoritesButtonOn;
@property (nonatomic, strong) IBOutlet UIButton *notesButton;
//-(void)updateDetailWithObject:(NSDictionary*)newObject;

//-(IBAction)favorites:(id)sender;
-(IBAction)updateNote:(id)sender;
//-(void)saveRecipe;
//-(void)updateNoteButton;
-(IBAction)updateFavoritesButton:(id)sender;
//-(IBAction)updateFavorites:(id)sender;


//-(NSString*)pathForFilename;

@end
