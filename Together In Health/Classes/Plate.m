//
//  Plate.m
//  Together In Health
//
//  Created by Jon Mandell on 12/27/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import "Plate.h"

@implementation Plate

+(Plate*) plateImage:(NSString*)plateImage protein:(NSString*)protein  carbs:(NSString*)carbs vegetables:(NSString*)vegetables plateId:(NSInteger)plateId
{
    Plate* plate = [[Plate alloc]init];
    plate.plateId = plateId;
    plate.protein =protein;
    plate.carbs =carbs;
    plate.vegetables =vegetables;
    plate.plateImage =plateImage;
    return plate;
}


-(id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {

        self.plateId = [decoder decodeIntegerForKey:@"plateId"];
        self.protein = [decoder decodeObjectForKey:@"protein"];
        self.carbs = [decoder decodeObjectForKey:@"carbs"];
        self.vegetables = [decoder decodeObjectForKey:@"vegetables"];
        self.plateImage = [decoder decodeObjectForKey:@"plateImage"];

 
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeInteger:self.plateId forKey:@"plateId"];
    [encoder encodeObject:self.protein forKey:@"protein"];
    [encoder encodeObject:self.carbs forKey:@"carbs"];
    [encoder encodeObject:self.vegetables forKey:@"vegetables"];
    [encoder encodeObject:self.plateImage forKey:@"plateImage"];
    

}

@end
