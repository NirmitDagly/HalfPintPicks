//
//  RegisterViewController.h
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate,ApiRequestDelegate,MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
}
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
- (IBAction)Join_Click:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblInfoText;
@property (strong, nonatomic) IBOutlet UILabel *lblApptitle;
- (IBAction)Close_click:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnClose;
@property (strong, nonatomic) IBOutlet UIButton *btnJoin;

@end
