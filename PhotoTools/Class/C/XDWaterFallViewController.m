//
//  XDWaterFallViewController.m
//  PhotoTools
//
//  Created by Celia on 2017/7/27.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDWaterFallViewController.h"
#import "XDWaterFallView.h"
#import "XDWaterFallModel.h"
#import <MJExtension/MJExtension.h>

@interface XDWaterFallViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation XDWaterFallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"瀑布流";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.dataArray = [NSMutableArray array];
    
    XDWaterFallView *wfView = [[XDWaterFallView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    self.dataArray = [XDWaterFallModel mj_objectArrayWithFilename:@"0.plist"];
    wfView.dataArray = self.dataArray.copy;
    [self.view addSubview:wfView];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
