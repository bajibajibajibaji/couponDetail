//
//  FBcouponDetailViewController.m
//  couponDetail
//
//  Created by cc on 16/8/8.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBcouponDetailViewController.h"
#import "FBInstructionViewController.h"
#import "FBInstructionViewModel.h"
#import "constant.h"

@interface FBcouponDetailViewController ()

// 背景和虚线
@property (strong, nonatomic) UIImageView *borderImageView;
@property (strong, nonatomic) UIImageView *borderImageView1;
@property (strong, nonatomic) UIImageView *borderImageView2;
@property (strong, nonatomic) UIImageView *borderImageView3;

@property (strong, nonatomic) UIImageView *dashLineImageView;
@property (strong, nonatomic) UIImageView *dashLineImageView1;
@property (strong, nonatomic) UIImageView *dashLineImageView2;

// 上面图片框
@property (strong, nonatomic) UIImageView *shopBorderImageView;
@property (strong, nonatomic) UIImageView *shopImageView;

@property (strong, nonatomic) UILabel *shopNameLabel; // 商店名称
@property (strong, nonatomic) UILabel *shopPromotionLabel; // 商店活动


// cell0
@property (strong, nonatomic) UILabel *couponContentTitleLabel; // "劵内容"标题
@property (strong, nonatomic) UILabel *useConditionTitleLabel; // "使用条件"标题

@property (strong, nonatomic) UILabel *couponContentStateLabel; // "劵内容"内容
@property (strong, nonatomic) UILabel *useConditionStateLabel; // "使用条件"内容

@property (strong, nonatomic) UIImageView *realLineImageView; // 实分割线

@property (strong, nonatomic) UILabel *expiryDateTitleLabel; // "有效期"标题
@property (strong, nonatomic) UILabel *expiryDateStateLabel; // "有效期"内容

// cell1
@property (strong, nonatomic) UILabel     *useInstructionLabel; // “使用说明”
@property (strong, nonatomic) UIImageView *useInstructionIndicatorImageView;

@property (strong, nonatomic) UIImageView *realLineImageView2; // 实分割线

@property (strong, nonatomic) UILabel     *introductionInstructionTitleLabel; // “介绍说明”标题
@property (strong, nonatomic) UIImageView *introductionInstructionIndicatorImageView;
@property (strong, nonatomic) UILabel     *introductionInstructionStateLabel; // “介绍说明”内容

@property (strong, nonatomic) UIImageView *introductionImageView;

@property (strong, nonatomic) UIImageView *realLineImageView3; // 实分割线

@property (strong, nonatomic) UILabel *applicableShopLabel; // 适用门店
@property (strong, nonatomic) UIImageView *applicableShopImageView;

// cell2
@property (strong, nonatomic) UILabel *cell2TextLabel;
@property (strong, nonatomic) UIImageView *qrCodeImageView;

// cell3
@property (strong, nonatomic) UILabel *cell3TextLabel;

@end

@implementation FBcouponDetailViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self subInit];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutInit];
}

- (void)subInit
{
    self.title = @"详情说明";
    
    [self borderInit];
    [self cell0Init];
    [self cell1Init];
    [self cell2Init];
    [self cell3Init];
}

