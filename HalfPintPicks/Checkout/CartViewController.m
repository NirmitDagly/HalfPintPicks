//
//  CartViewController.m
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@end

@implementation CartViewController
{
    int selectedIndex;
}

@synthesize selectionImage;

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
    [self SetUIApperence];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)SetUIApperence {
    self.btnCart.backgroundColor = [UIColor clearColor];
    self.btnPayment.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:154.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
    self.btnShipping.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:154.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
    
    selectedIndex = FirstIndex;
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

- (IBAction)CartStep_Click:(id)sender {
    UIButton *btnSelected = (UIButton *)sender;
    if(btnSelected.tag == 15)
    {
        selectedIndex = FirstIndex;

        [UIView animateWithDuration:0.2 delay:0.0 options:(UIViewAnimationOptionCurveLinear & UIViewAnimationOptionBeginFromCurrentState) animations:^{
            selectionImage.frame = CGRectMake(0, 0, self.selectionImage.frame.size.width, self.selectionImage.frame.size.height);
            self.btnCart.backgroundColor = [UIColor clearColor];
            self.btnShipping.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:154.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
            self.btnPayment.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:154.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
        }completion:^(BOOL complete){
            //
        }];
        
        //[self GetApprovedItemList];
    }
    else if (btnSelected.tag == 16)
    {
        selectedIndex = SecondIndex;
        
        [UIView animateWithDuration:0.2 delay:0.0 options:(UIViewAnimationOptionCurveLinear & UIViewAnimationOptionBeginFromCurrentState) animations:^{
            selectionImage.frame = CGRectMake(106, 0, self.selectionImage.frame.size.width, self.selectionImage.frame.size.height);
            self.btnShipping.backgroundColor = [UIColor clearColor];
            self.btnCart.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:154.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
            self.btnPayment.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:154.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
        }completion:^(BOOL complete){
            //
        }];
        
        //[self GetFollowersList];
    }
    else
    {
        selectedIndex = ThirdIdex;
        
        [UIView animateWithDuration:0.2 delay:0.0 options:(UIViewAnimationOptionCurveLinear & UIViewAnimationOptionBeginFromCurrentState) animations:^{
            selectionImage.frame = CGRectMake(214, 0, self.selectionImage.frame.size.width, self.selectionImage.frame.size.height);
            self.btnPayment.backgroundColor = [UIColor clearColor];
            self.btnShipping.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:154.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
            self.btnCart.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:154.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
        }completion:^(BOOL complete){
            //
        }];
        
        //[self GetFollowingList];
    }
}
@end
