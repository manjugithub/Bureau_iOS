//
//  BUWebServicesManager.h
//  TheBureau
//
//  Created by Manjunath on 25/01/16.
//  Copyright © 2016 Bureau. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BUWebServicesCallBack <NSObject>

-(void)didSuccess:(id)inResult;
-(void)didFail:(id)inResult;

@end

@interface BUWebServicesManager : NSObject

@property (nonatomic, weak) id<BUWebServicesCallBack>delegate;

+(instancetype)sharedManager;
-(void)signUpWithDelegeate:(id<BUWebServicesCallBack>)inDelegate parameters:(NSDictionary *)inParams;
-(void)loginWithDelegeate:(id<BUWebServicesCallBack>)inDelegate parameters:(NSDictionary *)inParams;
-(void)getReligionList:(id<BUWebServicesCallBack>)inDelegate parameters:(NSDictionary *)inParams;
-(void)getFamilyOriginList:(id<BUWebServicesCallBack>)inDelegate parameters:(NSDictionary *)inParams;
-(void)getSpecificationList:(id<BUWebServicesCallBack>)inDelegate parameters:(NSDictionary *)inParams;
@end
