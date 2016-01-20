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
#import "BUAccountCreationVC.h"
#import <DigitsKit/DigitsKit.h>

@interface BUSignUpViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *overLayViewTapConstraint;
@property (assign, nonatomic) CGFloat layoutConstant;


@property (weak, nonatomic) IBOutlet UITextField *emailTF,*passwordTF,*confirmPaswordTF;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageview;
@property (strong, nonatomic) DGTAuthenticationConfiguration *configuration;
@property(nonatomic) eNavigatedFrom navFrom;



-(IBAction)signupUsingFacebook:(id)sender;
-(IBAction)signupUsingEmail:(id)sender;

@end

@implementation BUSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    _configuration = [[DGTAuthenticationConfiguration alloc] initWithAccountFields:DGTAccountFieldsDefaultOptionMask];
  //  _configuration.appearance = [self makeTheme];
    
    _configuration = [[DGTAuthenticationConfiguration alloc] initWithAccountFields:DGTAccountFieldsEmail];
    
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
            self.navFrom = eNavFromFb;
            
            UIStoryboard *sb =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            BUAccountCreationVC *vc = [sb instantiateViewControllerWithIdentifier:@"AccountCreationVC"];
            vc.socialChannel = socialChannel;
            
            [self.navigationController pushViewController:vc animated:YES];
          // [self performSegueWithIdentifier:@"ShowAccount" sender:self];
          //  [self.navigationController pu ]
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
    [self performSegueWithIdentifier:@"ShowAccount" sender:self];
}

-(IBAction)signUpUsingPhonenum:(id)sender{
    
//    [[Digits sharedInstance]authenticateWithViewController:nil configuration:_configuration completion:^(DGTSession *session, NSError *error) {
//        if (session.userID) {
//            // TODO: associate the session userID with your user model
//            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are logged in!"
//                                                            message:msg
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
//        } else if (error) {
//            NSLog(@"Authentication error: %@", error.localizedDescription);
//        }
//    }];
    
    [[Digits sharedInstance] authenticateWithViewController:nil configuration:_configuration completion:^(DGTSession *session, NSError *error) {
        if (session) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // TODO: associate the session userID with your user model
                NSString *message = [NSString stringWithFormat:@"Email address: %@, phone number: %@", session.emailAddress, session.phoneNumber];
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You are logged in!" message:message preferredStyle:UIAlertControllerStyleAlert];
                [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
                [self presentViewController:alertController animated:YES completion:nil];
            });
        } else {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    
}

@end
