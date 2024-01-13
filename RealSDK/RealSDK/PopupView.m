//
//  PopupView.m
//  RealDemo
//
//  Created by lucaswang on 2024/1/10.
//

#import <Foundation/Foundation.h>
#import "PopupView.h"
#import <SDWebImage/SDWebImage.h>

@interface PopupView ()

@property (strong, nonatomic) UIView *dimmingView;  // 蒙层视图
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *closeButton;

@end

@implementation PopupView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDimmingView]; // 设置蒙层视图
        [self setupPopupView];
    }
    return self;
}

- (void)setupDimmingView {
    // dimmingView 应该与 PopupView 的大小一致
    self.dimmingView = [[UIView alloc] initWithFrame:self.bounds];
    self.dimmingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self addSubview:self.dimmingView];
}

- (void)setupPopupView {
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;

//     // 设置 imageView 的大小和位置
//     CGSize imageViewSize = CGSizeMake(260, 140);
//     CGPoint imageViewOrigin = CGPointMake((self.bounds.size.width - imageViewSize.width) / 2,
//                                           (self.bounds.size.height - imageViewSize.height) / 2);
//
//     UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popview"]];
//     imageView.frame = CGRectMake(imageViewOrigin.x, imageViewOrigin.y, imageViewSize.width, imageViewSize.height);
//     imageView.contentMode = UIViewContentModeScaleAspectFit;
//     [self addSubview:imageView];

    // 设置 imageView 的大小和位置
    CGSize imageViewSize = CGSizeMake(260, 140);
    CGPoint imageViewOrigin = CGPointMake((self.bounds.size.width - imageViewSize.width) / 2,
                                        (self.bounds.size.height - imageViewSize.height) / 2);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewOrigin.x, imageViewOrigin.y, imageViewSize.width, imageViewSize.height)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    // 使用SDWebImage加载网络图片
    NSURL *url = [NSURL URLWithString:@"https://bpic.588ku.com/mainSite/basic/quick_methods_bg.png"];
    [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"popview"]];
    [self addSubview:imageView];

    // 设置关闭按钮的位置在 imageView 的右上角，距离上边距和右边距均为10
    CGFloat closeButtonSize = 40; // 按钮尺寸
    CGFloat closeButtonPadding = 0; // 按钮与 imageView 边缘的距离
    CGFloat closeButtonX = imageViewOrigin.x + imageViewSize.width - closeButtonSize - closeButtonPadding;
    CGFloat closeButtonY = imageViewOrigin.y + closeButtonPadding;
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeButton setImage:[UIImage imageNamed:@"popviewClose"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(hidePopupView) forControlEvents:UIControlEventTouchUpInside];
    self.closeButton.frame = CGRectMake(closeButtonX, closeButtonY, closeButtonSize, closeButtonSize);
    [self addSubview:self.closeButton];
}


//- (void)showInView:(UIView *)view {
//    self.center = view.center;
//    [view addSubview:self];
//}
//
//- (void)dismiss {
//    [self removeFromSuperview];
//}


- (void)showPopupView {
    NSLog(@"showPopupView");
    self.dimmingView.hidden = NO;
    self.hidden = NO;
}

- (void)hidePopupView {
    NSLog(@"hidePopupView");
    self.dimmingView.hidden = YES;
    self.hidden = YES;
}

@end

