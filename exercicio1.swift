class Carro {
    var marca: String
    var modelo: String
    
    var ano: Int {
        willSet {
            print("o ano do carro vai mudar de \(ano) para \(newValue).")
        }
    }
    
    init(marca: String, modelo: String, ano: Int) {
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
    }
}