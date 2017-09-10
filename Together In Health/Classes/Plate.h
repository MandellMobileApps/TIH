//
//  Plate.h
//  Together In Health
//
//  Created by Jon Mandell on 12/27/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plate : NSObject <NSCoding>

@property (nonatomic) NSInteger plateId;
@property (nonatomic, strong) NSString *protein;
@property (nonatomic, strong) NSString *carbs;
@property (nonatomic, strong) NSString* vegetables;
@property (nonatomic, strong) NSString* plateImage;

+(Plate*) plateImage:(NSString*)plateImage protein:(NSString*)protein  carbs:(NSString*)carbs vegetables:(NSString*)vegetables plateId:(NSInteger)plateId;

@end
