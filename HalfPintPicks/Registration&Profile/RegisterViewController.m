//
//  RegisterViewController.m
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize txtEmail,btnClose,btnJoin,lblApptitle,lblInfoText;

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

//Method to Intilization of intial variables and methods
-(void)Intilization {
    txtEmail.delegate = self;
    [txtEmail becomeFirstResponder];
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

- (IBAction)Join_Click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)Close_click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma TextField Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([txtEmail isEqual:textField])
    {
        [txtEmail resignFirstResponder];
    }
    return YES;
}
@end
