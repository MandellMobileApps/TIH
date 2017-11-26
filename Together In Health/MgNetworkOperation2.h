//
//  MgNetworkOperation2.h
//  GiLicense Manager iOS
//
//  Created by Jon Mandell on 2/4/15.
//  Copyright (c) 2015 Greater Intell. All rights reserved.
//

#import <Foundation/Foundation.h>



@class AppDelegate;
@class MgNetworkOperation2;


typedef void (^MgResponseBlock)(MgNetworkOperation2* completedOperation);

@interface MgNetworkOperation2 : NSOperation

@property(nonatomic,weak) AppDelegate* appDelegate;
@property(nonatomic,strong) NSString* operationErrorMessage;
@property(nonatomic,strong) NSString* rawResponse;
@property (nonatomic,strong) NSURL* url;
@property (nonatomic) int currentRetry;
@property(nonatomic,strong)id json;
@property(nonatomic)int alertType;
@property(nonatomic)BOOL isJson;

- (id)initWithUrl:(NSURL*)url isJson:(BOOL)isJson responseBlock:(MgResponseBlock)mgResponseBlock;

@end
