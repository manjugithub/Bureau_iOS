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
#import "BUConstants.h"
#import "BUAuthButton.h"
#import <DigitsKit/DigitsKit.h>
@interface BULoginViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *overLayViewTapConstraint;
@property (assign, nonatomic) CGFloat layoutConstant;

@property (weak, nonatomic) IBOutlet UITextField *emailTF,*passwordTF;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageview;
@property (weak, nonatomic) IBOutlet BUAuthButton *loginBtn;
@property (strong, nonatomic) DGTAppearance *theme;
@property (strong, nonatomic) DGTAuthenticationConfiguration *configuration;

-(IBAction)loginUsingFacebook:(id)sender;
-(IBAction)loginUsingEmail:(id)sender;

@end

@implementation BULoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _theme = [[DGTAppearance alloc] init];
//    _theme.bodyFont = [UIFont fontWithName:@"Comfortaa-Bold" size:16];
//    _theme.labelFont = [UIFont fontWithName:@"Comfortaa-Bold" size:17];
//    _theme.accentColor = [UIColor colorWithRed:(213.0/255.0) green:(15/255.0) blue:(37/255.0) alpha:1];
//    _theme.backgroundColor = [UIColor whiteColor];
//    _theme.logoImage = [UIImage imageNamed:@"logo_splash"];
    
    
    _configuration = [[DGTAuthenticationConfiguration alloc] initWithAccountFields:DGTAccountFieldsDefaultOptionMask];
    _configuration.appearance = [self makeTheme];

}

- (DGTAppearance *)makeTheme {
    DGTAppearance *theme = [[DGTAppearance alloc] init];
    theme.bodyFont = [UIFont fontWithName:@"Comfortaa-Bold" size:16];
    theme.labelFont = [UIFont fontWithName:@"Comfortaa-Bold" size:17];
    theme.accentColor = [UIColor colorWithRed:(213.0/255.0) green:(15/255.0) blue:(37/255.0) alpha:1];
    theme.backgroundColor = [UIColor whiteColor];
    theme.logoImage = [UIImage imageNamed:@"logo_splash"];
    return theme;
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
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;

    
}
-(void)viewDidAppear:(BOOL)animated
{
  //  [self.loginBtn setupButtonThemeWithTitle:@"Login Using Phonenumber"];
//    self.layoutConstant = self.overLayViewTapConstraint.constant;
}

#pragma mark - FACEBOOK -
-(void)associateFacebook
{
    [[FBController sharedInstance]clearSession];
    [[FBController sharedInstance] authenticateWithCompletionHandler:^(BUSocialChannel *socialChannel, NSError *error, BOOL whetherAlreadyAuthenticated) {
        if (!error) {
            [self performSegueWithIdentifier:@"account creation" sender:self];
        }else{
            [[FBController sharedInstance]clearSession];
        }
    }];
}
#pragma mark - TextField Delegates
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.overLayViewTapConstraint.constant = self.layoutConstant-kLoginTopLayoutOffset;
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

-(IBAction)loginUsingFacebook:(id)sender
{
    [self associateFacebook];
}
-(IBAction)loginUsingEmail:(id)sender
{
    [self performSegueWithIdentifier:@"account creation" sender:self];
}

-(IBAction)loginUsingPhonenum:(id)sender{
    
    [[Digits sharedInstance]authenticateWithViewController:nil configuration:_configuration completion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are logged in!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];

}


-(IBAction)logout:(id)sender
{
    
    [[Digits sharedInstance]logOut];

}


@end
