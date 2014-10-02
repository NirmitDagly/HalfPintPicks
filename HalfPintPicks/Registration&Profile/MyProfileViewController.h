//
//  MyProfileViewController.h
//  HalfPintPicks
//

//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate,ApiRequestDelegate>
{
    MBProgressHUD *HUD;
}
@property (weak, nonatomic) IBOutlet UITableView *tblMyprofileData;
@property (strong, nonatomic) IBOutlet UIView *vwProfileDetails;
@property (strong, nonatomic) IBOutlet UIImageView *imgCoverPhoto;
@property (strong, nonatomic) IBOutlet UIImageView *imgProfilePhoto;
@property (strong, nonatomic) IBOutlet UIButton *btnFollow;
- (IBAction)Follow_Click:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblLocation;
@property (strong, nonatomic) IBOutlet UILabel *lblChildName;
@property (strong, nonatomic) IBOutlet UIImageView *imgChildImage;
@property (strong, nonatomic) IBOutlet UIButton *btnAddKid;
- (IBAction)Addkid_click:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
- (IBAction)Segment_Click:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *ScrollImage;
@property (strong, nonatomic) IBOutlet UIButton *btnFirst;
@property (strong, nonatomic) IBOutlet UIButton *btnSecond;
@property (strong, nonatomic) IBOutlet UIButton *btnThird;
@property (strong, nonatomic) IBOutlet UITableView *tblFollowers;

@end
