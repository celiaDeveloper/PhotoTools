//
//  XDPhotoBrowseController.m
//  PhotoTools
//
//  Created by Celia on 2017/7/26.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDPhotoBrowseController.h"
#import "XDPhotoBrowse.h"

@interface XDPhotoBrowseController ()
@property (nonatomic, strong) XDPhotoBrowse *browseView;
@end

@implementation XDPhotoBrowseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    _browseView = [[XDPhotoBrowse alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 0)];
    _browseView.dataArray = self.dataArray;
    _browseView.selectedIndex = self.selectedIndex;
    [self.view addSubview:_browseView];
    
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
}


- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
