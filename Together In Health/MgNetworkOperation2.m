//
//  MgNetworkOperation2.m
//  GiLicense Manager iOS
//
//  Created by Jon Mandell on 2/4/15.
//  Copyright (c) 2015 Greater Intell. All rights reserved.
//

#import "MgNetworkOperation2.h"



//  #define RestUrl GreaterIntell.insidesales.com/do=noauth/rest/service

@interface MgNetworkOperation2 ()

@property (strong, nonatomic) NSURLConnection *nSURLConnection;
@property (strong, nonatomic) NSURLRequest *urlRequest;
@property (nonatomic, strong) NSMutableString *contentOfCurrentProperty;
@property (nonatomic, strong) NSMutableData *webData;
@property (nonatomic, strong) NSTimer *timeoutTimer;
@property (strong) MgResponseBlock mgResponseBlock;


-(void)startConnection;

@end



@implementation MgNetworkOperation2

@synthesize mgResponseBlock = _mgResponseBlock;

#pragma mark -
#pragma mark Initialization Methods


- (id)initWithUrl:(NSURL*)url isJson:(BOOL)isJson responseBlock:(MgResponseBlock)mgResponseBlock;
{

   if ((self = [super init]))
    {
        self.mgResponseBlock = mgResponseBlock;
        self.url = url;
        self.isJson = isJson;

        return self;
	}
    return  nil;
}


#pragma mark -
#pragma mark Run Methods

- (void)main {
 
    @autoreleasepool {

        if ([self checkCancel])
        {
            return;
 		}

        [self startMgOperation];
        
        if ([self checkCancel])
        {
            return;
 		}
    }
}