- (void)layoutInit
{
    self.view.backgroundColor = [UIColor colorWithRed:35.0f/255.0f green:205.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
    
    [self borderLayout];
    [self cell0Layout];
    [self cell1Layout];
    [self cell2Layout];
    [self cell3Layout];
}

- (void)borderInit
{
    self.borderImageView = imageViewOfAutoScaleImage(@"c4 Coupon background4.png");
    self.borderImageView.layer.contentsCenter = CGRectMake(0.45, 0.45, 0.1, 0.1);
    
    self.borderImageView1 = imageViewOfAutoScaleImage(@"c4 Coupon background5.png");
    self.borderImageView1.layer.contentsCenter = CGRectMake(0.45, 0.45, 0.1, 0.1);
    
    self.borderImageView2 = imageViewOfAutoScaleImage(@"c4 Coupon background5.png");
    self.borderImageView2.layer.contentsCenter = CGRectMake(0.45, 0.45, 0.1, 0.1);
    
    self.borderImageView3 = imageViewOfAutoScaleImage(@"c4 Coupon background7.png");
    self.borderImageView3.layer.contentsCenter = CGRectMake(0.45, 0.45, 0.1, 0.1);
    
    self.dashLineImageView = [[UIImageView  alloc] initWithImage:[imageOfAutoScaleImage(@"c4 Division2.png") resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile]];
    self.dashLineImageView1 = [[UIImageView  alloc] initWithImage:[imageOfAutoScaleImage(@"c4 Division2.png") resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile]];
    self.dashLineImageView2 = [[UIImageView  alloc] initWithImage:[imageOfAutoScaleImage(@"c4 Division2.png") resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile]];
    
    self.shopBorderImageView = imageViewOfAutoScaleImage(@"c3 Head.png");
    self.shopImageView = [[UIImageView alloc] init];
    
    // 商店名称
    self.shopNameLabel = [[UILabel alloc] init];
    self.shopNameLabel.textAlignment = NSTextAlignmentCenter;
    self.shopNameLabel.numberOfLines = 1;
    self.shopNameLabel.font = [UIFont boldSystemFontOfSize:15 * RATIO];
    self.shopNameLabel.textColor = [UIColor colorWithRed:167.0/255 green:167.0/255 blue:167.0/255 alpha:1.0f];
    
    // 商店活动
    self.shopPromotionLabel = [[UILabel alloc] init];
    self.shopPromotionLabel.textAlignment = NSTextAlignmentCenter;
    self.shopPromotionLabel.numberOfLines = 1;
    self.shopPromotionLabel.font = [UIFont boldSystemFontOfSize:16 * RATIO];
    self.shopPromotionLabel.textColor = [UIColor redColor];
}

- (void)cell0Init
{
    // “劵内容”标题
    self.couponContentTitleLabel = [[UILabel alloc] init];
    self.couponContentTitleLabel.text = @"券内容";
    self.couponContentTitleLabel.numberOfLines = 1;
    self.couponContentTitleLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.couponContentTitleLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
    
    // “使用条件”标题
    self.useConditionTitleLabel = [[UILabel alloc] init];
    self.useConditionTitleLabel.text = @"使用条件";
    self.useConditionTitleLabel.numberOfLines = 1;
    self.useConditionTitleLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.useConditionTitleLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
    
    // "卷内容"内容
    self.couponContentStateLabel = [[UILabel alloc] init];
    self.couponContentStateLabel.numberOfLines = 1;
    self.couponContentStateLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.couponContentStateLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0f];
    
    // “使用条件”内容
    self.useConditionStateLabel = [[UILabel alloc] init];
    self.useConditionStateLabel.numberOfLines = 1;
    self.useConditionStateLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.useConditionStateLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0f];
    
    // 实分割线
    self.realLineImageView = imageViewOfAutoScaleImage(@"c4 Division1.png");
    
    // “有效期”标题
    self.expiryDateTitleLabel = [[UILabel alloc] init];
    self.expiryDateTitleLabel.text = @"有效期";
    self.expiryDateTitleLabel.numberOfLines = 1;
    self.expiryDateTitleLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.expiryDateTitleLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
    
    // “有效期”内容
    self.expiryDateStateLabel = [[UILabel alloc] init];
    self.expiryDateStateLabel.numberOfLines = 1;
    self.expiryDateStateLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.expiryDateStateLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0f];
    
}

