import wollok.game.*
object granja {

    const property semillasSembradas = #{} 
  
    method validarSiEstaDentroDelTablero(position) {
        if (not self.estaDentroDeLosLimites(position)){
            self.error("no puede moverse fuera del limite")
    }
  }

    method estaDentroDeLosLimites(position) {
        return position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 1)
  }
}

object derecha {

  method siguiente(position) {
		return position.right(1) // en el () va la cantidad de pasos que va ser hacia la direccion
	}
}

object abajo {

	method siguiente(position) {
		return position.down(1)
	}	
}

object izquierda {

	method siguiente(position) {
		return position.left(1)
	}
}

object arriba {

	method siguiente(position) {
		return position.up(1)
	}
}