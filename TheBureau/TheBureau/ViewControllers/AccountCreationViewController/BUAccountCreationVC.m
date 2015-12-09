//
//  BUAccountCreationVC.m
//  TheBureau
//
//  Created by Manjunath on 01/12/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import "BUAccountCreationVC.h"

@interface BUAccountCreationVC ()


@property(nonatomic,weak) IBOutlet UITextField *firstNameTF;
@property(nonatomic,weak) IBOutlet UITextField *lastNameTF;

@property(nonatomic,weak) IBOutlet UITextField *emailIdTF;
@property(nonatomic,weak) IBOutlet UITextField *mobileNumTF;
@property(nonatomic,weak) IBOutlet UITextField *dateofbirthTF;


@end

@implementation BUAccountCreationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.firstNameTF.leftViewMode = UITextFieldViewModeAlways;
    self.firstNameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_user"]];
    
    self.firstNameTF.layer.sublayerTransform = CATransform3DMakeTranslation(0, 0, 30);
    
    self.lastNameTF.leftViewMode = UITextFieldViewModeAlways;
    self.lastNameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_user"]];
    
    self.emailIdTF.leftViewMode = UITextFieldViewModeAlways;
    self.emailIdTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_email"]];
    
    self.mobileNumTF.leftViewMode = UITextFieldViewModeAlways;
    self.mobileNumTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_mobile"]];
    
    self.dateofbirthTF.leftViewMode = UITextFieldViewModeAlways;
    self.dateofbirthTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_dob"]];


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

@end
