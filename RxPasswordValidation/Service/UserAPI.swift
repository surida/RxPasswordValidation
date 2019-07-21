//
//  UserAPI.swift
//  Splash
//
//  Created by 안관수 on 2018. 10. 8..
//  Copyright © 2018년 안관수. All rights reserved.
//

import Foundation
import Moya

enum UserAPI {
    case requestSMS(personalNumber: String, name: String, mobileProvider: String, mobileNumber: String)
    case register(token: String, password: String, marketing: Bool, email: String?)
    case login(token: String, marketing: Bool)
    case validatePassword(password: String)
    case verifySMS(authNo: String, responseSEQ: String)
    case changePasswordByAuthToken(token: String, newPassword: String)
    case changePasswordByCurrentPassword(password: String, newPassword: String)
    case isUser(authNo: String, responseSEQ: String)
    case me
    case findMany(phoneList: [String])
    case delete(phone: String, password: String)
}

struct PushSettingModel: Codable {
    let NOTICE: Bool
    let EVENT: Bool
    let PAYMENT: Bool
}

extension UserAPI: TargetType {
    var baseURL: URL {
        return URL(string: "you must input real url")! // todo: real url like this "URLs.API.gateway"
    }
    
    var path: String {
        switch self {
        case .requestSMS:
            return "api/v1/nice/requestSMS"
        case .register:
            return "api/v1.1/users"
        case .login:
            return "api/v1.1/auth/login"
        case .validatePassword:
            return "api/v1/auth/validate-password"
        case .verifySMS:
            return "api/v1/users/password/verifySMS"
        case .changePasswordByAuthToken:
            return "api/v1.1/users/password/forgot"
        case .changePasswordByCurrentPassword:
            return "api/v1/users/password/change"
        case .isUser:
            return "api/v1.1/users/isUser"
        case .me:
            return "api/v1/users/me"
        case .findMany:
            return "api/v1/users/find-many"
        case .delete:
            return "api/v1/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .requestSMS:
            return .post
        case .register:
            return .post
        case .login:
            return .post
        case .validatePassword:
            return .post
        case .verifySMS:
            return .post
        case .changePasswordByAuthToken:
            return .put
        case .changePasswordByCurrentPassword:
            return .put
        case .isUser:
            return .post
        case .me:
            return .get
        case .findMany:
            return .post
        case .delete:
            return .delete
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return "sample".data(using: .utf8)!
        }
    }
    
    var task: Task {
        var parameters: [String: Any]?
        let parameterEncoding: Moya.ParameterEncoding
        
        switch self {
        case .requestSMS(let personalNumber, let name, let mobileProvider, let mobileNumber):
            parameters = [
                "personalNumber": personalNumber,
                "name": name,
                "mobileProvider": mobileProvider,
                "mobileNumber": mobileNumber
            ]
            parameterEncoding = JSONEncoding.default
            
        case .register(let token, let password, let marketing, let email):
            parameters = [
                "token": token,
                "password": password,
                "marketing": marketing,
                "fcmToken": "TODO:shouldPassFcmToken",
                "pushSettings": [
                    "NOTICE": false,
                    "EVENT": false,
                    "PAYMENT": false
                ]
            ]
            
            // optional
            if let email = email {
                parameters?["email"] = email
            }
            
            parameterEncoding = JSONEncoding.default
            
        case .login(let token, let marketing):
            parameters = [
                "token": token,
                "marketing": marketing,
                "fcmToken": "TODO:shouldPassFcmToken",
                "pushSettings": [
                    "NOTICE": false,
                    "EVENT": false,
                    "PAYMENT": false
                ]
            ]
            parameterEncoding = JSONEncoding.default
            
        case .validatePassword(let password):
            parameters = ["password": password]
            parameterEncoding = JSONEncoding.default
            
        case .verifySMS(let authNo, let responseSEQ):
            parameters = [
                "authNo": authNo,
                "responseSEQ": responseSEQ
            ]
            parameterEncoding = JSONEncoding.default
            
        case .changePasswordByAuthToken(let token, let newPassword):
            parameters = [
                "token": token,
                "newPassword": newPassword
            ]
            parameterEncoding = JSONEncoding.default
            
        case .changePasswordByCurrentPassword(let password, let newPassword):
            parameters = [
                "password": password,
                "newPassword": newPassword
            ]
            parameterEncoding = JSONEncoding.default
            
        case .isUser(let authNo, let responseSEQ):
            parameters = [
                "authNo": authNo,
                "responseSEQ": responseSEQ
            ]
            parameterEncoding = JSONEncoding.default
            
        case .me:
            parameters = nil
            parameterEncoding = URLEncoding.default
            
        case .findMany(let phoneList):
            parameters = [
                "phoneList": phoneList
            ]
            parameterEncoding = JSONEncoding.default
            
        case .delete(let phone, let password):
            parameters = [
                "phone": phone,
                "password": password
            ]
            parameterEncoding = JSONEncoding.default
        }
        
        return Task.requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        let cookie = UserDefaults.standard.string(forKey: "cookie")
        var result: [String : String]
        
        if let cookie = cookie {
            result = [
                "Content-Type": "application/json",
                "Cookie": "jwtToken=" + cookie
            ]
        } else {
            result = [
                "Content-Type": "application/json"
            ]
        }
        
        result["version"] = "1.0" //AppInfo.version
        return result
    }
    
}
