//
//  NoteViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/23/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@class RecipeDetailViewController;

@interface NoteViewController : AbstractViewController

@property(nonatomic,strong) NSDictionary* object;
@property (nonatomic, strong) RecipeDetailViewController *recipeDetailViewController;
@property (nonatomic, strong) IBOutlet UITextView *noteText;

-(IBAction)saveButtonTapped:(id)sender;
//-(IBAction)dismiss:(id)sender;

@end
