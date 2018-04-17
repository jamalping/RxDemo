//
//  HttpLoadServer.swift
//  RxSwiftNetWorkDemo
//
//  Created by xp on 2018/4/17.
//  Copyright © 2018年 C. All rights reserved.
//

import UIKit

/// 加载中的提示
public class HttpLoadServer {
    
    /// 是否显示
    private var isShow: Bool = false
    
    let window: UIWindow = UIApplication.shared.keyWindow ?? UIApplication.shared.windows[0]
    
    // 图片数组用于动画
    let animalImgs: [UIImage] = {
        var animationImages = [UIImage]()
        for i in 1..<29 {
            guard let image = UIImage.init(named: "page_load_\(i)") else { continue }
            animationImages.append(image)
        }
        return animationImages
    }()
    
    /// 背景视图
    lazy var bgView: UIView = {
        let view = UIView()
        view.bounds = window.bounds
        return view
    }()
    
    /// 动画视图
    lazy var loadingImageView: UIImageView = {
        let imgView = UIImageView.init(image: UIImage.init(named: "page_load_1"))
        imgView.frame = CGRect.init(x: 0, y: 0, width: 80, height: 80)
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    private static let shareInstance = HttpLoadServer()
    private init(){}
    
    
    /// 显示
    static func show() {
        // 正在显示就不显示
        guard !HttpLoadServer.shareInstance.isShow else {
            return
        }
        
        HttpLoadServer.shareInstance.isShow = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let loadImgView = HttpLoadServer.shareInstance.loadingImageView
        let bgView = HttpLoadServer.shareInstance.bgView
        let window = HttpLoadServer.shareInstance.window
        
        loadImgView.animationImages = HttpLoadServer.shareInstance.animalImgs
        
        loadImgView.animationDuration = 2
        loadImgView.startAnimating()
        
        bgView.addSubview(loadImgView)
        window.addSubview(bgView)
        bgView.center = window.center
        loadImgView.center = bgView.center
    }
    
    
    /// 隐藏
    static func hidden() {
        guard HttpLoadServer.shareInstance.isShow else {
            return
        }
        HttpLoadServer.shareInstance.isShow = false
        let loadImgView = HttpLoadServer.shareInstance.loadingImageView
        let bgView = HttpLoadServer.shareInstance.bgView
        loadImgView.removeFromSuperview()
        bgView.removeFromSuperview()
    }
}


