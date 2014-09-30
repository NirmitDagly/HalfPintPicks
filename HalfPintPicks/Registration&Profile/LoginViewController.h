//
//  LoginViewController.h
//  HalfPintPicks
//
//  Created by MAAUMA on 9/27/14.
//  Copyright (c) 2014 Visionary IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtEMail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
- (IBAction)Login_Click:(id)sender;
- (IBAction)Close_Click:(id)sender;

@end
