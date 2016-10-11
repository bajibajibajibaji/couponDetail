//
//  FBInstructionTableViewCell.h
//  couponDetail
//
//  Created by cc on 16/8/9.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBInstructionTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImage  *introductionImage;
@property (copy,   nonatomic) NSString *introductionText;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
