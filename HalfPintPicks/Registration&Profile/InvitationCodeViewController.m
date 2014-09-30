//
//  InvitationCodeViewController.m
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import "InvitationCodeViewController.h"

@interface InvitationCodeViewController ()

@end

@implementation InvitationCodeViewController
@synthesize txtEmail,txtCode,btnJoin,btnEnter,lblAppname,lblCodetext,lblEmailtext,scrollView;

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
    // Do any additional setup after loading the view.
}

//Method to Intilization of intial variables and methods
-(void)Intilization {
    [txtCode becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    [scrollView setFrame:CGRectMake(0, 0, [HelperMethod GetDeviceWidth], [HelperMethod GetDeviceHeight])];
    [scrollView setContentSize:CGSizeMake(320, 550)];
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

- (IBAction)Join_click:(id)sender {
}

- (IBAction)Submit_click:(id)sender {
}

#pragma TextField Related Methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([txtEmail isEqual:textField])
    {
        [txtEmail resignFirstResponder];
    }
    else if ([txtCode isEqual:textField])
    {
        [txtCode resignFirstResponder];
        
    }
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([txtEmail isEqual:textField])
    {
        [scrollView setContentSize:CGSizeMake(320, 720)];
        [scrollView scrollRectToVisible:CGRectMake(0, scrollView.frame.size.height - 190, [HelperMethod GetDeviceWidth], scrollView.frame.size.height) animated:YES];
    }
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if([txtEmail isEqual:textField])
    {
        [scrollView setContentSize:CGSizeMake(320, 550)];
        [scrollView scrollRectToVisible:CGRectMake(0, 0, [HelperMethod GetDeviceWidth], [HelperMethod GetDeviceHeight]) animated:YES];
        [scrollView setFrame:CGRectMake(0, 0, [HelperMethod GetDeviceWidth], [HelperMethod GetDeviceHeight])];
    }
    return YES;
}

@end
