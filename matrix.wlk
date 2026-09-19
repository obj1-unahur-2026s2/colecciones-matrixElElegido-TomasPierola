object neo {
    var energia = 100

    method esElegido() = true
    method saltar() {
        energia = energia / 2
    }
    method vitalidad() = energia / 10
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method esElegido() = false
    method saltar() {
        estaCansado = !estaCansado
        vitalidad = (vitalidad-1).max(0) 
    } 
    method vitalidad() = vitalidad 
}

object trinity {
    method vitalidad() = 0
    method esElegido() = false
    method saltar() {}   
}

object nave {
    const pasajeros = []

    method subirPasajeros(pasajero) {
        pasajeros.add(pasajero)
    }
    method bajarPasajeros(pasajero) {
        pasajeros.remove(pasajero)
    }
    method cantidadPasajeros() {
        return pasajeros.size()
    }
    method elPasajeroConMayorVitalidad() {
        return pasajeros.max({p => p.vitalidad()})
    }
    method elPasajeroConMenorVitalidad() {
        return pasajeros.min({p => p.vitalidad()})
    }
    method laMayorVitalidad() {
        return pasajeros.max({p => p.vitalidad()}).vitalidad()
    }
    method estaEquilibrada() {
        return pasajeros.all({p => pasajeros.all({otro => p.vitalidad() <= otro.vitalidad()*2})})
    }
    method estaElElegido() {
        return pasajeros.any({pasajero => pasajero.esElegido()})
    }
    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }
    method acelerar() {
        return pasajeros.filter({p => !p.esElegido()}).forEach({p => p.saltar()})
    }
}

