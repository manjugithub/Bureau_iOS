//
//  BUTroubleInlLoginVC.m
//  TheBureau
//
//  Created by Accion Labs on 01/12/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import "BUTroubleInlLoginVC.h"

@interface BUTroubleInlLoginVC ()

@end

@implementation BUTroubleInlLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Login Problem";

    self.navigationController.navigationBarHidden = NO;
    
    self.navigationController.navigationBar.backItem.title = @" ";

   
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
