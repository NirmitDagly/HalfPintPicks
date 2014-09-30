//
//  LoginViewController.m
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
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
    [self Intilization];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Method to Intilization of intial variables and methods
-(void)Intilization {
    txtPassword.delegate = self;
    txtEMail.delegate = self;
    [txtEMail becomeFirstResponder];
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
    [tabVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:tabVC animated:YES completion:nil];
}

- (IBAction)Close_Click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma TextField Related Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([self.txtEMail isEqual:textField])
    {
        [txtEMail resignFirstResponder];
        [txtPassword becomeFirstResponder];
    }
    else if ([txtPassword isEqual:textField])
    {
        [txtPassword resignFirstResponder];
        
    }
    return YES;
}
@end
