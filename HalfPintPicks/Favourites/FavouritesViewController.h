//
//  FavouritesViewController.h
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavouritesViewController : UIViewController<ApiRequestDelegate,MBProgressHUDDelegate,UITableViewDataSource,UITableViewDelegate>
{
    MBProgressHUD *HUD;
}
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBox;
@property (weak, nonatomic) IBOutlet UITableView *tblItemData;

@end
