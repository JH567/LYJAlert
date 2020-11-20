//
//  LYJAlert.swift
//  LYJAlert
//
//  Created by LYJ on 2020/11/16.
//

import Foundation

public class LYJAlert {
    /**
     无按键
     */
    public class func showAlert(title: String?, message: String?) {
        showAlert(title: title, message: message, cancleTitle: nil, cancleBlock: nil)
    }
    /**
     无按键 left
     */
    public class func showAlert(title: String?, messageL: String?) {
        showAlert(title: title, messageL: messageL, cancleTitle: nil, cancleBlock: nil)
    }
    /**
     取消
     */
    public class func showAlert(title: String?, message: String?, cancleTitle: String?, cancleBlock:((_ action: UIAlertAction) -> ())?) {
        showAlert(title: title, message: message, cancleTitle: cancleTitle, defaultTitle: nil, cancleBlock: cancleBlock, defaultBlock: nil)
    }
    /**
     取消 left
     */
    public class func showAlert(title: String?, messageL: String?, cancleTitle: String?, cancleBlock:((_ action: UIAlertAction) -> ())?) {
        showAlert(title: title, messageL: messageL, cancleTitle: cancleTitle, defaultTitle: nil, cancleBlock: cancleBlock, defaultBlock: nil)
    }
    /**
     确认
     */
    public class func showAlert(title: String?, message: String?, defaultTitle: String?, defaultBlock:((_ action: UIAlertAction) -> ())?) {
        showAlert(title: title, message: message, cancleTitle: nil, defaultTitle: defaultTitle, cancleBlock: nil, defaultBlock: defaultBlock)
    }
    /**
     确认 left
     */
    public class func showAlert(title: String?, messageL: String?, defaultTitle: String?, defaultBlock:((_ action: UIAlertAction) -> ())?) {
        showAlert(title: title, messageL: messageL, cancleTitle: nil, defaultTitle: defaultTitle, cancleBlock: nil, defaultBlock: defaultBlock)
    }
    /**
     取消 确认
     */
    public class func showAlert(title: String?, message: String?, cancleTitle: String?, defaultTitle: String?, cancleBlock:((_ action: UIAlertAction) -> ())?, defaultBlock:((_ action: UIAlertAction) -> ())?) {
        
        let alertController = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: .alert)
                
        if let cancleTitle = cancleTitle, cancleTitle.count != 0 {
            let cancelAction = UIAlertAction(title: cancleTitle, style: .cancel, handler: cancleBlock)
            alertController.addAction(cancelAction)
        }
        
        if let defaultTitle = defaultTitle, defaultTitle.count != 0 {
            let defaultAction = UIAlertAction(title: defaultTitle, style: .default, handler: defaultBlock)
            alertController.addAction(defaultAction)
        }
        
        let activeVC = CurrentVCManager.activityCurrentViewController()
        DispatchQueue.main.async {
            activeVC.present(alertController, animated: true, completion: nil)
        }
        
    }
    /**
     取消 确认 left
     */
    public class func showAlert(title: String?, messageL: String?, cancleTitle: String?, defaultTitle: String?, cancleBlock:((_ action: UIAlertAction) -> ())?, defaultBlock:((_ action: UIAlertAction) -> ())?) {
        
        let alertController = UIAlertController(title: title ?? "", message: messageL ?? "", preferredStyle: .alert)
        
        enumrateSubviewsInView(view: alertController.view, message: messageL ?? "", msgAlignment: .left)
        
        if let cancleTitle = cancleTitle, cancleTitle.count != 0 {
            let cancelAction = UIAlertAction(title: cancleTitle, style: .cancel, handler: cancleBlock)
            alertController.addAction(cancelAction)
        }
        
        if let defaultTitle = defaultTitle, defaultTitle.count != 0 {
            let defaultAction = UIAlertAction(title: defaultTitle, style: .default, handler: defaultBlock)
            alertController.addAction(defaultAction)
        }
        
        let activeVC = CurrentVCManager.activityCurrentViewController()
        DispatchQueue.main.async {
            activeVC.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    /**
     UIAlertController message 居左对齐
     递归
     */
    private class func enumrateSubviewsInView(view: UIView, message: String, msgAlignment: NSTextAlignment) {
        let subViews = view.subviews
        if subViews.count == 0 {
            return
        }
        
        for subView in subViews {
            enumrateSubviewsInView(view: subView, message: message, msgAlignment: msgAlignment)
            
            if subView.isKind(of: UILabel.self) {
                let label = subView as! UILabel
                if label.text == message {
                    label.textAlignment = msgAlignment
                }
            }
        }
        
    }
    
}

private struct CurrentVCManager {
    static func activityCurrentViewController() -> UIViewController {
        
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindow.Level.normal {
            let windows = UIApplication.shared.windows
            for tmpWin in windows {
                if tmpWin.windowLevel == UIWindow.Level.normal {
                    window = tmpWin
                    break
                }
            }
        }
        assert((window != nil), "The window is empty")
        
        guard var currentViewController = window?.rootViewController else {
            return UIViewController()
        }
        
        let runLoopFind = true
        while runLoopFind {
            
            if (currentViewController.presentedViewController != nil) {
                currentViewController = currentViewController.presentedViewController!
            }
            else if currentViewController.isKind(of: UINavigationController.self) {
                let navigationController = currentViewController as! UINavigationController
                currentViewController = navigationController.visibleViewController!
            }
            else if currentViewController.isKind(of: UITabBarController.self) {
                let tabBarController = currentViewController as! UITabBarController
                currentViewController = tabBarController.selectedViewController!
            }
            else {
                let childViewControllerCount = currentViewController.children.count
                if childViewControllerCount > 0 {
                    currentViewController = currentViewController.children.last!
                    return currentViewController
                } else {
                    return currentViewController
                }
            }
            
        }
        
        return currentViewController
    }
}
