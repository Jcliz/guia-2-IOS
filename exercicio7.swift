import Foundation

extension String {
    func formatarParaNumeroSerie(tamanhoTotal: Int = 10) -> String {
        let diferenca = tamanhoTotal - self.count
        if diferenca > 0 {
            let zeros = String(repeating: "0", count: diferenca)
            return zeros + self
        }
        return self
    }
}

protocol Atualizavel {
    func atualizarSoftware() 
}

class DispositivoEletronico {
    let marca: String
    var modelo: String
    
    var preco: Double {
        willSet {
            print(">> O preço do \(modelo) vai mudar de R$\(preco) para R$\(newValue)")
        }
        didSet {
            print(">> O preço do \(modelo) foi alterado para R$\(preco)")
        }
    }
    
    private(set) var numeroSerie: String
    var ligado: Bool
    
    var precoComDesconto: Double {
        return preco * 0.90
    }
    
    init(marca: String, modelo: String, preco: Double) {
        self.marca = marca
        self.modelo = modelo
        self.preco = preco
        self.ligado = false
        let numeroAleatorio = String(Int.random(in: 1...99999))
        self.numeroSerie = numeroAleatorio.formatarParaNumeroSerie()
    }
    
    convenience init(marca: String, modelo: String) {
        self.init(marca: marca, modelo: modelo, preco: 99.99)
    }
    
    func ligar() {
        if !ligado {
            ligado = true
            print("\(modelo) ligado.")
        } else {
            print("\(modelo) já está ligado.")
        }
    }
    
    func desligar() {
        if ligado {
            ligado = false
            print("\(modelo) desligado.")
        } else {
            print("\(modelo) já está desligado.")
        }
    }
    
    func exibirDetalhes() {
        print("\n--- Detalhes do Dispositivo ---")
        print("Marca: \(marca) | Modelo: \(modelo) | Série: \(numeroSerie)")
        print("Preço: R$\(preco) (Com desconto de 10%: R$\(precoComDesconto))")
        print("Status: \(ligado ? "Ligado" : "Desligado")")
    }
    
    func aplicarDesconto(percentual: Double) {
        let valorDesconto = preco * (percentual / 100)
        self.preco -= valorDesconto
    }
    
    deinit {
        print("Recursos do dispositivo \(modelo) (\(marca)) foram liberados da memória.")
    }
}

final class Smartphone: DispositivoEletronico {
    var tamanhoTela: Double
    var temCamera: Bool
    
    init(marca: String, modelo: String, preco: Double, tamanhoTela: Double, temCamera: Bool) {
        self.tamanhoTela = tamanhoTela
        self.temCamera = temCamera
        super.init(marca: marca, modelo: modelo, preco: preco)
    }
    
    override func exibirDetalhes() {
        super.exibirDetalhes()
        print("tela: \(tamanhoTela) polegadas | câmera: \(temCamera ? "Sim" : "Não")")
    }
    
    func tirarFoto() {
        if ligado && temCamera {
            print("tirando foto com o \(modelo)...")
        } else if !ligado {
            print("não é possível tirar foto. O \(modelo) está desligado.")
        } else {
            print("o \(modelo) não possui câmera.")
        }
    }
}

class Notebook: DispositivoEletronico {
    var tamanhoTela: Double
    var capacidadeArmazenamento: Int
    
    init(marca: String, modelo: String, preco: Double, tamanhoTela: Double, capacidadeArmazenamento: Int) {
        self.tamanhoTela = tamanhoTela
        self.capacidadeArmazenamento = capacidadeArmazenamento
        super.init(marca: marca, modelo: modelo, preco: preco)
    }
    
    override func exibirDetalhes() {
        super.exibirDetalhes()
        print("tela: \(tamanhoTela) polegadas | armazenamento: \(capacidadeArmazenamento)GB")
    }
}

extension Notebook: Atualizavel {
    func atualizarSoftware() {
        print("o software do notebook \(modelo) foi atualizado com sucesso!")
    }
}

struct Acessorio {
    var nome: String
    var tipo: String
    var preco: Double
}

func testarSistemaGerenciamento() {
    let meuCelular = Smartphone(marca: "Apple", modelo: "iPhone 15", preco: 7299.0, tamanhoTela: 6.1, temCamera: true)
    let meuNotebook = Notebook(marca: "Dell", modelo: "XPS 13", preco: 10500.0, tamanhoTela: 13.4, capacidadeArmazenamento: 512)

    let inventario: [DispositivoEletronico] = [meuCelular, meuNotebook]
    
    for dispositivo in inventario {
        dispositivo.ligar()
        dispositivo.aplicarDesconto(percentual: 5)
    }
    
    meuCelular.tirarFoto()
    meuNotebook.atualizarSoftware()
}