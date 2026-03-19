class Funcionario {
    func calcularSalario() -> Double {
        return 10.0
    }
}

final class Gerente: Funcionario {
    
    override func calcularSalario() -> Double {
        let salarioBase = super.calcularSalario()
        let bonusGerencia = 5.0
        return salarioBase + bonusGerencia
    }
}