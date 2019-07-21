//
//  ValidatePasswordServiceMock.swift
//  RxPasswordValidation
//
//  Created by 안관수 on 21/07/2019.
//  Copyright © 2019 안관수. All rights reserved.
//

import RxSwift
import RxCocoa
//import RxOptional
import Moya

class ValidatePasswordServiceMock: ValidatePasswordService {
    
    static let instance = ValidatePasswordServiceMock()

    func validatePassword(password: String) -> Single<ValidatePasswordResult> {
        print("password: \(password)")
        
        if password == "123456" {
            return Single.just(ValidatePasswordResult.success)
        } else {
            return Single.just(ValidatePasswordResult.failed(
                reason: ErrorModel(
                    error: ErrorMsg(message: "비번이 틀렸어요")
                )
            ))
        }
        
    }
    
    
    
    
}
