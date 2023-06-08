//
//  DetailsViewController.h
//  productsAPI
//
//  Created by Mac on 24/04/2023.
//

#import "ViewController.h"
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : ViewController

@property NSString *pTitle;
@property NSInteger pPrice;
@property  NSString *pthumbnail;
@property double rating;

@end

NS_ASSUME_NONNULL_END
