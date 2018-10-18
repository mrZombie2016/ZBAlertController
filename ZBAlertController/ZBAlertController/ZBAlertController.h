//
//  ZBAlertController.h
//  ZBAlertController
//
//  Created by Zombie on 2018/10/18.
//  Copyright © 2018年 Zombie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZBAlertControllerDelegate;

@interface ZBAlertController : UIAlertController

@property (nonatomic, weak, nullable) id <ZBAlertControllerDelegate> delegate;

+ (instancetype)alertControllerWithStyle:(UIAlertControllerStyle)style
                                   title:(NSString *)title
                                 message:(NSString *)message
                                  handle:(void(^)(NSInteger index, NSString *title))handle;

/*
 otherTitles 为字典，key为按钮标题，value为按钮类型；
 index 取消按钮固定为0，其他从1递增
 使用示例：
ZBAlertController * alert = [ZBAlertController
                             alertControllerWithStyle:UIAlertControllerStyleAlert
                             title:@"标题"
                             message:@"提示内容"
                             cancleTitle:@"取消"
                             otherTitles:@{@"按钮1":@(UIAlertActionStyleDefault), @"按钮2":@(UIAlertActionStyleDestructive), @"按钮3":@(UIAlertActionStyleDefault)}
                             handle:^(NSInteger index, NSString *title) {
 
                             }];
*/
+ (instancetype)alertControllerWithStyle:(UIAlertControllerStyle)style
                                   title:(NSString *)title
                                 message:(NSString *)message
                             cancleTitle:(NSString *)cancleTitle
                             otherTitles:(NSDictionary *)otherTitles
                                  handle:(void(^)(NSInteger index, NSString *title))handle;

+ (instancetype)alertControllerWithStyle:(UIAlertControllerStyle)style
                                   title:(NSString *)title
                                 message:(NSString *)message
                                delegate:(nullable id)delegate;

+ (instancetype)alertControllerWithStyle:(UIAlertControllerStyle)style
                                   title:(NSString *)title
                                 message:(NSString *)message
                             cancleTitle:(NSString *)cancleTitle
                             otherTitles:(NSDictionary *)otherTitles
                                delegate:(nullable id)delegate;

- (void)showAlertController;

@end

@protocol ZBAlertControllerDelegate <NSObject>
@optional
- (void)alertController:(ZBAlertController *)alertController  clickedButtonAtIndex:(NSInteger)buttonIndex title:(NSString *)title;

@end
