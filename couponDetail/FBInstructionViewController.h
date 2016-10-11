//
//  FBInstructionViewController.h
//  couponDetail
//
//  Created by cc on 16/8/9.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FBInstructionViewModel;

@interface FBInstructionViewController : UIViewController

@property (strong, nonatomic) NSArray<FBInstructionViewModel *> *instructionVM;

@end
