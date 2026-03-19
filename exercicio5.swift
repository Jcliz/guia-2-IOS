protocol FormaGeometrica {
    func calcularArea() -> Double
}

struct Retangulo: FormaGeometrica {
    var largura: Double
    var altura: Double
    
    func calcularArea() -> Double {
        return largura * altura
    }
}