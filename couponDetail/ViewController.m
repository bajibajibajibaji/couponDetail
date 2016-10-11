//
//  ViewController.m
//  couponDetail
//
//  Created by cc on 16/8/4.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"
#import "FBcouponDetailViewController.h"
#import "constant.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"111";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    FBcouponDetailViewController *couponDetailVC = [[FBcouponDetailViewController alloc] init];
    couponDetailVC.shopImage = imageOfAutoScaleImage(@"c1 get.png");
    couponDetailVC.shopName = @"玩具反斗城（光谷店）";
    couponDetailVC.shopPromotion = @"年终大促，全场玩具8.8折";
    
    couponDetailVC.couponContent = @"8.8折";
    couponDetailVC.useCondition = @"购买至少一件玩具商品(特价除外)";
    
    couponDetailVC.expiryDate = @"2016-06-01至9999-12-31";
    
    couponDetailVC.introductionInstruction = @"活动/试听课/特定玩具介绍等说明，普通优惠劵折扣卷此栏隐藏。的的的的的的的的的的的的的的的的的的的的的的的的的的";
    couponDetailVC.introductionImage = imageOfAutoScaleImage(@"c1 get.png");
    couponDetailVC.qrcodeImage = imageOfAutoScaleImage(@"c1 get.png");
    
    [self.navigationController pushViewController:couponDetailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
