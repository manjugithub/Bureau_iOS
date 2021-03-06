//
//  BUSplashViewController.m
//  TheBureau
//
//  Created by Accion Labs on 18/01/16.
//  Copyright © 2016 Bureau. All rights reserved.
//

#import "BUSplashViewController.h"
#import "UIImage+animatedGIF.h"
#import "BUProfileOccupationVC.h"
#import "BUProfileSelectionVC.h"
#import "BUProfileDetailsVC.h"
#import "BUAccountCreationVC.h"
#import "BUHomeTabbarController.h"
@interface BUSplashViewController ()
{
    
    NSTimer *splashTimer;

}
@property (strong, nonatomic) IBOutlet UIImageView *dataImageView;
@end

@implementation BUSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"TheBureau_Splash" withExtension:@"gif"];
    self.dataImageView.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
    
    self.navigationController.navigationBarHidden = YES;
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
    
    
   splashTimer  = [NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(aTime) userInfo:nil repeats:NO];

    
}

-(void)aTime
{
    [splashTimer invalidate];
    
   [self performSegueWithIdentifier:@"main" sender:self];
    
//    UIStoryboard *sb =[UIStoryboard storyboardWithName:@"ProfileCreation" bundle:nil];
//    BUProfileDetailsVC *vc = [sb instantiateViewControllerWithIdentifier:@"BUProfileDetailsVC"];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    UIStoryboard *sb =[UIStoryboard storyboardWithName:@"HomeView" bundle:nil];
//    BUHomeTabbarController *vc = [sb instantiateViewControllerWithIdentifier:@"BUHomeTabbarController"];
//    [self.navigationController pushViewController:vc animated:YES];
    

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
