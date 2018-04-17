//
//  HttpLoadServer.swift
//  RxSwiftNetWorkDemo
//
//  Created by xp on 2018/4/17.
//  Copyright © 2018年 C. All rights reserved.
//

import UIKit

/*
 //
 //  HttpLoadServer.m
 //  WorldUnionBrokerPlatform
 //
 //  Created by liujinliang on 16/5/5.
 //  Copyright © 2016年 www.worldunion.com.cn. All rights reserved.
 //
 
 #import "HttpLoadServer.h"
 #import "UIImage+GIF.h"
 #import "LoadView.h"
 #import "HomePlus-Swift.h"
 
 #import <QuartzCore/QuartzCore.h>
 
 @implementation HttpLoadServer
 
 + (instancetype)sharedManager{
 
 // 创建静态单例类对象
 static id instance = nil;
 
 // 执行且在整个程序的声明周期中，仅执行一次某一个 block 对象
 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{
 
 // 初始化单例类对象
 instance = [[self alloc] init];
 });
 return instance;
 }
 
 - (void)show {
 [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
 
 if (self.isShow) {
 return;
 }
 
 self.isShow = YES;
 //    UIImage *gifImg = [[UIImage sd_animatedGIFNamed:@"loading"] sd_animatedImageByScalingAndCroppingToSize:(CGSize){10,10}];
 //    UIImageView *loadingV = [[UIImageView alloc] initWithImage:gifImg];
 
 
 __block LoadView *bgView = [[LoadView alloc] initWithFrame:(CGRect){0,0,80,80}];
 bgView.tag = 1010;
 bgView.backgroundColor = [UIColor clearColor];
 //bgView.layer.shadowOffset = (CGSize){0,0};
 //bgView.layer.shadowOpacity = 0.15;
 //bgView.layer.shadowRadius = 5;
 //bgView.layer.shadowColor = [UIColor blackColor].CGColor;
 
 bgView.alpha = 0;
 //    bgView.layer.shadowPath = [UIBezierPath bezierPathWithRect:bgView.bounds].CGPath;
 UIView *bgV = [[UIView alloc] initWithFrame:bgView.bounds];
 bgV.backgroundColor = [UIColor clearColor];
 //    bgV.layer.cornerRadius = 5.0;
 //    bgV.layer.masksToBounds = YES;
 [bgView addSubview:bgV];
 
 UIImageView *loadingV = [UIImageView new];
 loadingV.image =[UIImage imageNamed:@"page_load_1"];
 NSMutableArray *loadings = [NSMutableArray array];
 for (int i=1; i<29; i++) {
 NSString *imageStr = [NSString stringWithFormat:@"page_load_%d",i];
 UIImage *loadImg = [UIImage imageNamed:imageStr];
 [loadings addObject:loadImg];
 }
 
 loadingV.animationImages = loadings;
 loadingV.animationDuration = 2;
 [loadingV startAnimating];
 [loadingV setContentMode:UIViewContentModeScaleToFill];
 //    [loadingV setFrame:(CGRect){0,0,39*.8,8}];
 loadingV.frame = bgView.bounds;
 loadingV.center = bgView.center;
 loadingV.tag = 1010;
 [bgView addSubview:loadingV];
 UIWindow *window = [UIApplication sharedApplication].keyWindow;
 
 LaunchADView *adV = [LaunchADView sharedInstance];
 [window insertSubview:bgView belowSubview:adV];
 
 
 bgView.center = window.center;
 [bgView layoutIfNeeded];
 [bgView layoutSubviews];
 [UIView animateWithDuration:.1 animations:^{
 bgView.alpha = 1;
 
 
 } completion:^(BOOL finished) {
 
 }];
 }
 
 - (void)hide {
 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
 //    return;
 [self timerHide];
 //    [self performSelector:@selector(timerHide) withObject:nil afterDelay:.5];
 }
 
 - (void)timerHide {
 self.isShow = NO;
 UIWindow *window = [UIApplication sharedApplication].keyWindow;
 NSArray *subviews = window.subviews;
 [subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 if ([obj isKindOfClass:[LoadView class]]) {
 LoadView *imgV = obj;
 if (imgV.tag==1010) {
 
 }
 [UIView animateWithDuration:1.0 animations:^{
 imgV.alpha = 0;
 } completion:^(BOOL finished) {
 [imgV removeFromSuperview];
 }];
 }
 }];
 }
 @end

 */

/// 加载中的视图
public class HttpLoadServer {
    
    private var isShow: Bool = false
    
    lazy var loadView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
        view.alpha = 0
        return view
    }()
    
    lazy var loadingImg: UIImageView = {
        let imgView = UIImageView()
//        UIImage.init(named: "<#T##String#>")
    }()
    
    private static let shareInstance = HttpLoadServer()
    private init(){}
    
    static func show() {
        // 正在显示就不显示
        guard HttpLoadServer.shareInstance.isShow else {
            return
        }
        
        HttpLoadServer.shareInstance.isShow = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}


