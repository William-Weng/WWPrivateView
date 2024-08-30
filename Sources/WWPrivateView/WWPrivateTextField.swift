//
//  WWPrivateTextField.swift
//  WWPrivateView
//
//  Created by William.Weng on 2024/8/30.
//

import UIKit

// MARK: - 利用UITextField密碼內文不會被擷圖的特色
final class WWPrivateTextField: UITextField {
    
    override var canBecomeFirstResponder: Bool { false }
    
    weak var privateContainer: UIView? { return findPrivateView() }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetting()
    }
    
    override func becomeFirstResponder() -> Bool { false }
}

// MARK: - 小工具
extension WWPrivateTextField {
    
    /// [設定成輸成密碼的樣式](https://blog.wyan.vip/2024/02/iOS_avoid_screen_capture.html)
    func initSetting() {
        isSecureTextEntry = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
    /// [找尋擷不到圖的那個輸入框](https://medium.com/@lakshimi.cg/screenshot-prevention-in-ios-f059dc82b046)
    /// - Returns: UIView?
    func findPrivateView() -> UIView? {
        
        guard let privateView = subviews.filter({ subview in type(of: subview).description().contains("CanvasView") }).first else { return nil }
        
        privateView.translatesAutoresizingMaskIntoConstraints = false
        privateView.isUserInteractionEnabled = true
        
        return privateView
    }
}
