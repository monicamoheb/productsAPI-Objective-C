//
//  Product.h
//  productsAPI
//
//  Created by Mac on 24/04/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *theDescription;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, assign) double discountPercentage;
@property (nonatomic, assign) double rating;
@property (nonatomic, assign) NSInteger stock;
@property (nonatomic, copy)   NSString *brand;
@property (nonatomic, copy)   NSString *category;
@property (nonatomic, copy)   NSString *thumbnail;
@property (nonatomic, copy)   NSArray<NSString *> *images;

@end

NS_ASSUME_NONNULL_END
