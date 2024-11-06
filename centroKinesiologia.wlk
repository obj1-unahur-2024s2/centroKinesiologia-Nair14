import pacientes.*
import aparatos.*


object centroKinesio {
    const property aparatos = []
    const property pacientes = []
    
    method cargarPacientes(unaLista) {
      
    }

    method cargarAparatos(unaLista) {
        aparatos.clear()
        aparatos.addAll(unaLista)
    }

    method coloresDeAparatos() = aparatos.map({a => a.color()}).asSet()

    method menoresA(unaEdad) = pacientes.filter({p => p.edad() < unaEdad})

    method cantPacientesSinRealizarRutina() = pacientes.count{p => !p.puedeHacerRutina()}

    method estaEnOptimasCondiciones() = aparatos.all{a => !a.necesitaMantenimiento()}

    method estaComplicado() = self.cantDeAparatosRotos() >= self.laMitadDeLosAparatos()

    method laMitadDeLosAparatos() = aparatos.size() * 0.5

    method cantDeAparatosRotos() = aparatos.count{a => a.necesitaMantenimiento()}

    method elTecnicoHaceMantenimiento() {
        const aparatosRotos = aparatos.filter({a => a.necesitaMantenimiento()})
        
        aparatosRotos.forEach({a => a.hacerMantenimiento()})
    }   
}