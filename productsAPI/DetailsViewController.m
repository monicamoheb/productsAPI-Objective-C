//
//  DetailsViewController.m
//  productsAPI
//
//  Created by Mac on 24/04/2023.
//

#import "DetailsViewController.h"
#import <Cosmos/Cosmos-Swift.h>
//#import "productsAPI-Bridging-Header.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet CosmosView *ratingView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _name.text= _pTitle;
    _price.text=[[NSString alloc] initWithFormat:@"%ld",(long)_pPrice];
    //_price.text=[[NSString alloc] initWithFormat:@"%f",_product.rating];
    NSURL *url=[[NSURL alloc]initWithString:_pthumbnail];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: url];
    _image.image=[UIImage imageWithData:imageData];
    _ratingView.rating=_rating;
    _ratingView.userInteractionEnabled=NO;
    //_ratingView.settings.updateOnTouch = false;
   // [CosmosSettingsObjCBridge setUpdateOnTouch: NO inCosmosView:self.cosmosView];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
