//
//  BUWebServicesManager.m
//  TheBureau
//
//  Created by Manjunath on 25/01/16.
//  Copyright © 2016 Bureau. All rights reserved.
//

#import "BUWebServicesManager.h"
#import "AFHTTPSessionManager.h"
#import <AFNetworking.h>
#import "AFHTTPSessionManager.h"
@implementation BUWebServicesManager


+(instancetype)sharedManager
{
    static dispatch_once_t pred;
    static BUWebServicesManager* sharedBUWebServicesManager = nil;
    dispatch_once(&pred, ^{
        sharedBUWebServicesManager = [[BUWebServicesManager alloc] init];
        
    });
    return sharedBUWebServicesManager;
}


- (id)init {
    if (self = [super init]) {
        //        self.allCountryDetailsList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)signUpWithDelegeate:(id<BUWebServicesCallBack>)inDelegate parameters:(NSDictionary *)inParams
{
    self.delegate = inDelegate;
    NSString *baseURL = @"http://app.thebureauapp.com/login/userRegister";

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:baseURL
       parameters:inParams
constructingBodyWithBlock:nil
         progress:nil
          success:^(NSURLSessionDataTask *operation, id responseObject)
     {
         [self.delegate didSuccess:responseObject];
         NSLog(@"Success: %@", responseObject);
     }
          failure:^(NSURLSessionDataTask *operation, NSError *error)
     {
         [self.delegate didFail:error];
         NSLog(@"Error: %@", error);
     }];
    
}


-(void)loginWithDelegeate:(id<BUWebServicesCallBack>)inDelegate parameters:(NSDictionary *)inParams;
{
    
    self.delegate = inDelegate;

    NSString *baseURL = @"http://app.thebureauapp.com/login/checkLogin";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:baseURL
       parameters:inParams
constructingBodyWithBlock:nil
         progress:nil
          success:^(NSURLSessionDataTask *operation, id responseObject)
     {
         [self.delegate didSuccess:responseObject];
         NSLog(@"Success: %@", responseObject);
     }
          failure:^(NSURLSessionDataTask *operation, NSError *error)
     {
         [self.delegate didFail:error];
         NSLog(@"Error: %@", error);
     }];
}

@end
