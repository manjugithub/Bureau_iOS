//
//  BUSignUpViewController.m
//  TheBureau
//
//  Created by Apple on 27/11/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import "BUSignUpViewController.h"
#import "FBController.h"
#import "BUSocialChannel.h"
#import "BUConstants.h"
@interface BUSignUpViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *overLayViewTapConstraint;
@property (assign, nonatomic) CGFloat layoutConstant;


@property (weak, nonatomic) IBOutlet UITextField *emailTF,*passwordTF,*confirmPaswordTF;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageview;

-(IBAction)signupUsingFacebook:(id)sender;
-(IBAction)signupUsingEmail:(id)sender;

@end

@implementation BUSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    self.layoutConstant = self.overLayViewTapConstraint.constant;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - FACEBOOK -
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
#pragma mark - TextField Delegates
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.overLayViewTapConstraint.constant = self.layoutConstant-kSignupTopLayoutOffset;
    } completion:^(BOOL finished) {
    }];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.overLayViewTapConstraint.constant = self.layoutConstant;
    } completion:^(BOOL finished) {
    }];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.overLayViewTapConstraint.constant = self.layoutConstant;
    } completion:^(BOOL finished) {
    }];
    return YES;
}


#pragma mark - Action Methods

-(IBAction)signupUsingFacebook:(id)sender
{
    [self associateFacebook];
}
-(IBAction)signupUsingEmail:(id)sender
{
    
}

@end
