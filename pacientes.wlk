import aparatos.*


class Paciente {
    var edad
    var fortalezaMuscular
    var nivelDeDolor 
    const rutina = []

    method edad() = edad
    method fortalezaMuscular() = fortalezaMuscular
    method nivelDeDolor() = nivelDeDolor
    method cumplirAnios() {
        edad += 1
    }

    method disminuirDolor(unaCantidad){
        nivelDeDolor = 0.max(nivelDeDolor - unaCantidad)
    }
    method aumentarFortaleza(unValor) {
        fortalezaMuscular += unValor
    }
    method puedeUsar(unAparato) = unAparato.puedeSerUsado(self)

    method usar(unAparato) {
        if(self.puedeUsar(unAparato))
            unAparato.consecuenciaDelUso(self)
    }
    method puedeHacerRutina() = rutina.all({a => self.puedeUsar(a)})

    method realizarRutina() {
        rutina.forEach({a => self.usar(a)})
    }
    method cargarRutina(unaLista) {
        rutina.clear()
        rutina.addAll(unaLista)
    }
}

class Resistente inherits Paciente{
    override method realizarRutina() {
        const cantidad = rutina.count({a => self.puedeUsar(a)})
        super()
        self.aumentarFortaleza(cantidad)
    }
}

class Caprichoso inherits Paciente{
    override method puedeHacerRutina() = self.hayAlgunAparatoRojo() and super()

    method hayAlgunAparatoRojo() = rutina.any({a => a.color() == "rojo"})

    override method realizarRutina() {
        super()
        super()
    }
}

class RecuperacionRapida inherits Paciente{
    override method realizarRutina(){
        super()
        self.disminuirDolor(disminucionDolor.valor())
    }
}

object disminucionDolor{
    var property valor = 3
}