- (void)cell1Init
{
    // “使用说明”
    self.useInstructionLabel = [[UILabel alloc] init];
    self.useInstructionLabel.text = @"使用说明";
    self.useInstructionLabel.numberOfLines = 1;
    self.useInstructionLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.useInstructionLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
    self.useInstructionLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *useInstructionLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(useInstructionTap)];
    useInstructionLabelTap.numberOfTapsRequired = 1;
    useInstructionLabelTap.numberOfTouchesRequired = 1;
    [self.useInstructionLabel addGestureRecognizer:useInstructionLabelTap];
    
    // “使用说明”三角图标
    self.useInstructionIndicatorImageView = imageViewOfAutoScaleImage(@"c4 go.png");
    self.useInstructionIndicatorImageView.contentMode = UIViewContentModeCenter;
    self.useInstructionIndicatorImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *useInstructionIndecatorTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(useInstructionTap)];
    useInstructionIndecatorTap.numberOfTapsRequired = 1;
    useInstructionIndecatorTap.numberOfTouchesRequired = 1;
    [self.useInstructionIndicatorImageView addGestureRecognizer:useInstructionIndecatorTap];
    
    // 实分割线
    self.realLineImageView2 = imageViewOfAutoScaleImage(@"c4 Division1.png");
    
    // "介绍说明"标题
    self.introductionInstructionTitleLabel = [[UILabel alloc] init];
    self.introductionInstructionTitleLabel.text = @"介绍说明";
    self.introductionInstructionTitleLabel.numberOfLines = 1;
    self.introductionInstructionTitleLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.introductionInstructionTitleLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
    self.introductionInstructionTitleLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *introductionInstructionTitleLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(introductionInstructionTap)];
    introductionInstructionTitleLabelTap.numberOfTapsRequired = 1;
    introductionInstructionTitleLabelTap.numberOfTouchesRequired = 1;
    [self.introductionInstructionTitleLabel addGestureRecognizer:introductionInstructionTitleLabelTap];
    
    // “介绍说明”三角图标
    self.introductionInstructionIndicatorImageView = imageViewOfAutoScaleImage(@"c4 go.png");
    self.introductionInstructionIndicatorImageView.contentMode = UIViewContentModeCenter;
    self.introductionInstructionIndicatorImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *introductionInstructionIndicatorImageViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(introductionInstructionTap)];
    introductionInstructionIndicatorImageViewTap.numberOfTapsRequired = 1;
    introductionInstructionIndicatorImageViewTap.numberOfTouchesRequired = 1;
    [self.introductionInstructionIndicatorImageView addGestureRecognizer:introductionInstructionIndicatorImageViewTap];
    
    // "介绍说明"内容
    self.introductionInstructionStateLabel = [[UILabel alloc] init];
    self.introductionInstructionStateLabel.numberOfLines = 2;
    self.introductionInstructionStateLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.introductionInstructionStateLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0f];
    self.introductionInstructionStateLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *introductionInstructionStateLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(introductionInstructionTap)];
    introductionInstructionStateLabelTap.numberOfTapsRequired = 1;
    introductionInstructionStateLabelTap.numberOfTouchesRequired = 1;
    [self.introductionInstructionStateLabel addGestureRecognizer:introductionInstructionStateLabelTap];
    
    // “介绍说明”图片
    self.introductionImageView = [[UIImageView alloc] init];
    self.introductionImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *introductionImageViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(introductionInstructionTap)];
    introductionImageViewTap.numberOfTapsRequired = 1;
    introductionImageViewTap.numberOfTouchesRequired = 1;
    [self.introductionImageView addGestureRecognizer:introductionImageViewTap];
    
    // 实分割线
    self.realLineImageView3 = imageViewOfAutoScaleImage(@"c4 Division1.png");
    
    // 适用门店
    self.applicableShopLabel = [[UILabel alloc] init];
    self.applicableShopLabel.text = @"适用门店";
    self.applicableShopLabel.numberOfLines = 1;
    self.applicableShopLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.applicableShopLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
    self.applicableShopLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *applicableShopLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(applicableShopTap)];
    applicableShopLabelTap.numberOfTapsRequired = 1;
    applicableShopLabelTap.numberOfTouchesRequired = 1;
    [self.applicableShopLabel addGestureRecognizer:applicableShopLabelTap];
    
    // “适用门店”三角图标
    self.applicableShopImageView = imageViewOfAutoScaleImage(@"c4 go.png");
    self.applicableShopImageView.contentMode = UIViewContentModeCenter;
    self.applicableShopImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *applicableShopImageViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(applicableShopTap)];
    applicableShopImageViewTap.numberOfTapsRequired = 1;
    applicableShopImageViewTap.numberOfTouchesRequired = 1;
    [self.applicableShopImageView addGestureRecognizer:applicableShopImageViewTap];
 
}

- (void)cell2Init
{
    // cell2Text
    self.cell2TextLabel = [[UILabel alloc] init];
    self.cell2TextLabel.text = @"扫描二维码适用优惠劵";
    self.cell2TextLabel.numberOfLines = 1;
    self.cell2TextLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.cell2TextLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
    
    // 二维码
    self.qrCodeImageView = [[UIImageView alloc] init];
}

- (void)cell3Init
{
    // cell3Text
    self.cell3TextLabel = [[UILabel alloc] init];
    self.cell3TextLabel.text = @"更多优惠 敬请期待";
    self.cell3TextLabel.numberOfLines = 1;
    self.cell3TextLabel.font = [UIFont boldSystemFontOfSize:14 * RATIO];
    self.cell3TextLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
}

