//
//  MoyaHttp.swift
//  RxSwiftNetWorkDemo
//
//  Created by xp on 2018/4/13.
//  Copyright © 2018年 C. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public struct MoyaHttp<T: TargetType> {
    
    /// 发送请求
    func sendRequest() -> RxMoyaProvider<T> {
        return RxMoyaProvider<T>.init(
            endpointClosure: endPointClosure,
            plugins: [
            NetworkLoggerPlugin.init(verbose: true, cURL: true, responseDataFormatter: {JSONResponseDataFormatter($0)}),
            ])
    }
    
    /// 设置请求头信息
    let endPointClosure = { (target: T) -> Endpoint<T> in
        let url = target.baseURL.absoluteString
        let endpoint = Endpoint<T>.init(
            url: url,
            sampleResponseClosure: { return .networkResponse(200, target.sampleData) },
            method: target.method,
            parameters: target.parameters,
            parameterEncoding: target.parameterEncoding,
            httpHeaderFields: nil)
        return endpoint
    }
    
}

/// 日志的输出
private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

/// 指示灯的配置的初始化
let spinerPlugin = XYJNetworkActivityPlugin { state in
    guard let currentView = XYJLogVC.instance.currentVC?.view else {
        return
    }
    if state == .began {
//        MBProgressHUD.showAdded(to: currentView, animated: true)
    } else {
//        MBProgressHUD.hide(for: currentView, animated: true)
    }
}

class XYJLogVC {
    var currentVC: UIViewController?
    //声明一个单例对象
    static let instance = XYJLogVC()
    private init(){}
}

public protocol XPTargetType {
    
    var isShow: Bool { get }
}
