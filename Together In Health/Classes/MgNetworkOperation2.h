//
//  MgNetworkOperation2.h
//  ProSportsHistoryV5
//
//  Created by Cami Mandell on 4/8/15.
//  Copyright (c) 2015 MandellMobileApps. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MgNetworkOperation2;


typedef void (^MgResponseBlock)(MgNetworkOperation2* completedOperation);

@interface MgNetworkOperation2 : NSOperation

@property(nonatomic,strong) NSString* operationErrorMessage;
@property(nonatomic,strong) NSString* rawResponse;
@property (nonatomic,strong) NSURL* url;
@property(nonatomic,strong)id json;
@property(nonatomic)int alertType;


- (id)initWithUrl:(NSURL*)url responseBlock:(MgResponseBlock)mgResponseBlock;

@end
