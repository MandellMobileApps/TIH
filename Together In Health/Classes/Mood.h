//
//  Mood.h
//  Together In Health
//
//  Created by Jon Mandell on 12/27/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mood : NSObject

@property (nonatomic) NSInteger moodId;
@property (nonatomic, strong) NSString* moodImage;

+(Mood*) moodImage:(NSString*)moodImage moodId:(NSInteger)moodId;
@end
