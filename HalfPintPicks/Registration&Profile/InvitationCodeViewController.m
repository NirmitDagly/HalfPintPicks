//
//  InvitationCodeViewController.m
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import "InvitationCodeViewController.h"
#import "WelComeViewController.h"

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

#pragma Requests
-(void)VarifyInvitationCode {
    
    [self displayLoadingView];
    ApiRequest *apirequest = [[ApiRequest alloc]init];
    apirequest.apiRequestDelegate = self;
    NSString *urlString = [HelperMethod GetWebAPIBasePath];
    
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&InvitationCode=%@",txtCode.text]];
    [apirequest sendJsonGetRequestwithurl:urlString requestId:FirstRequest];
}

-(void)Invitationcoderequest {
    
    [self displayLoadingView];
    ApiRequest *apirequest = [[ApiRequest alloc]init];
    apirequest.apiRequestDelegate = self;
    NSString *urlString = [HelperMethod GetWebAPIBasePath];
    
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&Email=%@",txtEmail.text]];
    [apirequest sendJsonGetRequestwithurl:urlString requestId:SecondRequest];
}

- (IBAction)Join_click:(id)sender {
    //[self Invitationcoderequest];
}

- (IBAction)Submit_click:(id)sender {
    //[self VarifyInvitationCode];
    
    WelComeViewController *welComeVC = (WelComeViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"WelComeViewController"];
    [self presentViewController:welComeVC animated:YES completion:nil];
    
}


//To display loading view
-(void)displayLoadingView
{
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    HUD.delegate = self;
    [HUD hide:YES afterDelay:30.0];
}

//To dismiss loading view
-(void)dismissLoadingView
{
    [HUD removeFromSuperview];
    HUD = nil;
}

#pragma mark MBProgressHUDDelegate methods
- (void)hudWasHidden:(MBProgressHUD *)hud {
	[HUD removeFromSuperview];
	HUD = nil;
}

#pragma Requests callback Delagate Methods
-(void)apiRequestCompletedWithError:(NSString *)errorString requestId:(int)requestId{
    
    UIAlertView *errorAlertView = [[UIAlertView alloc]initWithTitle:[[NSBundle mainBundle] valueForKey:@"CFBundleName"] message:@"Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [errorAlertView show];
    
}

-(void)apiRequestCompletedWithData:(NSMutableData *)responseData requestId:(int)requestId {
    
    NSError *error = nil;
    //NSString *responceString = [[NSString alloc] initWithBytes:[responseData bytes] length:[responseData length] encoding:NSUTF8StringEncoding];
    //NSLog(@"%@",responceString);
    NSDictionary* responceDictionary = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                           error:&error];
    NSLog(@"%@",responceDictionary);
    [self dismissLoadingView];
    if(requestId == FirstRequest)
    {
        NSLog(@"%d",FirstRequest);
        if([[responceDictionary valueForKey:@"status"] intValue] == Success)
        {
            WelComeViewController *welComeVC = (WelComeViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"WelComeViewController"];
            [self presentViewController:welComeVC animated:YES completion:nil];
        }
        
    }
    else if (requestId == SecondRequest)
    {
        NSLog(@"%d",SecondRequest);
        if([[responceDictionary valueForKey:@"status"] intValue] == Success)
        {
            UIAlertView *successRegisteredAlertView = [[UIAlertView alloc]initWithTitle:[[NSBundle mainBundle] valueForKey:@"CFBundleName"] message:@"Thank you for joining with us. \n Your email is successfully registered with us . Please check your email for Invitation code." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [successRegisteredAlertView show];
        }
        else if ([[responceDictionary valueForKey:@"status"] intValue] == Fail)
        {
            UIAlertView *registrationErrorView = [[UIAlertView alloc]initWithTitle:[[NSBundle mainBundle] valueForKey:@"CFBundleName"] message:@"There is some error occured while registering your email .Please try again after some time. \nThank You" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [registrationErrorView show];
        }
    }

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
