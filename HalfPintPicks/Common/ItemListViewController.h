//
//  ItemListViewController.h


#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface ItemListViewController : UIViewController
{

    IBOutlet UIImageView *likeImg;
}

@property (weak, nonatomic) IBOutlet UILabel *lblitemName;
@property (weak, nonatomic) IBOutlet UILabel *lblComment;
@property (weak, nonatomic) IBOutlet UILabel *lblLike;
@property (weak, nonatomic) IBOutlet UIImageView *imgComment;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet EGOImageView *itemImage;
@end
