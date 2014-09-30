//
//  WelComeViewController.m
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import "WelComeViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface WelComeViewController ()

@end

@implementation WelComeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self Intilization];
    // Do any additional setup after loading the view.
}

-(void)Intilization {
    [btnTwitter.layer setCornerRadius:3.0f];
    [btnLoginFacebook.layer setCornerRadius:3.0f];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Signup_Click:(id)sender {
    RegisterViewController *signUpVC = (RegisterViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self presentViewController:signUpVC animated:YES completion:nil];
}

- (IBAction)Login_Click:(id)sender {
    LoginViewController *loginVC = (LoginViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginVC animated:YES completion:nil];
}

- (IBAction)FacebookLogin_Click:(id)sender {
}

- (IBAction)Twitter_Click:(id)sender {
}
@end
