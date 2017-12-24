//
//  MenuItem.h
//  Together In Health
//
//  Created by Cami Mandell on 12/25/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject <NSCoding>

// used to be assigned to a particuar menu
@property (nonatomic) NSInteger menuItemId;
@property (nonatomic, strong) NSString *menuItemName;
@property (nonatomic, strong) NSString *menuItemImage;

// not sure what these are used for
@property (nonatomic, strong) NSString *itemSection;
@property (nonatomic) NSInteger itemSubscription;


//+ (id)itemLabel:(NSString*)itemLabel itemImage:(NSString*)itemImage itemSection:(NSString*)itemSection subscriptionLevel:(NSInteger*)itemSubscription;

@end