- (void)borderLayout
{
    WS(ws);
    
    [self.view addSubview:self.borderImageView];
    [self.borderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(370*RATIO, 179*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).offset(64+25*RATIO_V);
    }];
    
    [self.view addSubview:self.borderImageView1];
    [self.borderImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(370*RATIO, 296*RATIO));
        make.width.mas_equalTo(@(370*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.borderImageView.mas_bottom);
    }];
    
    [self.view addSubview:self.borderImageView2];
    [self.borderImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(370*RATIO, 114*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.borderImageView1.mas_bottom);
    }];
    
    [self.view addSubview:self.borderImageView3];
    [self.borderImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(370*RATIO, 27*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.borderImageView2.mas_bottom);
    }];
    
    [self.view addSubview:self.dashLineImageView];
    [self.dashLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(350*RATIO, 1));
        make.centerX.mas_equalTo(ws.view);
        make.centerY.mas_equalTo(ws.borderImageView.mas_bottom);
    }];
    
    [self.view addSubview:self.dashLineImageView1];
    [self.dashLineImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(350*RATIO, 1));
        make.centerX.mas_equalTo(ws.view);
        make.centerY.mas_equalTo(ws.borderImageView1.mas_bottom);
    }];
    
    [self.view addSubview:self.dashLineImageView2];
    [self.dashLineImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(350*RATIO, 1));
        make.centerX.mas_equalTo(ws.view);
        make.centerY.mas_equalTo(ws.borderImageView2.mas_bottom);
    }];
    
    // 商店图片
    [self.view addSubview:self.shopBorderImageView];
    [self.shopBorderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70*RATIO, 70*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.borderImageView.mas_top).offset(39 * RATIO);
    }];
    
    [self.shopBorderImageView addSubview:self.shopImageView];
    [self.shopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.shopBorderImageView).insets(UIEdgeInsetsMake(3*RATIO, 3*RATIO, 3*RATIO, 3*RATIO));
    }];
    
    // 商店名称
    [self.view addSubview:self.shopNameLabel];
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(15*RATIO));
        make.width.mas_equalTo(ws.borderImageView);
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.shopBorderImageView.mas_bottom).offset(6 * RATIO);
    }];
    
    // 商店活动
    [self.view addSubview:self.shopPromotionLabel];
    [self.shopPromotionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(17*RATIO));
        make.width.mas_equalTo(ws.borderImageView);
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.shopNameLabel.mas_bottom).offset(6 * RATIO);
    }];
}

- (void)cell0Layout
{
    WS(ws);
    
    // "有效期"内容
    [self.view addSubview:self.expiryDateStateLabel];
    [self.expiryDateStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(13*RATIO));
        make.left.mas_equalTo(ws.borderImageView).offset(20 * RATIO);
        make.bottom.mas_equalTo(ws.borderImageView.mas_bottom).offset(-10 * RATIO_V);
    }];
    
    // "有效期"标题
    [self.view addSubview:self.expiryDateTitleLabel];
    [self.expiryDateTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(13*RATIO));
        make.left.mas_equalTo(ws.borderImageView).offset(20 * RATIO);
        make.bottom.mas_equalTo(ws.expiryDateStateLabel.mas_top).offset(-4 * RATIO_V);
    }];
    
    // 实分割线
    [self.view addSubview:self.realLineImageView];
    [self.realLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(330*RATIO, 1));
        make.centerX.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.expiryDateTitleLabel.mas_top).offset(-10 * RATIO_V);
    }];
    
    // “使用条件”内容
    [self.view addSubview:self.useConditionStateLabel];
    [self.useConditionStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(13*RATIO));
        make.right.mas_equalTo(ws.borderImageView).offset(-20 * RATIO);
        make.bottom.mas_equalTo(ws.realLineImageView.mas_top).offset(-10 * RATIO_V);
    }];
    
    // “劵内容”内容
    [self.view addSubview:self.couponContentStateLabel];
    [self.couponContentStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(13*RATIO));
        make.left.mas_equalTo(ws.borderImageView).offset(20 * RATIO);
        make.bottom.mas_equalTo(ws.realLineImageView.mas_top).offset(-10 * RATIO_V);
    }];
    
    // “使用条件”标题
    [self.view addSubview:self.useConditionTitleLabel];
    [self.useConditionTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(13*RATIO));
        make.right.mas_equalTo(ws.borderImageView).offset(-20 * RATIO);
        make.bottom.mas_equalTo(ws.useConditionStateLabel.mas_top).offset(-4 *RATIO_V);
    }];
    
    // “劵内容”标题
    [self.view addSubview:self.couponContentTitleLabel];
    [self.couponContentTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(13*RATIO));
        make.left.mas_equalTo(ws.borderImageView).offset(20 * RATIO);
        make.bottom.mas_equalTo(ws.couponContentStateLabel.mas_top).offset(-4 * RATIO_V);
    }];
}

