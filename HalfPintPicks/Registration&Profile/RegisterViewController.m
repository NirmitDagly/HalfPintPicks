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

#pragma Send Requests
-(void)Invitationcoderequest {
    
    [self displayLoadingView];
    ApiRequest *apirequest = [[ApiRequest alloc]init];
    apirequest.apiRequestDelegate = self;
    NSString *urlString = [HelperMethod GetWebAPIBasePath];
    
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&Email=%@",txtEmail.text]];
    [apirequest sendJsonGetRequestwithurl:urlString requestId:FirstRequest];
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
    NSLog(@"%d",requestId);
    if(requestId == FirstRequest)
    {
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
