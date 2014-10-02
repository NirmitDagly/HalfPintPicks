//
//  ShopViewController.h
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate,ApiRequestDelegate>
{
    MBProgressHUD *HUD;
}
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *filterBarItem;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBox;
@property (strong, nonatomic) IBOutlet UITableView *tblShopData;

@end
