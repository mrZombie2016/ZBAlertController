//
//  ViewController.m
//  ZBAlertController
//
//  Created by Zombie on 2018/10/18.
//  Copyright © 2018年 Zombie. All rights reserved.
//

#import "ViewController.h"
#import "ZBAlertController.h"

@interface ViewController ()<ZBAlertControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark alert
//简单提示框（回调）
- (IBAction)test1:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleAlert title:@"提示" message:@"简单提示框（回调）" handle:^(NSInteger index, NSString *title) {
        NSLog(@"点击了index:%ld %@",index,title);
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

//自定义提示框（回调）
- (IBAction)test2:(id)sender {
    ZBAlertController * alert = [ZBAlertController
                                 alertControllerWithStyle:UIAlertControllerStyleAlert
                                 title:@"提示"
                                 message:@"自定义提示框（回调）"
                                 cancleTitle:@"取消"
                                 otherTitles:@{@"按钮1":@(UIAlertActionStyleDefault), @"按钮2":@(UIAlertActionStyleDestructive), @"按钮3":@(UIAlertActionStyleDefault)}
                                 handle:^(NSInteger index, NSString *title) {
        NSLog(@"点击了index:%ld %@",index,title);
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

//简单提示框（代理）
- (IBAction)test3:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleAlert title:@"提示" message:@"简单提示框（回调）" delegate:self];
    [self presentViewController:alert animated:YES completion:nil];
}

//自定义提示框（代理）
- (IBAction)test4:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleAlert title:@"提示" message:@"自定义提示框（回调）" cancleTitle:@"取消" otherTitles:@{@"按钮1":@(UIAlertActionStyleDefault), @"按钮2":@(UIAlertActionStyleDestructive), @"按钮3":@(UIAlertActionStyleDefault)} delegate:self];
    [self presentViewController:alert animated:YES completion:nil];
}

//快捷展示
- (IBAction)test5:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleAlert title:@"提示" message:@"快捷展示" handle:^(NSInteger index, NSString *title) {
        NSLog(@"点击了index:%ld %@",index,title);
    }];
    [alert showAlertController];
}

#pragma mark sheet
//简单提示框（回调）
- (IBAction)sheet1:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleActionSheet title:@"提示" message:@"简单提示框（回调）" handle:^(NSInteger index, NSString *title) {
        NSLog(@"点击了index:%ld %@",index,title);
    }];
    [self presentViewController:alert animated:YES completion:nil];
}
//自定义提示框（回调）
- (IBAction)sheet2:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleActionSheet title:@"提示" message:@"自定义提示框（回调）" cancleTitle:@"取消" otherTitles:@{@"按钮1":@(UIAlertActionStyleDefault), @"按钮2":@(UIAlertActionStyleDestructive), @"按钮3":@(UIAlertActionStyleDefault)} handle:^(NSInteger index, NSString *title) {
        NSLog(@"点击了index:%ld %@",index,title);
    }];
    [self presentViewController:alert animated:YES completion:nil];
}
//简单提示框（代理）
- (IBAction)sheet3:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleActionSheet title:@"提示" message:@"简单提示框（回调）" delegate:self];
    [self presentViewController:alert animated:YES completion:nil];
}

//自定义提示框（代理）
- (IBAction)sheet4:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleActionSheet title:@"提示" message:@"自定义提示框（回调）" cancleTitle:@"取消" otherTitles:@{@"按钮1":@(UIAlertActionStyleDefault), @"按钮2":@(UIAlertActionStyleDestructive), @"按钮3":@(UIAlertActionStyleDefault)} delegate:self];
    [self presentViewController:alert animated:YES completion:nil];
}

//快捷展示
- (IBAction)sheet5:(id)sender {
    ZBAlertController * alert = [ZBAlertController alertControllerWithStyle:UIAlertControllerStyleActionSheet title:@"提示" message:@"简单提示框（回调）" delegate:self];
    [alert showAlertController];
}

//代理
- (void)alertController:(ZBAlertController *)alertController clickedButtonAtIndex:(NSInteger)buttonIndex title:(NSString *)title {
    NSLog(@"点击了index:%ld %@",buttonIndex,title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
