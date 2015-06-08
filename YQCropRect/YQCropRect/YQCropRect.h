//
//  YQCropRect.h
//  YQCropRect
//
//  Created by yyq on 15/6/8.
//  Copyright (c) 2015年 mobilenow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQCropRect : UIView
+ (instancetype)cropRectFromNibWithImage:(UIImage*)image Frame:(CGRect)frame;
@end
