//
//  MyProfileViewController.m
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import "MyProfileViewController.h"

@interface MyProfileViewController ()

@end

@implementation MyProfileViewController
{
    NSMutableArray *arrData;
}

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
    [GeneralDeclaration generalDeclaration].currentScreen = @"MyProfileViewController";
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


#pragma Tableview Delagate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
    {
        return 213.0f;
    }
    else
        return 217.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrData count] + 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"ItamCell";
    if(indexPath.row == 0)
        CellIdentifier = @"HeaderCell";
    
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsZero;
        cell.userInteractionEnabled = YES;
    }
    
    if([CellIdentifier isEqualToString:@"HeaderCell"])
    {
        cell.backgroundColor = [UIColor clearColor];
        EGOImageView *coverImageView = (EGOImageView *)[cell.contentView viewWithTag:10];
        EGOImageView *userImageview = (EGOImageView *)[cell.contentView viewWithTag:11];
        UISegmentedControl *sgMent = (UISegmentedControl *)[cell.contentView viewWithTag:12];
        [sgMent setSelectedSegmentIndex:1];
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0f];
    }
    return cell;
    
}
@end
