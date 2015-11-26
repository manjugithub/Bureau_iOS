//
//  BUBaseViewController.h
//  TheBureau
//
//  Created by Manjunath on 26/11/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BUBaseViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic, weak) IBOutlet UILabel *navigationTitleLabel;
-(IBAction)navigateBack:(id)sender;
@end
