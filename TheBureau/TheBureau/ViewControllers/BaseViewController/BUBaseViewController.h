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


typedef enum {
    eLoginFromFB,
    eLoginFromDigit
} eLoginType;


typedef enum {
    eRegistrationFromFB,
    eRegistrationFromDigit
} eRegistrationType;


@interface BUBaseViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic, weak) IBOutlet UILabel *navigationTitleLabel;
-(IBAction)navigateBack:(id)sender;

/** Returns YES if the activity indicator is being shown
 */
- (BOOL) isShowingActivityIndicator;

/** Starts the activity indicator
 */
- (void)startActivityIndicator:(BOOL)isWhite;

/** Stops the activity indicator
 */
- (void)stopActivityIndicator;
- (void)startCustomActivityIndicator:(BOOL)isWhite;
- (void)stopCustomActivityIndicator;
@end
