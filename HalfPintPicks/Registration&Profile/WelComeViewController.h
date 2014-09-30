//
//  WelComeViewController.h
//  HalfPintPicks
//
//  Created by MAAUMA on 9/27/14.
//  Copyright (c) 2014 Visionary IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelComeViewController : UIViewController
{
    IBOutlet UIButton *btnLoginFacebook;
    IBOutlet UIButton *btnTwitter;
    IBOutlet UIButton *btnSignUp;
    IBOutlet UIButton *btnLogin;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIPageControl *pgControl;
}
- (IBAction)Signup_Click:(id)sender;
- (IBAction)Login_Click:(id)sender;
- (IBAction)FacebookLogin_Click:(id)sender;
- (IBAction)Twitter_Click:(id)sender;

@end
