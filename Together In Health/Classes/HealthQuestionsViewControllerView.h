//
//  TopicViewControllerView.h
//  Nutrition Questions
//
//  Created by Cami Mandell on 9/18/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthQuestionsViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic,strong) NSDictionary* topic;
@property (nonatomic,strong) IBOutlet UIImageView* imageView1;
@property (nonatomic,strong) NSDictionary* object;
@property (nonatomic,strong) NSMutableArray* starList;
@property (nonatomic,strong) NSString* thisReuseIdentifier;
@property (nonatomic) int barButtonType;
@property IBOutlet UISearchBar *questionSearchBar;
@property (nonatomic, strong) NSMutableArray *filteredQuestionArray;
@property (nonatomic, strong) NSArray *questions;
-(void)refreshSubviews;
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope;

@end
