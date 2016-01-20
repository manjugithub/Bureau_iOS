//
//  BUBaseViewController.h
//  TheBureau
//
//  Created by Manjunath on 26/11/15.
//  Copyright © 2015 Bureau. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    eNavFromFb,
    eNavFromEmail,
    eNavFromPhoneNumber
   } eNavigatedFrom;

@interface BUBaseViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic, weak) IBOutlet UILabel *navigationTitleLabel;
-(IBAction)navigateBack:(id)sender;
@end
