struct PontoStruct {
    var x: Int
    var y: Int
}

class PontoClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

func testarComportamentosDeCopia() {
    var pontoA = PontoStruct(x: 10, y: 10)
    var pontoB = pontoA
    pontoB.x = 50
    
    print("struct - ponto A: \(pontoA.x) | ponto B: \(pontoB.x)")
    
    let pontoC = PontoClass(x: 10, y: 10)
    let pontoD = pontoC
    pontoD.x = 50
    
    print("class - ponto C: \(pontoC.x) | ponto D: \(pontoD.x)")
}