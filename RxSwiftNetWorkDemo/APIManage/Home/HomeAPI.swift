//
//  HomeAPI.swift
//  RxSwiftNetWorkDemo
//
//  Created by xp on 2018/4/13.
//  Copyright © 2018年 C. All rights reserved.
//

import Foundation
import Moya

enum HomeApi {
    case getHomeMainList(parameters: [String: Any])
}

extension HomeApi: TargetType, XPTargetType {
    /// The target's base `URL`.
    var baseURL: URL {
        return URL.init(string: hostUrl)!
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .getHomeMainList(parameters: _):
            return "/api/content/indexList.api"
        }
    }
    
    /// The HTTP method used in the request.
    var method: Moya.Method {
        return .post
    }
    
    /// The parameters to be incoded in the request.
    var parameters: [String: Any]? {
        switch self {
        case .getHomeMainList(parameters: let dic):
            return dic
        }
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    /// Provides stub data for use in testing.
    var sampleData: Data {
        return "[{\"name\": \"Repo Name\"}]".data(using: String.Encoding.utf8)!
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .request
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
    
    var isShow: Bool {
        return true
    }
}
