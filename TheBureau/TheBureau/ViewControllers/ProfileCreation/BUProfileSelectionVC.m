//
//  BUProfileSelectionVC.m
//  TheBureau
//
//  Created by Manjunath on 25/01/16.
//  Copyright © 2016 Bureau. All rights reserved.
//

#import "BUProfileSelectionVC.h"
#import "BUProfileDetailsVC.h"


@interface BUProfileSelectionVC ()<UIActionSheetDelegate>
@property(nonatomic,weak) IBOutlet UITextField *firstNameTF;
@property(nonatomic,weak) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UILabel *relationLabel;

@property(nonatomic,strong)NSArray* relationCircle;

-(IBAction)continueClicked:(id)sender;


@end

@implementation BUProfileSelectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _relationCircle = [NSArray arrayWithObjects:@"Father",@"Mother",@"Family member", @"Friend", @"Sister", @"Brother",@"Self",nil];

    
    self.firstNameTF.leftViewMode = UITextFieldViewModeAlways;
    self.firstNameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_user"]];
    
    
    self.lastNameTF.leftViewMode = UITextFieldViewModeAlways;
    self.lastNameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_user"]];
    // Do any additional setup after loading the view.
    
    
    [self.navigationController setNavigationBarHidden:NO];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dropDownBtn:(id)sender{
    
    
    
    UIActionSheet *acSheet = [[UIActionSheet alloc] initWithTitle:@"Select relationship with patient" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles: nil];
    
    for (NSString *str in _relationCircle)
    {
        [acSheet addButtonWithTitle:str];
    }
    
    [acSheet showInView:self.view];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0)
    {
        self.relationLabel.text = _relationCircle[buttonIndex - 1];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)continueClicked:(id)sender
{
    UIStoryboard *sb =[UIStoryboard storyboardWithName:@"ProfileCreation" bundle:nil];
    BUProfileDetailsVC *vc = [sb instantiateViewControllerWithIdentifier:@"BUProfileDetailsVC"];
    [self.navigationController pushViewController:vc animated:YES];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}



@end
