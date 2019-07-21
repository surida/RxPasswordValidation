//
//  ViewController.swift
//  RxPasswordValidation
//
//  Created by 안관수 on 20/07/2019.
//  Copyright © 2019 안관수. All rights reserved.
//

import RxSwift
import RxCocoa
import SnapKit

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호 6자리를 입력해주세요"
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 18)
        return lb
    }()
    
    let pinNumView = PinNumberView()
    let pinNumInputView = PinNumberInputView()

    // service
    let validatePasswordService = ValidatePasswordServiceMock.instance //ValidatePasswordServiceImpl.instance
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .init(rgb: 0x425bc7)
        
        self.view.addSubviews(
            [
                titleLabel,
                pinNumView,
                pinNumInputView
            ]
        )
        
        layout()
        bind()
    }

    func bind() {
        
        pinNumInputView.viewModel.numbersText
            .drive(onNext: {
                self.pinNumView.pinNumber = $0
            })
            .disposed(by: disposeBag)
        
        let inputPasswrod = pinNumInputView.viewModel.numbersText.asObservable()
            .filter {
                $0.count == 6
            }
            .share()
        
        let validateResult = inputPasswrod
            .flatMap { [unowned self] inputPassword in
                self.validatePasswordService.validatePassword(password: inputPassword)
            }
            .share()
        
        validateResult.asObservable()
            .flatMap { (result) -> Observable<Void> in
                switch result {
                case .success:
                    return Observable.just(Void())
                default:
                    return Observable.empty()
                }
            }
            .withLatestFrom(inputPasswrod)
            .bind {
                print("\($0) is correct")
            }
            .disposed(by: disposeBag)
        
        validateResult.asObservable()
            .flatMap { (result) -> Observable<String> in
                switch result {
                case .failed(let reason):
                    return Observable.just(reason.error.message)
                default:
                    return Observable.empty()
                }
            }
            .bind {
                print("\($0)")
            }
            .disposed(by: disposeBag)

    }
    
    func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.topLayoutGuide.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        pinNumView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(50)
        }
        
        pinNumInputView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(-50)
        }
        
    }

    


}

