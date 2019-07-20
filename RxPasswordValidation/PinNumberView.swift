//
//  PinNumberView.swift
//  Splash
//
//  Created by 안관수 on 2018. 11. 5..
//  Copyright © 2018년 안관수. All rights reserved.
//

import RxSwift
import RxCocoa
import SnapKit
import Then

extension PinNumberView {
    
    class OneDigitView: UIView {
        
        let digitLabel = UILabel().then {
            $0.text = ""
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 20)
        }
        
        var hiddenBall: Bool = true {
            didSet {
                if hiddenBall {
                    self.digitLabel.text = ""
                } else {
                    self.digitLabel.text = "●"
                }
            }
        }
        
        let underLineView = UIView().then {
            $0.backgroundColor = UIColor.init(rgb: 0xffd103)            
        }
        
        init() {
            super.init(frame: .zero)
            
            self.addSubviews(
                [
                    digitLabel,
                    underLineView
                ]
            )
            
            layout()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func layout() {
            
            digitLabel.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.centerX.equalToSuperview()
                $0.height.equalTo(35)
            }
            
            underLineView.snp.makeConstraints {
                $0.top.equalTo(digitLabel.snp.bottom)
                $0.left.right.bottom.equalToSuperview()
                $0.height.equalTo(2)
                
            }
        }
        
    }
}

class PinNumberView: UIView {
    
    let digit1View = OneDigitView()
    let digit2View = OneDigitView()
    let digit3View = OneDigitView()
    let digit4View = OneDigitView()
    let digit5View = OneDigitView()
    let digit6View = OneDigitView()
    
    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 15
    }
    
    init() {
        super.init(frame: .zero)
        
        stackView.addArrangedSubviews(
            [
                digit1View,
                digit2View,
                digit3View,
                digit4View,
                digit5View,
                digit6View
            ]
        )
        
        self.addSubview(stackView)
        
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: refactor -> digitView Array?
    var pinNumber: String? {
        didSet {
            guard let pinNumber = pinNumber else { return }
            switch pinNumber.count {
            case 0:
                digit1View.hiddenBall = true
                digit2View.hiddenBall = true
                digit3View.hiddenBall = true
                digit4View.hiddenBall = true
                digit5View.hiddenBall = true
                digit6View.hiddenBall = true
            case 1:
                digit1View.hiddenBall = false
                digit2View.hiddenBall = true
                digit3View.hiddenBall = true
                digit4View.hiddenBall = true
                digit5View.hiddenBall = true
                digit6View.hiddenBall = true
            case 2:
                digit1View.hiddenBall = false
                digit2View.hiddenBall = false
                digit3View.hiddenBall = true
                digit4View.hiddenBall = true
                digit5View.hiddenBall = true
                digit6View.hiddenBall = true
            case 3:
                digit1View.hiddenBall = false
                digit2View.hiddenBall = false
                digit3View.hiddenBall = false
                digit4View.hiddenBall = true
                digit5View.hiddenBall = true
                digit6View.hiddenBall = true
            case 4:
                digit1View.hiddenBall = false
                digit2View.hiddenBall = false
                digit3View.hiddenBall = false
                digit4View.hiddenBall = false
                digit5View.hiddenBall = true
                digit6View.hiddenBall = true
            case 5:
                digit1View.hiddenBall = false
                digit2View.hiddenBall = false
                digit3View.hiddenBall = false
                digit4View.hiddenBall = false
                digit5View.hiddenBall = false
                digit6View.hiddenBall = true
            case 6:
                digit1View.hiddenBall = false
                digit2View.hiddenBall = false
                digit3View.hiddenBall = false
                digit4View.hiddenBall = false
                digit5View.hiddenBall = false
                digit6View.hiddenBall = false
            default:
                print("default")
            }
        }
    }
        
    func layout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
