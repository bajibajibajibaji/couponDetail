//
//  FBInstructionViewController.m
//  couponDetail
//
//  Created by cc on 16/8/9.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBInstructionViewController.h"
#import "FBInstructionTableViewCell.h"
#import "FBInstructionViewModel.h"
#import "constant.h"

@interface FBInstructionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UIImageView *borderImageView;
@property (strong, nonatomic) UIImageView *borderImageView1;
@property (strong, nonatomic) UIImageView *dashLineImageView;

@property (strong, nonatomic) UILabel *tailLabel;


@property (assign, nonatomic) NSInteger countI;
@property (assign, nonatomic) CGFloat tableViewCellSumHeight;
@end

@implementation FBInstructionViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.tableView = [[UITableView alloc] init];
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.contentInset = UIEdgeInsetsMake(22*RATIO_V, 0, 0, 0);
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        self.borderImageView = imageViewOfAutoScaleImage(@"c4 Coupon background5.png");
        self.borderImageView.layer.contentsCenter = CGRectMake(0.45, 0.15, 0.1, 0.7);

        self.borderImageView1 = imageViewOfAutoScaleImage(@"c4 Coupon background7.png");
        self.borderImageView1.layer.contentsCenter = CGRectMake(0.45, 0.45, 0.1, 0.1);
        
        self.dashLineImageView = [[UIImageView  alloc] initWithImage:[imageOfAutoScaleImage(@"c4 Division2.png") resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile]];
        
        self.tailLabel = [[UILabel alloc] init];
        self.tailLabel.text = @"更多优惠 敬请期待";
        self.tailLabel.numberOfLines = 1;
        self.tailLabel.font = [UIFont boldSystemFontOfSize:15 * RATIO];
        self.tailLabel.textColor = [UIColor colorWithRed:144.0/255 green:144.0/255 blue:144.0/255 alpha:1.0f];
        
        self.countI = 0;
        self.tableViewCellSumHeight = 0.0;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WS(ws);
    
    self.view.backgroundColor = [UIColor colorWithRed:35.0f/255.0f green:205.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(370*RATIO));
        make.height.mas_equalTo(@(600*RATIO_V)); /////////////////
        make.top.mas_equalTo(ws.view).offset(64 + 6*RATIO_V);
        make.centerX.mas_equalTo(ws.view);
    }];
    
    [self.view insertSubview:self.borderImageView belowSubview:self.tableView];
    [self.borderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(370*RATIO));
        make.height.mas_equalTo(@(30*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.tableView).offset(9 * RATIO_V);
    }];
    
    [self.view addSubview:self.borderImageView1];
    [self.borderImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(370*RATIO));
        make.height.mas_equalTo(@(27*RATIO_V));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.borderImageView.mas_bottom);
    }];
    
    [self.view addSubview:self.dashLineImageView];
    [self.dashLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(350*RATIO, 1));
        make.centerX.mas_equalTo(ws.view);
        make.centerY.mas_equalTo(ws.borderImageView.mas_bottom);
    }];
    
    [self.view addSubview:self.tailLabel];
    [self.tailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(33*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.centerY.mas_equalTo(ws.borderImageView1);
    }];
}

#pragma mark -------------------UITableViewDataSource-------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.instructionVM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FBInstructionTableViewCell *cell = [FBInstructionTableViewCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.introductionImage = self.instructionVM[indexPath.row].instructionImage;
    cell.introductionText = self.instructionVM[indexPath.row].instructionText;
    
    return cell;
}

#pragma mark -------------------UITableViewDelegate-------------------
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.countI < self.instructionVM.count) {
        self.tableViewCellSumHeight += cell.bounds.size.height;
        ++self.countI;
    
        if (self.tableViewCellSumHeight+22*RATIO_V > 600*RATIO_V) {
            self.tableViewCellSumHeight = 600*RATIO_V - 22*RATIO_V;
            [self.tableView setScrollEnabled:YES];
        } else {
            [self.tableView setScrollEnabled:NO];
        }
        
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@(self.tableViewCellSumHeight+22*RATIO_V));
        }];
    }
}

@end
