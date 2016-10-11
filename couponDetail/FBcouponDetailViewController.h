//
//  FBcouponDetailViewController.h
//  couponDetail
//
//  Created by cc on 16/8/8.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBcouponDetailViewController : UIViewController

@property (strong, nonatomic) UIImage  *shopImage;
@property (copy,   nonatomic) NSString *shopName;
@property (copy,   nonatomic) NSString *shopPromotion;

@property (copy,   nonatomic) NSString *couponContent;
@property (copy,   nonatomic) NSString *useCondition;

@property (copy,   nonatomic) NSString *expiryDate;

@property (copy,   nonatomic) NSString *introductionInstruction;
@property (strong, nonatomic) UIImage  *introductionImage;

@property (strong, nonatomic) UIImage  *qrcodeImage;

@end
