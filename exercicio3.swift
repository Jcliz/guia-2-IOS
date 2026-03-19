class Animal {
    func fazerSom() {
        print("som genérico de animal")
    }
}

class Cachorro: Animal {
    override func fazerSom() {
        print("au au!                   eu sou um cachorro falante.")
    }
}