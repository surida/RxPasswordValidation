//
//  PinNumberInputViewModel.swift
//  Splash
//
//  Created by 안관수 on 2018. 11. 8..
//  Copyright © 2018년 안관수. All rights reserved.
//

import RxSwift
import RxCocoa

enum NumberKeyButtonType {
    case number(Int)
    case delete
    case back
}

class PinNumberInputViewModel {
    let disposeBag = DisposeBag()
    
    // Inputs
    let num1BtnTapped: PublishSubject<Void> = .init()
    let num2BtnTapped: PublishSubject<Void> = .init()
    let num3BtnTapped: PublishSubject<Void> = .init()
    let num4BtnTapped: PublishSubject<Void> = .init()
    let num5BtnTapped: PublishSubject<Void> = .init()
    let num6BtnTapped: PublishSubject<Void> = .init()
    let num7BtnTapped: PublishSubject<Void> = .init()
    let num8BtnTapped: PublishSubject<Void> = .init()
    let num9BtnTapped: PublishSubject<Void> = .init()
    let delBtnTapped:  PublishSubject<Void> = .init()
    let num0BtnTapped: PublishSubject<Void> = .init()
    let backBtnTapped: PublishSubject<Void> = .init()
    
    // Outputs
    public let numbersText: Driver<String>
    
    init() {
        let numKey1Tapped = num1BtnTapped.map { _ -> NumberKeyButtonType in .number(1) }
        let numKey2Tapped = num2BtnTapped.map { _ -> NumberKeyButtonType in .number(2) }
        let numKey3Tapped = num3BtnTapped.map { _ -> NumberKeyButtonType in .number(3) }
        let numKey4Tapped = num4BtnTapped.map { _ -> NumberKeyButtonType in .number(4) }
        let numKey5Tapped = num5BtnTapped.map { _ -> NumberKeyButtonType in .number(5) }
        let numKey6Tapped = num6BtnTapped.map { _ -> NumberKeyButtonType in .number(6) }
        let numKey7Tapped = num7BtnTapped.map { _ -> NumberKeyButtonType in .number(7) }
        let numKey8Tapped = num8BtnTapped.map { _ -> NumberKeyButtonType in .number(8) }
        let numKey9Tapped = num9BtnTapped.map { _ -> NumberKeyButtonType in .number(9) }
        let delKeyTapped  = delBtnTapped.map  { _ -> NumberKeyButtonType in .delete }
        let numKey0Tapped = num0BtnTapped.map { _ -> NumberKeyButtonType in .number(0) }
        let backKeyTapped = backBtnTapped.map { _ -> NumberKeyButtonType in .back }
        
        self.numbersText = Observable
            .merge(
                numKey1Tapped,
                numKey2Tapped,
                numKey3Tapped,
                numKey4Tapped,
                numKey5Tapped,
                numKey6Tapped,
                numKey7Tapped,
                numKey8Tapped,
                numKey9Tapped,
                delKeyTapped,
                numKey0Tapped,
                backKeyTapped
            )
            .scan("") { (inputted, keyType) -> String in
                switch keyType {
                case .number(let oneDigit):
                    return inputted + "\(oneDigit)"
                case .delete:
                    return ""
                case .back:
                    guard inputted.count > 0 else { return inputted }
                    var tmp = inputted
                    tmp.removeLast()
                    return tmp
                }
            }
            .asDriver(onErrorJustReturn: "")
    }
}
