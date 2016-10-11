//
//  FBInstructionTableViewCell.m
//  couponDetail
//
//  Created by cc on 16/8/9.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBInstructionTableViewCell.h"
#import "constant.h"

@interface FBInstructionTableViewCell ()

@property (strong, nonatomic) UIImageView *introductionImageView;
@property (strong, nonatomic) UILabel     *introductionLabel;

@end

@implementation FBInstructionTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"introductioncell";
    
    FBInstructionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[FBInstructionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self subInit];
    }
    
    return self;
}

- (void)subInit
{
    WS(ws);
    
    self.introductionImageView = [[UIImageView alloc] init];
    
    self.introductionLabel = [[UILabel alloc] init];
    self.introductionLabel.text = @" ";
    self.introductionLabel.numberOfLines = 0;
    self.introductionLabel.font = [UIFont boldSystemFontOfSize:15 * RATIO];
    self.introductionLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0f];
    
    
    // layout
    [self.contentView addSubview:self.introductionImageView];
    [self.introductionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5*RATIO_V);
        make.left.mas_equalTo(ws.contentView).offset(20*RATIO);
        make.right.mas_equalTo(ws.contentView).offset(-20*RATIO);
    }];
    
    [self.contentView addSubview:self.introductionLabel];
    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.contentView).offset(20*RATIO);
        make.right.mas_equalTo(ws.contentView).offset(-20*RATIO);
        make.top.mas_equalTo(ws.introductionImageView.mas_bottom).offset(5 * RATIO_V);
        make.bottom.mas_equalTo(ws.contentView).offset(-5 * RATIO_V);
    }];
}

- (void)setIntroductionImage:(UIImage *)introductionImage
{
    _introductionImage = introductionImage;
    
    self.introductionImageView.image = _introductionImage;
}

- (void)setIntroductionText:(NSString *)introductionText
{
    _introductionText = introductionText;
    
    self.introductionLabel.text = _introductionText;
}

@end
