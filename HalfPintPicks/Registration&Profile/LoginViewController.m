//
//  LoginViewController.m
//  HalfPintPicks
//
//  Created by MAAUMA on 9/27/14.
//  Copyright (c) 2014 Visionary IT Solutions. All rights reserved.
//

#import "LoginViewController.h"
#import "TabbarViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize txtEMail,txtPassword;

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
    txtPassword.delegate = self;
    txtEMail.delegate = self;
    // Do any additional setup after loading the view.
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


- (IBAction)Login_Click:(id)sender {
    TabbarViewController *tabVC = (TabbarViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"TabbarViewController"];
    //[self.navigationController pushViewController:tabVC animated:YES];
    [self presentViewController:tabVC animated:YES completion:nil];
}

- (IBAction)Close_Click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
