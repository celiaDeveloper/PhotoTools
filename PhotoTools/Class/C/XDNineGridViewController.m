//
//  XDNineGridViewController.m
//  PhotoTools
//
//  Created by Celia on 2017/7/27.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDNineGridViewController.h"
#import "XDNineGridView.h"
#import "XDNineGridModel.h"
#import "XDPhotoBrowseController.h"

@interface XDNineGridViewController () <XDNineGridViewDelegate>
@property (nonatomic, strong) NSMutableArray *tempData;
@end

@implementation XDNineGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"九宫格&图片预览";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    XDNineGridView *view = [[XDNineGridView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width)];
    [self.view addSubview:view];
    
    
    NSArray *photoArr = @[@"http://img.zcool.cn/community/05e5e1554af04100000115a8236351.jpg", @"http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=b247c12e3e9b033b3885f4997da75ca6/5ab5c9ea15ce36d3b3545f1a30f33a87e950b14c.jpg", @"http://tupian.enterdesk.com/2015/xu/04/20/12/zweihua11.jpg", @"http://pic1.win4000.com/wallpaper/1/59327f1ae0e5f.jpg", @"http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=489281e5888ba61ecbe3c06c295dfd7f/a9d3fd1f4134970ac9e997009fcad1c8a7865d03.jpg"];
    _tempData = [NSMutableArray array];
    for (int i = 0; i<photoArr.count; i++) {
        XDNineGridModel *temp = [[XDNineGridModel alloc] init];
        temp.photoURL = photoArr[i];
        [_tempData addObject:temp];
    }
    
    view.dataArray = _tempData.copy;
    view.delegate = self;
}

#pragma mark - XDNineGridViewDelegate
- (void)selectPhotoIndex:(NSInteger)index {
    NSLog(@"index -- %ld",index);
    
    XDPhotoBrowseController *con = [[XDPhotoBrowseController alloc] init];
    con.dataArray = _tempData.copy;
    con.selectedIndex = index;

    [self presentViewController:con animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
