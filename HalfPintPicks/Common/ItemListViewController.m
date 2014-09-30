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
	[self setValuesForControl];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"Memory Warning : %@", NSStringFromClass([self class]));
    [super didReceiveMemoryWarning];
}
-(void)viewWillAppear:(BOOL)animated {
    [itemImage setImage:[UIImage imageNamed:@"Placeholder_itemlisting"]];
}

- (void)setValuesForControl {
    if([[GeneralDeclaration generalDeclaration].currentScreen isEqualToString:@"MyProfileViewController"])
    {
        
       
    }
    
}
@end
