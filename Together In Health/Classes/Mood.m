//
//  Mood.m
//  Together In Health
//
//  Created by Jon Mandell on 12/27/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "Mood.h"

@implementation Mood

+(Mood*) moodImage:(NSString*)moodImage moodId:(NSInteger)moodId
{
    Mood* mood = [[Mood alloc]init];
    mood.moodId = moodId;
    mood.moodImage = moodImage;
    return mood;
}
-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.moodId = [decoder decodeIntegerForKey:@"moodId"];
        self.moodImage = [decoder decodeObjectForKey:@"moodImage"];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeInteger:self.moodId forKey:@"moodId"];
    [encoder encodeObject:self.moodImage forKey:@"moodImage"];


}

@end
