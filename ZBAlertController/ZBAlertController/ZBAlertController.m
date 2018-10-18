//
//  ZBAlertController.m
//  ZBAlertController
//
//  Created by Zombie on 2018/10/18.
//  Copyright © 2018年 Zombie. All rights reserved.
//

#import "ZBAlertController.h"

@interface ZBAlertController ()

@end

@implementation ZBAlertController

+ (instancetype)alertControllerWithStyle:(UIAlertControllerStyle)style
                              title:(NSString *)title
                                 message:(NSString *)message
                                  handle:(void(^)(NSInteger index, NSString *title))handle{
    
    return [self alertControllerWithStyle:style
                                    title:title
                                  message:message
                              cancleTitle:@"取消"
                              otherTitles:@{@"确定":@(UIAlertActionStyleDefault)}
                                   handle:handle];
}

+ (instancetype)alertControllerWithStyle:(UIAlertControllerStyle)style
                                   title:(NSString *)title
                                 message:(NSString *)message
                             cancleTitle:(NSString *)cancleTitle
                             otherTitles:(NSDictionary *)otherTitles
                                  handle:(void(^)(NSInteger index, NSString *title))handle {
    
    ZBAlertController * alert = [ZBAlertController alertControllerWithTitle:title
                                                                    message:message
                                                             preferredStyle:style];
    
    if (cancleTitle.length) {
        UIAlertAction * cancle = [UIAlertAction actionWithTitle:cancleTitle
                                                          style:UIAlertActionStyleCancel
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            !handle ? : handle(0, action.title);
                                                        }];
        [alert addAction:cancle];
    }
    
    NSArray *keyAry = otherTitles.allKeys;
    for (NSInteger i = 0; i < keyAry.count; i ++) {
        NSString * key = keyAry[i];
        UIAlertAction * action = [UIAlertAction actionWithTitle:key
                                                          style:[otherTitles[key] integerValue]
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            !handle ? : handle(i + 1, action.title);
                                                        }];
        [alert addAction:action];
    }
    return alert;
    
}

+ (instancetype)alertControllerWithStyle:(UIAlertControllerStyle)style
                                   title:(NSString *)title
                                 message:(NSString *)message
                                delegate:(nullable id)delegate{
    
    return [self alertControllerWithStyle:style
                                    title:title
                                  message:message
                              cancleTitle:@"取消"
                              otherTitles:@{@"确定":@(UIAlertActionStyleDefault)}
                                   delegate:delegate];
}

+ (instancetype)alertControllerWithStyle:(UIAlertControllerStyle)style
                                   title:(NSString *)title
                                 message:(NSString *)message
                             cancleTitle:(NSString *)cancleTitle
                             otherTitles:(NSDictionary *)otherTitles
                                delegate:(nullable id)delegate {
    
    ZBAlertController * alert = [ZBAlertController alertControllerWithTitle:title
                                                                    message:message
                                                             preferredStyle:style];
    alert.delegate = delegate;
    
    if (cancleTitle.length) {
        UIAlertAction * cancle = [UIAlertAction actionWithTitle:cancleTitle
                                                          style:UIAlertActionStyleCancel
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            if ([alert.delegate respondsToSelector:@selector(alertController:clickedButtonAtIndex:title:)]) {
                                                                [alert.delegate alertController:alert clickedButtonAtIndex:0 title:action.title];
                                                            }
                                                        }];
        [alert addAction:cancle];
    }
    
    NSArray *keyAry = otherTitles.allKeys;
    for (NSInteger i = 0; i < keyAry.count; i ++) {
        NSString * key = keyAry[i];
        UIAlertAction * action = [UIAlertAction actionWithTitle:key
                                                          style:[otherTitles[key] integerValue]
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            if ([alert.delegate respondsToSelector:@selector(alertController:clickedButtonAtIndex:title:)]) {
                                                                [alert.delegate alertController:alert clickedButtonAtIndex:i + 1 title:action.title];
                                                            }
                                                        }];
        [alert addAction:action];
    }
    return alert;
    
}

- (void)showAlertController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *presentViewController = rootViewController;
    while (presentViewController.presentedViewController) {
        presentViewController = presentViewController.presentedViewController;
    }
    [presentViewController presentViewController:self animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
