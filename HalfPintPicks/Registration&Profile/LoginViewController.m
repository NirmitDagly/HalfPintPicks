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
    //[self Sendloginrequest];
    
    TabbarViewController *tabVC = (TabbarViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"TabbarViewController"];
    [tabVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:tabVC animated:YES completion:nil];
}

- (IBAction)Close_Click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma Requests
-(void)Sendloginrequest {
    
    [self displayLoadingView];
    ApiRequest *apirequest = [[ApiRequest alloc]init];
    apirequest.apiRequestDelegate = self;
    NSString *urlString = [HelperMethod GetWebAPIBasePath];
    
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&Email=%@&Password=%@",txtEMail.text,txtPassword.text]];
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
            TabbarViewController *tabVC = (TabbarViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"TabbarViewController"];
            [tabVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
            [self presentViewController:tabVC animated:YES completion:nil];
        }
        else if([[responceDictionary valueForKey:@"status"] intValue] == Fail)
        {
            UIAlertView *loginAlertView = [[UIAlertView alloc]initWithTitle:[[NSBundle mainBundle] valueForKey:@"CFBundleName"] message:@"There is some error occured . Please check." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [loginAlertView show];
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
        //[self Sendloginrequest];
    }
    return YES;
}
@end
