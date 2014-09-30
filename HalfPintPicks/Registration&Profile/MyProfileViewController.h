//
//  MyProfileViewController.h
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tblMyprofileData;

@end