- (void)cell1Layout
{
    WS(ws);
    
    // “使用说明”
    [self.view addSubview:self.useInstructionLabel];
    [self.useInstructionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(324*RATIO, 33*RATIO));
        make.top.mas_equalTo(ws.dashLineImageView.mas_bottom);
        make.left.mas_equalTo(ws.borderImageView).offset(20 * RATIO);
    }];
    
    // “使用说明”三角图标
    [self.view addSubview:self.useInstructionIndicatorImageView];
    [self.useInstructionIndicatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(6*RATIO, 33*RATIO));
        make.top.mas_equalTo(ws.dashLineImageView.mas_bottom);
        make.right.mas_equalTo(ws.borderImageView).offset(-20 * RATIO);
    }];
    
    // 实分割线
    [self.view addSubview:self.realLineImageView2];
    [self.realLineImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(330*RATIO, 1));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.useInstructionIndicatorImageView.mas_bottom);
    }];
    
    // "介绍说明"标题
//    self.detailInstructionTitleLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.introductionInstructionTitleLabel];
    [self.introductionInstructionTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(324*RATIO, 33*RATIO));
        make.top.mas_equalTo(ws.realLineImageView2.mas_bottom);
        make.left.mas_equalTo(ws.borderImageView).offset(20 * RATIO);
    }];
    
    // “介绍说明”三角图标
//    self.detailInstructionIndicatorImageView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.introductionInstructionIndicatorImageView];
    [self.introductionInstructionIndicatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(6*RATIO, 33*RATIO));
        make.top.mas_equalTo(ws.realLineImageView2.mas_bottom);
        make.right.mas_equalTo(ws.borderImageView).offset(-20 * RATIO);
    }];
    
    // "介绍说明"内容
//    self.detailInstructionStateLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.introductionInstructionStateLabel];
    [self.introductionInstructionStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(330 * RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.introductionInstructionIndicatorImageView.mas_bottom).offset(-6 * RATIO_V);
    }];
    
    // 适用门店
    [self.view addSubview:self.applicableShopLabel];
    [self.applicableShopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(324*RATIO, 33*RATIO));
        make.bottom.mas_equalTo(ws.dashLineImageView1.mas_top);
        make.left.mas_equalTo(ws.borderImageView).offset(20 * RATIO);
    }];
    
    // "适用门店"三角图标
    [self.view addSubview:self.applicableShopImageView];
    [self.applicableShopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(6*RATIO, 33*RATIO));
        make.bottom.mas_equalTo(ws.dashLineImageView1.mas_top);
        make.right.mas_equalTo(ws.borderImageView).offset(-20 * RATIO);
    }];
    
    // 实分割线
    [self.view addSubview:self.realLineImageView3];
    [self.realLineImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(330*RATIO, 1));
        make.centerX.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.applicableShopLabel.mas_top);
    }];
    
    // “介绍说明”图片
    [self.view addSubview:self.introductionImageView];
    [self.introductionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(330 * RATIO));
        make.top.mas_equalTo(ws.introductionInstructionStateLabel.mas_bottom).offset(10 * RATIO_V);
        make.bottom.mas_equalTo(ws.realLineImageView3.mas_top).offset(-10 * RATIO_V);
        make.centerX.mas_equalTo(ws.view);
    }];

}

- (void)cell2Layout
{
    WS(ws);
    
    // cell2Text
    [self.view addSubview:self.cell2TextLabel];
    [self.cell2TextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(33*RATIO));
        make.centerY.mas_equalTo(ws.borderImageView2);
        make.left.mas_equalTo(ws.borderImageView).offset(20 * RATIO);
    }];
    
    // qrCode
    [self.view addSubview:self.qrCodeImageView];
    [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100*RATIO, 100*RATIO));
        make.centerY.mas_equalTo(ws.borderImageView2);
        make.right.mas_equalTo(ws.borderImageView).offset(-20 * RATIO);
    }];
}

- (void)cell3Layout
{
    WS(ws);
    
    // cell3Text
    [self.view addSubview:self.cell3TextLabel];
    [self.cell3TextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(33*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.centerY.mas_equalTo(ws.borderImageView3);
    }];
}

#pragma mark -------------------set&get-----------------------
- (void)setShopImage:(UIImage *)shopImage
{
    _shopImage = shopImage;
    
    self.shopImageView.image = _shopImage;
}

