//
//  XDLuckyViewController.m
//  PhotoTools
//
//  Created by Celia on 2017/7/28.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDLuckyViewController.h"
#import "LuckView.h"

@interface XDLuckyViewController () <LuckViewDelegate>

@end

@implementation XDLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"幸运大转盘";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    LuckView *luckV = [[LuckView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width)];
    [self.view addSubview:luckV];
    
    luckV.imageArray = @[@"http://image4.suning.cn/content/catentries/00000000010236/000000000102362407/fullimage/000000000102362407_4f.jpg",@"http://www.gurubear.com.cn/editor/uploadfile/20130826151723.jpg",@"http://nres.ingdan.com/uploads/20151210/1449731763500790.jpg",@"http://www.iyunshu.com/supp/Public/Uploads/20151226/567e4042a8e4a.jpg",@"http://img2-ak.lst.fm/i/u/avatar170s/5788f607aa164041c086630dd6dcee37.png",@"http://img05.huishangbao.com/file/upload/201212/01/08/08/35-59-16-2400.jpg",@"http://f1.diyitui.com/06/a4/f2/07/08/05/32/94/e1/05/30/3e/e4/e0/e0/14.jpg",@"http://ec4.images-amazon.com/images/I/41kkH0OO06L._SY300_.jpg"].mutableCopy;
    luckV.delegate = self;
    
    //arc4random()%luckV.imageArray.count
    luckV.stopCount = arc4random()%3 ? (arc4random()%3) + 4 : arc4random()%3 ;
    
}

#pragma mark - luckview 代理
- (void)luckViewDidStopWithArrayCount:(NSInteger)count {
    NSLog(@"抽到了 -- %ld",count);
}

- (void)luckSelectBtn:(UIButton *)btn {
    NSLog(@"点击了数组第 %ld 个元素",btn.tag);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
