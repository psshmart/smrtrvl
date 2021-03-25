//
//  ScrollableView.swift
//  travel
//
//  Created by Svetlana Safonova on 26.03.2021.
//

import UIKit

class ScrollableView: BackgroundView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setScrollView()
        setGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private func setScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setGesture() {
        let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboard)
    }

    @objc private func hideKeyboard() {
            self.scrollView.endEditing(true)
        }

//    @objc func keyboardWasShown(notification: Notification) {
//           let info = notification.userInfo! as NSDictionary
//           let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
//           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
//
//           self.scrollView.contentInset = contentInsets
//           scrollView.scrollIndicatorInsets = contentInsets
//       }
//
//       @objc func keyboardWillBeHidden(notification: Notification) {
//           let contentInsets = UIEdgeInsets.zero
//           scrollView.contentInset = contentInsets
//       }
//
//    func subscribeOnNotification(viewController: UIViewController) {
//        NotificationCenter.default.addObserver(viewController, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(viewController, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    func unsubscribeFromNotifications(viewController: UIViewController) {
//            NotificationCenter.default.removeObserver(viewController, name: UIResponder.keyboardWillShowNotification, object: nil)
//            NotificationCenter.default.removeObserver(viewController, name: UIResponder.keyboardWillHideNotification, object: nil)
//        }
}
