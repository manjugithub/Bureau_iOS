//
//  BUBaseViewController.m
//  TheBureau
//
//  Created by Manjunath on 26/11/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import "BUBaseViewController.h"

@interface BUBaseViewController ()

@end

@implementation BUBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


-(IBAction)navigateBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
