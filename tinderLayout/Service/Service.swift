import Foundation

class UsuarioService {
    static let shared = UsuarioService()
    
    let usuarios: [Usuario] = [
        Usuario(id: 101, nome: "Maria Silva", idade: 19, match: true, frase: "O ultimo a dar match chama", foto: "pessoa-1"),
        Usuario(id: 102, nome: "Maria Joaquina", idade: 30, match: true, frase: "O ultimo a dar match chama", foto: "pessoa-2"),
        Usuario(id: 103, nome: "Maria De Fatima", idade: 26, match: true, frase: "O ultimo a dar match chama", foto: "pessoa-3"),
        Usuario(id: 104, nome: "Maria Paula", idade: 35, match: true, frase: "O ultimo a dar match chama", foto: "pessoa-4"),
        Usuario(id: 105, nome: "Maria Eduarda", idade: 18, match: true, frase: "O ultimo a dar match chama", foto: "pessoa-5"),
        Usuario(id: 106, nome: "Maria Claudia", idade: 27, match: true, frase: "O ultimo a dar match chama", foto: "pessoa-6"),
        Usuario(id: 107, nome: "Maria Antonia", idade: 32, match: true, frase: "O ultimo a dar match chama", foto: "pessoa-7")
    ]
    
    func buscaUsuarios(completion: @escaping ([Usuario]?, Error?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion(self.usuarios, nil)
        }
    }
}
