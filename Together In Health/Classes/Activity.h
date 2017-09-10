//
//  Activity.h
//  TIHMaster
//
//  Created by Cami Mandell on 6/6/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Activity : NSObject <NSCoding,NSCopying> {

}

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *activityName;
@property (nonatomic) BOOL isFavorite;
@property (nonatomic) BOOL isChosen;
@property (nonatomic, strong) NSString* time;
@property (nonatomic, strong) NSString* activityType;
@property (nonatomic) NSInteger activityArrayIndex;
//@property (nonatomic, strong) NSMutableArray* activityArray;
//@property (nonatomic, strong) NSMutableArray* chosenArray;
//@property (nonatomic, strong) NSMutableArray* favoritesArray;

+ (id)activityName:(NSString*)activityName category:(NSString*)category Type:(NSString*)activityType;



@end
