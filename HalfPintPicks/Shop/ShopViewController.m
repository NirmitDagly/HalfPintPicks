//
//  ShopViewController.m
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()

@end

@implementation ShopViewController
{
    NSMutableArray *arrShoppingData;
    ItemListViewController *itemListViewController;
}
@synthesize searchBox,tblShopData,navBar,navItem,filterBarItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arrShoppingData = [[NSMutableArray alloc]init];
    [GeneralDeclaration generalDeclaration].currentScreen = @"ShopViewController";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
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

//To display loading view
-(void)displayLoadingView {
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    HUD.delegate = self;
    [HUD hide:YES afterDelay:30.0];
}

//To dismiss loading view
-(void)dismissLoadingView {
    [HUD removeFromSuperview];
    HUD = nil;
}

#pragma mark MBProgressHUDDelegate methods
- (void)hudWasHidden:(MBProgressHUD *)hud {
	[HUD removeFromSuperview];
	HUD = nil;
}

#pragma AddtoCart Events
- (void)AddtoCart:(id)sender {
    UIButton *cartButton = (UIButton *)sender;
    NSLog(@"%ld",(long)cartButton.tag);
}

#pragma Requests
//FirstRequest
-(void)GetAllAvailableItemsList {
    [self displayLoadingView];
    ApiRequest *apirequest = [[ApiRequest alloc]init];
    apirequest.apiRequestDelegate = self;
    NSString *urlString = [HelperMethod GetWebAPIBasePath];
    
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&Email=%@",@""]];
    [apirequest sendJsonGetRequestwithurl:urlString requestId:FirstRequest];
}

#pragma Requests callback Delagate Methods
-(void)apiRequestCompletedWithError:(NSString *)errorString requestId:(int)requestId{
    
    UIAlertView *errorAlertView = [[UIAlertView alloc]initWithTitle:[[NSBundle mainBundle] valueForKey:@"CFBundleName"] message:@"Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [errorAlertView show];
    
}

-(void)apiRequestCompletedWithData:(NSMutableData *)responseData requestId:(int)requestId {
    
    NSError *error = nil;
    NSDictionary* responceDictionary = [NSJSONSerialization JSONObjectWithData:responseData
                                                                       options:kNilOptions
                                                                         error:&error];
    NSLog(@"%@",responceDictionary);
    [self dismissLoadingView];
    NSLog(@"%d",requestId);
    
    if([[responceDictionary valueForKey:@"status"] intValue] == Success)
    {
        if(requestId == FirstRequest)
        {
            [self.tblShopData reloadData];
            
        }
    }
    else if([[responceDictionary valueForKey:@"status"] intValue] == Fail)
    {
        UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:[[NSBundle mainBundle] valueForKey:@"CFBundleName"] message:@"There is some error occured . Please check." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    
}

#pragma Search Button Delegate Methods
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
     [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
}

#pragma Tableview Delagate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 235.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ([arrShoppingData count]  / 2) + ([arrShoppingData count] % 2) + 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
        return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.separatorInset = UIEdgeInsetsZero;
            cell.backgroundColor = [UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0f];
        }
        //ItemBoutique *itemInfo = (ItemBoutique *) [arrItemData objectAtIndex:(indexPath.row ) * 2];
        itemListViewController = (ItemListViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"ItemListViewController"];
        //itemListViewController.itemInfo = itemInfo;
        itemListViewController.view.tag = (indexPath.row) * 2;
        itemListViewController.view.frame = CGRectMake(8, 9, 150, 225);
    
        UIButton *btnCart = [UIButton buttonWithType:UIButtonTypeCustom];
        btnCart.frame = CGRectMake(itemListViewController.view.frame.size.width - 50, 10, 40 , 40);
        [btnCart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnCart setTitle:@"Cart" forState:UIControlStateNormal];
        btnCart.backgroundColor = [UIColor blackColor];
        btnCart.layer.cornerRadius = 5.0f;
        [btnCart addTarget:self action:@selector(AddtoCart:) forControlEvents:UIControlEventTouchUpInside];
        btnCart.userInteractionEnabled = YES;
        btnCart.tag = indexPath.row * 2;
        [itemListViewController.view addSubview:btnCart];
        [cell addSubview:itemListViewController.view];
        
//                if((((indexPath.row) * 2) + 1) < [arrItemData count])
//                    itemInfo = (ItemBoutique *) [arrItemData objectAtIndex:(((indexPath.row) * 2) + 1)];
//                else
//                    itemInfo = nil;
//        
//                if(itemInfo != nil)
//                {
//                    itemListViewController = (ItemListViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"ItemListViewController"];
//                    //itemListViewController.itemInfo = itemInfo;
//                    itemListViewController.view.frame = CGRectMake(164, 0, 150, 225);
//                    itemListViewController.view.tag = ((indexPath.row) * 2) + 1;
//                    btnCart.tag = ((indexPath.row) * 2) + 1;
//                    [itemListViewController.view addSubview:btnCart];
//                    [cell addSubview:itemListViewController.view];
//                }
    
        return cell;
    
}

@end