- (void)setShopName:(NSString *)shopName
{
    _shopName = shopName;
    
    self.shopNameLabel.text = _shopName;
}

- (void)setShopPromotion:(NSString *)shopPromotion
{
    _shopPromotion = shopPromotion;
    
    self.shopPromotionLabel.text = _shopPromotion;
}

- (void)setCouponContent:(NSString *)couponContent
{
    _couponContent = couponContent;
    
    self.couponContentStateLabel.text = _couponContent;
}

- (void)setUseCondition:(NSString *)useCondition
{
    _useCondition = useCondition;
    
    self.useConditionStateLabel.text = _useCondition;
}

- (void)setExpiryDate:(NSString *)expiryDate
{
    _expiryDate = expiryDate;
    
    self.expiryDateStateLabel.text = _expiryDate;
}

- (void)setIntroductionInstruction:(NSString *)introductionInstruction
{
    _introductionInstruction = introductionInstruction;
    
    self.introductionInstructionStateLabel.text = _introductionInstruction;
}

- (void)setIntroductionImage:(UIImage *)introductionImage
{
    _introductionImage = introductionImage;
    
    if (_introductionImage != nil) {
        self.introductionImageView.image = _introductionImage;
        [self.introductionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@(150*RATIO));
        }];
    }
}

- (void)setQrcodeImage:(UIImage *)qrcodeImage
{
    _qrcodeImage = qrcodeImage;
    
    self.qrCodeImageView.image = _qrcodeImage;
}

#pragma mark ---------------------tap------------------------

- (void)useInstructionTap
{
    FBInstructionViewController *instructionVC = [[FBInstructionViewController alloc] init];
    instructionVC.title = @"使用说明";
    
    FBInstructionViewModel *vm = [[FBInstructionViewModel alloc] init];
    vm.instructionText = @"lksfkldjfklsjfksljfksljfkdslfjk\nslfjsklfjkdlsfjsdklfsdlkfjsldkflksdjfldksjfdslfldskjfdlksjfkldsjfklsdjfklsdfjkldsjfkldsjfkldsjfkdlsjfkldsjfkldsjklsjkldjsklfjskl\nsfdjklsfjkslfjdsklfjdsklfjdskljfdskljfksljf\ndsljfksjfdsklfjdsklj\n哟西可点击发送旅客交罚款了多少发生的纠纷克里斯丁罚款了圣诞节飞上来看附件但是\n2.快乐事登记方式可垃圾分类收快递分结束了科技开发了设计的房价开始了缴费的考虑设计方看来是";
    
    instructionVC.instructionVM = @[vm];
    
    [self.navigationController pushViewController:instructionVC animated:YES];
}

- (void)introductionInstructionTap
{
    FBInstructionViewController *instructionVC = [[FBInstructionViewController alloc] init];
    instructionVC.title = @"使用说明";
    
    FBInstructionViewModel *vm = [[FBInstructionViewModel alloc] init];
    vm.instructionImage = imageOfAutoScaleImage(@"c1 get.png");
    vm.instructionText = @"lksfkldjfklsjfksljfksljfkdslfjk\nslfjsklfjkdlsfjsdklfsdlkfjsldkflksdjfldksjfdslfldskjfdlksjfkldsjfklsdjfklsdfjkldsjfkldsjfkldsjfkdlsjfkldsjfkldsjklsjkldjsklfjskl\nsfdjklsfjkslfjdsklfjdsklfjdskljfdskljfksljf\ndsljfksjfdsklfjdsklj\n哟西可点击发送旅客交罚款了多少发生的纠纷克里斯丁罚款了圣诞节飞上来看附件但是\n2.快乐事登记方式可垃圾分类收快递分结束了科技开发了设计的房价开始了缴费的考虑设计方看来是";
    FBInstructionViewModel *vm1 = [[FBInstructionViewModel alloc] init];
    vm1.instructionImage = imageOfAutoScaleImage(@"c1 get.png");
    vm1.instructionText = vm.instructionText;
    FBInstructionViewModel *vm2 = [[FBInstructionViewModel alloc] init];
    vm2.instructionImage = imageOfAutoScaleImage(@"c1 get.png");
    vm2.instructionText = vm.instructionText;
    
    instructionVC.instructionVM = @[vm, vm1, vm2];
    
    [self.navigationController pushViewController:instructionVC animated:YES];
}

- (void)applicableShopTap
{
    NSLog(@"applicableShopTap");
}

@end
