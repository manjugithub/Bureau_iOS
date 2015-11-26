//
//  BULoginViewController.m
//  TheBureau
//
//  Created by Manjunath on 26/11/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import "BULoginViewController.h"
#import "FBController.h"
#import "BUSocialChannel.h"

@interface BULoginViewController ()

@end

@implementation BULoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewDidAppear:(BOOL)animated
{
//    [self performSelector:@selector(associateFacebook) withObject:nil afterDelay:2.0];
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

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    return YES;
}

@end
