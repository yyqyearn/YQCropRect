//
//  ViewController.m
//  YQCropRect
//
//  Created by yyq on 15/6/8.
//  Copyright (c) 2015年 mobilenow. All rights reserved.
//

#import "ViewController.h"
#import "YQCropRect.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YQCropRect *cropRect = [YQCropRect cropRectFromNibWithImage:self.imageView.image Frame:self.imageView.frame];
//    self.imageView.hidden = YES;
    [self.view addSubview:cropRect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
