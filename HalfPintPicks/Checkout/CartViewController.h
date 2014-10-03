//
//  CartViewController.h
//  HalfPintPicks
//
//  Copyright (c) 2014 TechCronus . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnCart;
@property (strong, nonatomic) IBOutlet UIButton *btnShipping;
@property (strong, nonatomic) IBOutlet UIButton *btnPayment;
- (IBAction)CartStep_Click:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *selectionImage;

@end
