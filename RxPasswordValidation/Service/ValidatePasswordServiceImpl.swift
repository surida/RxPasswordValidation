//
//  ValidatePasswordService.swift
//  Splash
//
//  Created by 안관수 on 2018. 12. 20..
//  Copyright © 2018년 안관수. All rights reserved.
//

import RxSwift
import RxCocoa
//import RxOptional
import Moya

protocol ValidatePasswordService {
    
    func validatePassword(password: String) -> Single<ValidatePasswordResult>
    
}

enum ValidatePasswordResult {
    case success
    case failed(reason: ErrorModel)
    case networkError(reason: Error)
}

class ValidatePasswordServiceImpl: ValidatePasswordService {

    static let instance = ValidatePasswordServiceImpl()
//    let indicatorStatusSubject = BehaviorRelay<IndicatorStatus>(value: .hidden)

    let provider = MoyaProvider<UserAPI>(
        plugins: [NetworkActivityPlugin(networkActivityClosure: { (changeType, targetType) in
            print("changeType: \(changeType), targetType: \(targetType)")
            switch changeType {
            case .began:
//                instance.indicatorStatusSubject.accept(.show)
                print("begin")
            case .ended:
//                instance.indicatorStatusSubject.accept(.hidden)
                print("end")
                
            }
            
        })]
    )

    func validatePassword(password: String) -> Single<ValidatePasswordResult> {
        return provider.rx.request(
            UserAPI.validatePassword(password: password)
            )
            .map { (response) -> ValidatePasswordResult in
                if response.statusCode == 200 {
                    return .success
                } else {
                    return .failed(
                        reason: try response.map(ErrorModel.self)
                    )
                }
            }
            .catchError { (error) -> Single<ValidatePasswordResult> in
                return Single.just(.networkError(reason: error))
            }
    }
}
