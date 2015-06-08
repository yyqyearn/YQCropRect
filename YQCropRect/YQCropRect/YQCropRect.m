//
//  YQCropRect.m
//  YQCropRect
//
//  Created by yyq on 15/6/8.
//  Copyright (c) 2015年 mobilenow. All rights reserved.
//




#import "YQCropRect.h"
typedef NS_ENUM(NSInteger, PanViewTag){
    PanViewTagLeft = 1,
    PanViewTagRight,
    PanViewTagTop,
    PanViewTagBottom,
    PanViewTagLeftTop,
    PanViewTagRightTop,
    PanViewTagLeftBottom,
    PanViewTagRightBottom,
};

@interface YQCropRect()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpace;


@property (weak, nonatomic) IBOutlet UIView *rectView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *lineRight;
@end


@implementation YQCropRect

+ (instancetype)cropRectFromNibWithImage:(UIImage*)image Frame:(CGRect)frame{
    YQCropRect *view = [[[NSBundle mainBundle]loadNibNamed:@"YQCropRect" owner:self options:nil]firstObject];
    view.imageView.image = image;
    view.frame = frame;
    NSLog(@"返回");
    return view;
}


- (void)awakeFromNib{
    NSLog(@"awakeFromNib");
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRect");
}

- (void)layoutSubviews{
    NSLog(@"layoutSubviews");
}

- (IBAction)LinePan:(UIPanGestureRecognizer*)sender {
    CGPoint curPoint = [sender locationInView:self];
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"刚开始点击");

    }else if (sender.state == UIGestureRecognizerStateChanged)
    {
        NSLog(@"正在移动");
        CGFloat leftSpace = curPoint.x;
        CGFloat rightSpace = self.bounds.size.width - curPoint.x - 15;
        CGFloat topScpace = curPoint.y;
        CGFloat bottomSpace = self.bounds.size.height - curPoint.y - 15;
        leftSpace = leftSpace<0?0:leftSpace;
        rightSpace = rightSpace<0?0:rightSpace;
        topScpace = topScpace<0?0:topScpace;
        bottomSpace = bottomSpace<0?0:bottomSpace;
        
        CGFloat maxLeft = CGRectGetMaxX(self.rectView.frame)-60;
        CGFloat maxRight = self.frame.size.width - self.rectView.frame.origin.x -60;
        CGFloat maxTop = CGRectGetMaxY(self.rectView.frame)-60;
        CGFloat maxBottom =  self.frame.size.height - self.rectView.frame.origin.y -60;

        leftSpace = leftSpace>maxLeft?maxLeft:leftSpace;
        rightSpace = rightSpace>maxRight?maxRight:rightSpace;
        topScpace = topScpace>maxTop?maxTop:topScpace;
        bottomSpace = bottomSpace>maxBottom?maxBottom:bottomSpace;
        
        switch (sender.view.tag) {
            case PanViewTagLeft:
                self.leftSpace.constant = leftSpace;
                break;
            case PanViewTagRight:
                self.rightSpace.constant = rightSpace;
                break;
            case PanViewTagTop:
                self.topSpace.constant = topScpace;
                break;
            case PanViewTagBottom:
                self.bottomSpace.constant = bottomSpace;
                break;
            case PanViewTagLeftTop:
                self.leftSpace.constant = leftSpace;
                self.topSpace.constant = topScpace;
                break;
            case PanViewTagRightTop:
                self.rightSpace.constant = rightSpace;
                self.topSpace.constant = topScpace;
                break;
            case PanViewTagLeftBottom:
                self.leftSpace.constant = leftSpace;
                self.bottomSpace.constant = bottomSpace;
                break;
            case PanViewTagRightBottom:
                self.rightSpace.constant = rightSpace;
                self.bottomSpace.constant = bottomSpace;
                break;
                
            default:
                break;
        }
    }else{
        NSLog(@"移动结束");

    }
    [self.rectView layoutIfNeeded];
 }

@end
