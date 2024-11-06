import pacientes.*


class Aparato {
    var property color = "blanco"
    method consecuenciaDelUso(unPaciente)
    method puedeSerUsado(unPaciente)
}

class Magneto inherits Aparato {
    var imantacion = 800

    method necesitaMantenimieto() = imantacion < 100
    method hacerMantenimiento() {
        imantacion += 500
    }

    override method consecuenciaDelUso(unPaciente) {
        unPaciente.disminuirDolor(
            unPaciente.nivelDeDolor() * 0.1
            )
        imantacion = 0.max(imantacion - 1)
    }
    override method puedeSerUsado(unPaciente) = true
}

class Bicicleta inherits Aparato {
    var cantTornillosDesajustados = 0
    var cantAceitePerdido = 0

    method hacerMantenimiento() {
        cantAceitePerdido = 0
        cantTornillosDesajustados = 0
    }
    method necesitaMantenimiento() = cantTornillosDesajustados >= 10 || cantAceitePerdido >= 5

    override method consecuenciaDelUso(unPaciente) {
        unPaciente.disminuirDolor(4)
        unPaciente.aumentarFortaleza(3)
        if(unPaciente.nivelDeDolor() > 30){
            cantTornillosDesajustados += 1
            if(unPaciente.edad().between(30,50))
                cantAceitePerdido += 1
        }
    }
    override method puedeSerUsado(unPaciente) = unPaciente.edad() > 8
}

class Minitramp inherits Aparato {
    method hacerMantenimiento() {}
    method necesitaMantenimiento() = false

    override method consecuenciaDelUso(unPaciente) {
        unPaciente.aumentarFortaleza(unPaciente.edad() * 0.1)
    }

    override method puedeSerUsado(unPaciente) = 
        unPaciente.nivelDeDolor() < 20
}