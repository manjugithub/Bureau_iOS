//
//  BUSignUpViewController.h
//  TheBureau
//
//  Created by Apple on 27/11/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import "BUBaseViewController.h"
#import "BUWebServicesManager.h"
#import "BUSocialChannel.h"

@interface BUSignUpViewController : BUBaseViewController<BUWebServicesCallBack>

@property(nonatomic, strong) BUSocialChannel *socialChannel;
@property(nonatomic, assign) eRegistrationType registrationType;

@end
