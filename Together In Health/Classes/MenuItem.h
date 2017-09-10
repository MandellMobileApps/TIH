//
//  MenuItem.h
//  Together In Health
//
//  Created by Cami Mandell on 12/25/15.
//  Copyright © 2015 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (nonatomic, strong) NSString *itemLabel;
@property (nonatomic, strong) NSString *itemImage;
@property (nonatomic, strong) NSString *itemSection;
@property (nonatomic) int itemSubscription;


+ (id)itemLabel:(NSString*)itemLabel itemImage:(NSString*)itemImage itemSection:(NSString*)itemSection subscriptionLevel:(NSString*)itemSubscriptionType;

@end
