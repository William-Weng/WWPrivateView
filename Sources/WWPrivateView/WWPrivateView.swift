//
//  WWPrivateView.swift
//  WWPrivateView
//
//  Created by William.Weng on 2024/8/30.
//

import UIKit

// MARK: - 不能被擷圖的View
open class WWPrivateView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var privateTextField: WWPrivateTextField!
    
    private var privateContainerView: UIView?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initViewFromXib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViewFromXib()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        initSetting()
    }
}

// MARK: - 公開函式
public extension WWPrivateView {
    
    /// [加入不要被擷圖的View](https://clox.nu/blog/ios-screenshot-watermark/)
    /// - Parameter view: 要不被擷圖的View
    /// - Returns: 是否加入成功
    func appendSubView(_ view: UIView) -> Bool {
        
        defer { privateContainerView?.addSubview(view) }
        return privateContainerView != nil
    }
}

// MARK: - 小工具
private extension WWPrivateView {
    
    /// [讀取Nib畫面 => 加到View上面](https://support.apple.com/zh-tw/guide/keynote/tan30ff1f63c/mac)
    func initViewFromXib() {
        
        let bundle = Bundle.module
        let name = String(describing: WWPrivateView.self)
        
        bundle.loadNibNamed(name, owner: self, options: nil)
        contentView.frame = bounds

        addSubview(contentView)
    }
    
    /// [設定密碼View](https://www.bannerbear.com/blog/how-to-make-gifs-from-images-using-ffmpeg/)
    func initSetting() {
        privateContainerView = privateTextField?.findPrivateView()
        privateContainerView?.backgroundColor = .clear
    }
}

