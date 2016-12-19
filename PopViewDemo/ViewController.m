//
//  ViewController.m
//  PopViewDemo
//
//  Created by 涂婉丽 on 16/12/19.
//  Copyright © 2016年 涂婉丽. All rights reserved.
//

#import "ViewController.h"
#import "PopoverView.h"
@interface ViewController ()
@property (strong, nonatomic) UILabel *noticeLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    qqBtn.frame = CGRectMake(100, 100, 100, 100);
    [qqBtn setBackgroundColor:[UIColor redColor]];
    [qqBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qqBtn];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(230, 100, 100, 100);
    [leftBtn setBackgroundColor:[UIColor redColor]];
    [leftBtn addTarget:self action:@selector(showWithoutImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
}

- (NSArray *)QQActions {
    // 发起多人聊天 action
    PopoverAction *multichatAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_multichat"] title:@"发起多人聊天" handler:^(PopoverAction *action) {
#pragma mark - 该Block不会导致内存泄露, Block内代码无需刻意去设置弱引用.
        _noticeLabel.text = action.title;
    }];
    // 加好友 action
    PopoverAction *addFriAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_addFri"] title:@"加好友" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    // 扫一扫 action
    PopoverAction *QRAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_QR"] title:@"扫一扫" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    // 面对面快传 action
    PopoverAction *facetofaceAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_facetoface"] title:@"面对面快传" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    // 付款 action
    PopoverAction *payMoneyAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"付款" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    
    return @[multichatAction, addFriAction, QRAction, facetofaceAction, payMoneyAction];
}

- (void)buttonAction:(UIButton *)sender {
    PopoverView *popoverView = [PopoverView popoverView];
    [popoverView showToView:sender withActions:[self QQActions]];
}

- (void)leftBtnAction:(UIButton *)sender {
    PopoverAction *action1 = [PopoverAction actionWithImage:[UIImage imageNamed:@"contacts_add_newmessage"] title:@"发起群聊" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    PopoverAction *action2 = [PopoverAction actionWithImage:[UIImage imageNamed:@"contacts_add_friend"] title:@"添加朋友" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    PopoverAction *action3 = [PopoverAction actionWithImage:[UIImage imageNamed:@"contacts_add_scan"] title:@"扫一扫" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    PopoverAction *action4 = [PopoverAction actionWithImage:[UIImage imageNamed:@"contacts_add_money"] title:@"收付款" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    
    PopoverView *popoverView = [PopoverView popoverView];
    popoverView.style = PopoverViewStyleDark;
    // 在没有系统控件的情况下调用可以使用显示在指定的点坐标的方法弹出菜单控件.
    [popoverView showToPoint:CGPointMake(20, 64) withActions:@[action1, action2, action3, action4]];
}

- (void)rightButtonAction:(UIButton *)sender {
    PopoverView *popoverView = [PopoverView popoverView];
    popoverView.showShade = YES; // 显示阴影背景
    [popoverView showToView:sender withActions:[self QQActions]];
}

- (void)showWithoutImage:(UIButton *)sender {
    // 不带图片
    PopoverAction *action1 = [PopoverAction actionWithTitle:@"加好友" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    PopoverAction *action2 = [PopoverAction actionWithTitle:@"扫一扫" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    PopoverAction *action3 = [PopoverAction actionWithTitle:@"发起聊天" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    PopoverAction *action4 = [PopoverAction actionWithTitle:@"发起群聊" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    PopoverAction *action5 = [PopoverAction actionWithTitle:@"查找群聊" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    PopoverAction *action6 = [PopoverAction actionWithTitle:@"我的群聊" handler:^(PopoverAction *action) {
        _noticeLabel.text = action.title;
    }];
    
    PopoverView *popoverView = [PopoverView popoverView];
    popoverView.style = PopoverViewStyleDark;
    popoverView.hideAfterTouchOutside = NO; // 点击外部时不允许隐藏
    [popoverView showToView:sender withActions:@[action1, action2, action3, action4, action5, action6]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
