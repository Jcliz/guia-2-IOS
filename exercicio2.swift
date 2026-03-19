class Pessoa {
    var nome: String
    var idade: Int
    
    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
        print("pessoa criada: \(nome).")
    }
    
    func exibirInformacoes() {
        print("nome: \(nome) | idade: \(idade) anos.")
    }
    
    deinit {
        print("pessoa (\(nome)) está sendo desalocado da memória.")
    }
}