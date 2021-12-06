import UIKit

class MatchVC: UIViewController {
    
    var usuario: Usuario? {
        didSet {
            if let usuario = usuario {
                imagePhotoView.image = UIImage(named: usuario.foto)
                messageLabel.text = "\(usuario.nome) curtiu você tambem"
            }
        }
    }
    
    let imagePhotoView: UIImageView = .fotoImageView(named: "pessoa-1")
    let likeImageView: UIImageView = .fotoImageView(named: "icone-like")
    let messageLabel: UILabel = .textBoldLabel(18, textColor: .white, numberOfLines: 1)
    
    let mensagemTxt: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.placeholder = "Diag algo legal"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.textColor = .darkText
        textField.returnKeyType = .go
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.rightViewMode = .always
        
        return textField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor((UIColor(red: 62/255, green: 163/255, blue: 255/255, alpha: 1)), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imagePhotoView)
        imagePhotoView.fillSuperView()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        
        imagePhotoView.layer.addSublayer(gradient)
        
        messageLabel.textAlignment = .center
        
        backButton.addTarget(self, action: #selector(handlerBack), for: .touchUpInside)
        
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        likeImageView.contentMode = .scaleAspectFit
        
        mensagemTxt.addSubview(sendButton)
        sendButton.fill(top: mensagemTxt.topAnchor, leading: nil, tralling: mensagemTxt.trailingAnchor, bottom: mensagemTxt.bottomAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        
        let stackView = UIStackView(arrangedSubviews: [likeImageView, messageLabel, mensagemTxt, backButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.fill(top: nil, leading: view.leadingAnchor, tralling: view.trailingAnchor, bottom: view.bottomAnchor, padding: .init(top: 0, left: 32, bottom: 46, right: 32))
        
    }
    
    @objc func handlerBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
