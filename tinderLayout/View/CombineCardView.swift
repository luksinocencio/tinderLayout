import UIKit

class CombineCardView: UIView {
    
    var usuario: Usuario? {
        didSet {
            if let usuario = usuario {
                fotoImageView.image = UIImage(named: usuario.foto)
                nomeLabel.text = usuario.nome
                idadeLabel.text = "\(usuario.idade)"
                fraseLabel.text = usuario.frase
            }
        }
    }
    
    let fotoImageView: UIImageView = .fotoImageView()
    
    let nomeLabel: UILabel = .textBoldLabel(32, textColor: .white, numberOfLines: 1)
    let idadeLabel: UILabel = .textLabel(28, textColor: .white, numberOfLines: 1)
    let fraseLabel: UILabel = .textLabel(18, textColor: .white, numberOfLines: 2)
    
    let deslikeImageView: UIImageView = .iconCard(named: "card-deslike")
    let likeImageView: UIImageView = .iconCard(named: "card-like")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nomeLabel.addShadow()
        idadeLabel.addShadow()
        fraseLabel.addShadow()
        
        addSubview(fotoImageView)
        fotoImageView.fillSuperView()
        
        addSubview(deslikeImageView)
        deslikeImageView.fill(top: topAnchor, leading: nil, tralling: trailingAnchor, bottom: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 20), size: .init(width: 70, height: 70))
        
        addSubview(likeImageView)
        likeImageView.fill(top: topAnchor, leading: leadingAnchor, tralling: nil, bottom: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0), size: .init(width: 70, height: 70))
        
        let nomeIdadeStackView = UIStackView(arrangedSubviews: [nomeLabel, idadeLabel, UIView()])
        nomeIdadeStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nomeIdadeStackView, fraseLabel])
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        
        stackView.fill(top: nil, leading: leadingAnchor, tralling: trailingAnchor, bottom: bottomAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
