//
//  ItemListViewController.m

#import "ItemListViewController.h"
#import "EGOImageView.h"

@interface ItemListViewController ()

@end

@implementation ItemListViewController

@synthesize itemImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.layer.cornerRadius = 3.0f;
	[self setValuesForControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewWillAppear:(BOOL)animated {
    [itemImage setImage:[UIImage imageNamed:@"Placeholder_itemlisting"]];
}

- (void)setValuesForControl {
    if([[GeneralDeclaration generalDeclaration].currentScreen isEqualToString:@"MyProfileViewController"])
    {
        
       
    }
    else if([[GeneralDeclaration generalDeclaration].currentScreen isEqualToString:@"ShopViewController"])
    {
        
        
    }
    
}
@end
