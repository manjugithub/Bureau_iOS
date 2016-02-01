//
//  BUCustomAlertView.m
//  TheBureau
//
//  Created by Accion Labs on 01/02/16.
//  Copyright © 2016 Bureau. All rights reserved.
//

#import "BUCustomAlertView.h"
#import <UIKit/UIKit.h>
#import "UIView+FLKAutoLayout.h"

@implementation BUCustomAlertView


+(void)showAlertView{
    
    
    
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Birthday\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    [picker setDatePickerMode:UIDatePickerModeDate];
    [alertController.view addSubview:picker];
    [picker alignCenterYWithView:alertController.view predicate:@"0.0"];
    [picker alignCenterXWithView:alertController.view predicate:@"0.0"];
    [picker constrainWidth:@"270" ];
    
    [alertController addAction:({
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK");
            NSLog(@"%@",picker.date);
        }];
        action;
    })];
    
    [alertController addAction:({
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"cancel");
            //NSLog(@"%@",picker.date);
        }];
        action;
    })];
  //  UIPopoverPresentationController *popoverController = alertController.popoverPresentationController;
  //  popoverController.sourceView = sender;
 //   popoverController.sourceRect = [sender bounds];
 //   [self presentViewController:alertController  animated:YES completion:nil];
    
    
}


@end
