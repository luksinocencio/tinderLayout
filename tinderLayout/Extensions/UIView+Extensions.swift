import UIKit

extension UIView {
    func fill(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, tralling: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let tralling = tralling {
            trailingAnchor.constraint(equalTo: tralling, constant: -padding.right).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func fillSuperView(padding: UIEdgeInsets = .zero) {
        fill(top: superview?.topAnchor, leading: superview?.leadingAnchor, tralling: superview?.trailingAnchor, bottom: superview?.bottomAnchor, padding: padding)
    }
    
    func centerSuperView(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superViewCenterX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterX).isActive = true
        }
        
        if let superViewCenterY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superViewCenterY).isActive = true
        }
        
        
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func size(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
}
