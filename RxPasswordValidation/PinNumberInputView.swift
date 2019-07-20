//
//  PinNumberInputView.swift
//  Splash
//
//  Created by 안관수 on 2018. 11. 5..
//  Copyright © 2018년 안관수. All rights reserved.
//

import RxSwift
import RxCocoa
import SnapKit

class PinNumberInputView: UIView {
    let disposeBag = DisposeBag()

    let viewModel = PinNumberInputViewModel()

    let number1Button = UIButton().then {
        $0.setTitle("1", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number2Button = UIButton().then {
        $0.setTitle("2", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number3Button = UIButton().then {
        $0.setTitle("3", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number4Button = UIButton().then {
        $0.setTitle("4", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number5Button = UIButton().then {
        $0.setTitle("5", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number6Button = UIButton().then {
        $0.setTitle("6", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number7Button = UIButton().then {
        $0.setTitle("7", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number8Button = UIButton().then {
        $0.setTitle("8", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number9Button = UIButton().then {
        $0.setTitle("9", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let deleteButton = UIButton().then {
        $0.setTitle("Delete", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let number0Button = UIButton().then {
        $0.setTitle("0", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    let backButton = UIButton().then {
        $0.setTitle("<", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    lazy var numberButtonList = [
        number1Button, number2Button, number3Button,
        number4Button, number5Button, number6Button,
        number7Button, number8Button, number9Button,
        number0Button
    ]
    
    let firstRowStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 0
    }
    
    let secondRowStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 0
    }
    
    let thirdRowStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 0
    }
    
    let fourthRowStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 0
    }

    let mainStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 0
    }
    
    init() {
        super.init(frame: .zero)
        
        numberButtonList.shuffle()
        
        firstRowStackView.addArrangedSubviews(
            [
                numberButtonList[0],
                numberButtonList[1],
                numberButtonList[2],
            ]
        )
        
        secondRowStackView.addArrangedSubviews(
            [
                numberButtonList[3],
                numberButtonList[4],
                numberButtonList[5],
            ]
        )
        
        thirdRowStackView.addArrangedSubviews(
            [
                numberButtonList[6],
                numberButtonList[7],
                numberButtonList[8],
            ]
        )
        
        fourthRowStackView.addArrangedSubviews(
            [
                deleteButton,
                numberButtonList[9],
                backButton
            ]
        )

        mainStackView.addArrangedSubviews(
            [
                firstRowStackView,
                secondRowStackView,
                thirdRowStackView,
                fourthRowStackView
            ]
        )
        
        addSubview(mainStackView)
        
        layout()
        
        // Bindings
        
        number1Button.rx.tap
            .bind(to: viewModel.num1BtnTapped)
            .disposed(by: disposeBag)
        
        number2Button.rx.tap
            .bind(to: viewModel.num2BtnTapped)
            .disposed(by: disposeBag)
        
        number3Button.rx.tap
            .bind(to: viewModel.num3BtnTapped)
            .disposed(by: disposeBag)
        
        number4Button.rx.tap
            .bind(to: viewModel.num4BtnTapped)
            .disposed(by: disposeBag)
        
        number5Button.rx.tap
            .bind(to: viewModel.num5BtnTapped)
            .disposed(by: disposeBag)
        
        number6Button.rx.tap
            .bind(to: viewModel.num6BtnTapped)
            .disposed(by: disposeBag)
        
        number7Button.rx.tap
            .bind(to: viewModel.num7BtnTapped)
            .disposed(by: disposeBag)
        
        number8Button.rx.tap
            .bind(to: viewModel.num8BtnTapped)
            .disposed(by: disposeBag)
        
        number9Button.rx.tap
            .bind(to: viewModel.num9BtnTapped)
            .disposed(by: disposeBag)
        
        deleteButton.rx.tap
            .bind(to: viewModel.delBtnTapped)
            .disposed(by: disposeBag)
        
        number0Button.rx.tap
            .bind(to: viewModel.num0BtnTapped)
            .disposed(by: disposeBag)
        
        backButton.rx.tap
            .bind(to: viewModel.backBtnTapped)
            .disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        firstRowStackView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
        
        secondRowStackView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
        
        thirdRowStackView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
        
        fourthRowStackView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}
