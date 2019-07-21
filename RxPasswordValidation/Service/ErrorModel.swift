//
//  ErrorModel.swift
//  Splash
//
//  Created by 안관수 on 2018. 10. 10..
//  Copyright © 2018년 안관수. All rights reserved.
//

import Foundation

struct ErrorModel: Decodable {
    let error: ErrorMsg
}

struct ErrorMsg: Decodable {
    let message: String
}

extension ErrorModel {
    enum ErrorType: String {
        case passwordWrong           = "AUTH.INVALID_PASSWORD"
        case notEnoughMoney          = "USER.NOT_ENOUGH_MONEY"
        case noUser                  = "NO_USER"
        case existEmail              = "REGISTER.EXIST_EMAIL"
        case alreadyRated            = "RATING.ALREADY_RATED"
        case expiredOrder            = "ORDER.EXPIRED_ORDER"
        case authenticationFailed    = "AUTHENTICATION_FAILED"
        case transferNoPaymentAmount = "TRANSFER.NO_PAYMENT_AMOUNT"
        case samePassword            = "USER.SAME_PASSWORD"
        case niceAuthNotMatched      = "NICE.0001"
        case invalidCouponNumber     = "COUPON.INVALID_GOODS_ID"
        case invalidFriend           = "USER.NO_USER"
        case jwtExpired              = "JWT.EXPIRED_TOKEN"
        case qrCodeExpired           = "QRCODE.EXPIRED"
        case versionDeprecated       = "VERSION.DEPRECATED_VERSION"
        case notRegisteredWallet     = "TRANSFER.NOT_REGISTERED_WALLET"
        case alreadyGotBonus         = "BONUS.ALREADY_BONUS"
        case etc
    }
    
    var errorType: ErrorType {
        return ErrorType(rawValue: error.message) ?? .etc
    }
    
    var description: String {
        switch errorType {
        case .passwordWrong:
            return "패스워드가 틀렸습니다. 다시 입력해 주세요."
        case .notEnoughMoney:
            return "포인트가 부족합니다. 충전해 주세요"
        case .noUser:
            return "유저가 없습니다."
        case .existEmail:
            return "이메일이 등록되어 있습니다. 다시 시도해 주세요"
        case .alreadyRated:
            return "이미 등록한 상점입니다."
        case .expiredOrder:
            return "만료되었습니다. 다시 시도해 주세요"
        case .authenticationFailed:
            return "현재 단말에서 인증이 필요합니다"
        case .transferNoPaymentAmount:
            return "보너스가 존재하지 않습니다."
        case .samePassword:
            return "이전 패스워드와 같습니다. 다시 시도해 주세요"
        case .niceAuthNotMatched:
            return "인증 불일치입니다.다시 시도해 주세요"
        case .invalidCouponNumber:
            return "쿠폰 번호를 확인해 주세요"
        case .invalidFriend:
            return "선물받을 친구를 확인해 주세요"
        case .jwtExpired:
            return "시간이 만료되었습니다. 다시 시도해주세요"
        case .qrCodeExpired:
            return "QR코드 시간이 만료되었습니다. 다시 시도해주세요"
        case .versionDeprecated:
            return "최신 버전을 설치해 주세요. 앱스토어로 이동합니다."
        case .notRegisteredWallet:
            return "등록되지 않은 지갑주소입니다. 다시 시도해주세요"
        case .alreadyGotBonus:
            return "이미 보너스를 받았어요."
        case .etc:
            return error.message
        }
    }
}
