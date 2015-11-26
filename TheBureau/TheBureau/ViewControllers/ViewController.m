//
//  ViewController.m
//  TheBureau
//
//  Created by Manjunath on 26/11/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import "ViewController.h"
#import "FBController.h"
#import "BUSocialChannel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [self performSelector:@selector(associateFacebook) withObject:nil afterDelay:2.0];
}


#pragma - FACEBOOK -
-(void)associateFacebook
{
    [[FBController sharedInstance]clearSession];
    [[FBController sharedInstance] authenticateWithCompletionHandler:^(BUSocialChannel *socialChannel, NSError *error, BOOL whetherAlreadyAuthenticated) {
        if (!error) {
            
        }else{
            [[FBController sharedInstance]clearSession];
        }
    }];
}
@end