-(void) startMgOperation
{

    if (![NSThread isMainThread])
    {
        [self performSelectorOnMainThread:@selector(startMgOperation) withObject:nil waitUntilDone:NO];
        return;
    }
	if (self.timeoutTimer) {
        [self.timeoutTimer invalidate];
    }
	self.timeoutTimer = [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(timedOut) userInfo:nil repeats:NO];

	self.currentRetry = 0;
    self.urlRequest = [NSURLRequest requestWithURL:self.url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
	
    [self startConnection];

}

-(void)timedOut
{
	if (self.timeoutTimer) {
        [self.timeoutTimer invalidate];
    }
    if (self.nSURLConnection) {
    [	self.nSURLConnection cancel];
        self.nSURLConnection = nil;
    }
    [self operationCompleteWithMessage:@"Operation Timed Out"];
}

-(void)startConnection
{
//
    NSLog(@"absoluteString %@",self.urlRequest.URL.absoluteString);
    self.nSURLConnection = [NSURLConnection connectionWithRequest:self.urlRequest delegate:self];
    if(!self.nSURLConnection ) {
        [self operationCompleteWithMessage:@"Connection could not be created"];
    }
    [self checkCancel];

}

- (void)operationCompleteWithMessage:(NSString*)message
{  
 	if (self.timeoutTimer) {
        [self.timeoutTimer invalidate];
    }
    self.operationErrorMessage = message;
    self.mgResponseBlock(self);
}



#pragma mark -
#pragma mark Convience Methods



-(BOOL) checkCancel
{
    if (self.isCancelled)
    {
        if (self.nSURLConnection) {
        [	self.nSURLConnection cancel];
        	self.nSURLConnection = nil;
    	}
        return YES;
    }
	return NO;
}



-(NSString*) textForErrorCode:(NSError*)error
{
	switch (error.code) {
      case NSURLErrorCancelled:
        return @"Connection Cancelled:";
      case NSURLErrorTimedOut:
        return @"Timed Out";
      case NSURLErrorCannotFindHost:
        return @"Cannot Find Host";
      case NSURLErrorCannotConnectToHost:
        return @"Cannot Connect To Host";
      case NSURLErrorNetworkConnectionLost:
        return @"Network Connection Lost";
      case NSURLErrorDNSLookupFailed:
        return @"DNSLookupFailed";
      case NSURLErrorHTTPTooManyRedirects:
        return @"HTTPTooManyRedirects";
      case NSURLErrorResourceUnavailable:
        return @"Resource Unavailable";
      case NSURLErrorNotConnectedToInternet:
        return @"Not Connected To Internet";
      case NSURLErrorRedirectToNonExistentLocation:
        return @"Redirect To Non Existent Location";
      case NSURLErrorUserCancelledAuthentication:
        return @"User Cancelled Authentication";
      case NSURLErrorUserAuthenticationRequired:
        return @"User Authentication Required";
      case NSURLErrorInternationalRoamingOff:
        return @"International Roaming Off";
      case NSURLErrorCallIsActive:
        return @"Call Is Active";
      case NSURLErrorDataNotAllowed:
        return @"Data Not Allowed";
      case NSURLErrorRequestBodyStreamExhausted:
        return @"Request Body Stream Exhausted";
      case NSURLErrorFileDoesNotExist:
        return @"File Does Not Exist";
      case NSURLErrorFileIsDirectory:
        return @"";
      case NSURLErrorNoPermissionsToReadFile:
        return @"";
      case NSURLErrorSecureConnectionFailed:
        return @"";
      case NSURLErrorServerCertificateHasBadDate:
        return @"";
      case NSURLErrorServerCertificateUntrusted:
        return @"";
      case NSURLErrorServerCertificateHasUnknownRoot:
        return @"";
      case NSURLErrorServerCertificateNotYetValid:
        return @"";
      case NSURLErrorClientCertificateRejected:
        return @"";
      case NSURLErrorClientCertificateRequired:
        return @"";
      case NSURLErrorCannotLoadFromNetwork:
        return @"";
      case NSURLErrorCannotCreateFile:
        return @"";
      case NSURLErrorCannotOpenFile:
        return @"";
      case NSURLErrorCannotCloseFile:
        return @"";
      case NSURLErrorCannotWriteToFile:
        return @"";
      case NSURLErrorCannotRemoveFile:
        return @"";
      case NSURLErrorCannotMoveFile:
        return @"";
        break;
        return @"Unknown Error";
      default:
        break;
    }

	return @"Unknown Error";
}



#pragma mark -
#pragma mark NSURLConnection delegates

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {

//    if (self.currentRetry > 2)
//    {
        self.webData = nil;
        [self operationCompleteWithMessage:[NSString stringWithFormat:@"Connection Error: %@", error.localizedDescription]];
//    }
//    else
//    {
//        if (self.nSURLConnection)
//        {
//            [self.nSURLConnection cancel];
//        }
//        self.currentRetry++;
//        [self startConnection];
//    }
  


}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
  self.webData = nil;
  [self operationCompleteWithMessage:@"Connection Error"];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [self checkCancel];
    [self.webData setLength: 0];
	self.webData = [NSMutableData data];
	
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self checkCancel];
    [self.webData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[self checkCancel];
	self.rawResponse = [[NSString alloc] initWithBytes: [self.webData mutableBytes] length:[self.webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@: rawString: %@\n\n\n",[NSDate date],self.rawResponse);

    [self checkCancel];
	if ([self.webData length] == 0) {
		[self operationCompleteWithMessage:@"Communication Error - No Data Returned"];
	} else {
    	 NSError *error = nil;
        if (self.isJson)
        {
            self.json = [NSJSONSerialization JSONObjectWithData:self.webData options:0 error:&error];
            NSLog(@"self.json %@",self.json);
            if(error)
            {
                [self operationCompleteWithMessage:@"Communication Error - Invalid JSON"];
            }
            else
            {
                [self operationCompleteWithMessage:@""];
            }
        }
        else
        {
            [self operationCompleteWithMessage:@""];
        }
	}
}



//   NSURLErrorUnknown = -1,
//   NSURLErrorCancelled = -999,
//   NSURLErrorBadURL = -1000,
//   NSURLErrorTimedOut = -1001,
//   NSURLErrorUnsupportedURL = -1002,
//   NSURLErrorCannotFindHost = -1003,
//   NSURLErrorCannotConnectToHost = -1004,
//   NSURLErrorDataLengthExceedsMaximum = -1103,
//   NSURLErrorNetworkConnectionLost = -1005,
//   NSURLErrorDNSLookupFailed = -1006,
//   NSURLErrorHTTPTooManyRedirects = -1007,
//   NSURLErrorResourceUnavailable = -1008,
//   NSURLErrorNotConnectedToInternet = -1009,
//   NSURLErrorRedirectToNonExistentLocation = -1010,
//   NSURLErrorBadServerResponse = -1011,
//   NSURLErrorUserCancelledAuthentication = -1012,
//   NSURLErrorUserAuthenticationRequired = -1013,
//   NSURLErrorZeroByteResource = -1014,
//   NSURLErrorCannotDecodeRawData = -1015,
//   NSURLErrorCannotDecodeContentData = -1016,
//   NSURLErrorCannotParseResponse = -1017,
//   NSURLErrorInternationalRoamingOff = -1018,
//   NSURLErrorCallIsActive = -1019,
//   NSURLErrorDataNotAllowed = -1020,
//   NSURLErrorRequestBodyStreamExhausted = -1021,
//   NSURLErrorFileDoesNotExist = -1100,
//   NSURLErrorFileIsDirectory = -1101,
//   NSURLErrorNoPermissionsToReadFile = -1102,
//   NSURLErrorSecureConnectionFailed = -1200,
//   NSURLErrorServerCertificateHasBadDate = -1201,
//   NSURLErrorServerCertificateUntrusted = -1202,
//   NSURLErrorServerCertificateHasUnknownRoot = -1203,
//   NSURLErrorServerCertificateNotYetValid = -1204,
//   NSURLErrorClientCertificateRejected = -1205,
//   NSURLErrorClientCertificateRequired = -1206,
//   NSURLErrorCannotLoadFromNetwork = -2000,
//   NSURLErrorCannotCreateFile = -3000,
//   NSURLErrorCannotOpenFile = -3001,
//   NSURLErrorCannotCloseFile = -3002,
//   NSURLErrorCannotWriteToFile = -3003,
//   NSURLErrorCannotRemoveFile = -3004,
//   NSURLErrorCannotMoveFile = -3005,
//   NSURLErrorDownloadDecodingFailedMidStream = -3006,
//   NSURLErrorDownloadDecodingFailedToComplete = -3007


@end
