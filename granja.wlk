import wollok.game.*
import hector.*
object granja {

    const property semillasSembradas = #{} 
  
    method validarSiEstaDentroDelTablero(position) {
        if (not self.estaDentroDeLosLimites(position)){
            hector.error("no puede moverse fuera del limite")
    }
  }

    method estaDentroDeLosLimites(position) {
        return position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 1)
  }

   method regarSemillasSiHay(position) {
	self.validarSiHaySemillas(position)
	self.regarPlanta(position) 
   }

   method validarSiHaySemillas(position){
	if (not self.haySemilla(position)){
		hector.error("No hay semilla aca!")
	}
   }

   method sembrar(planta) {
	self.validarSembrar(planta.position())
	semillasSembradas.add(planta)
	
	 
   }

   method validarSembrar(position) {
		if (self.haySemilla(position)){
			hector.error("Ya hay una planta aca")
		}
   }

   method haySemilla(position) {
	 return semillasSembradas.any({semilla => semilla.position() == position})
   }

   method regarPlanta(position) {
	 self.plantaEnLaDireccion(position).regar()
   }

   method plantaEnLaDireccion(position) {
	 return semillasSembradas.find({semilla => semilla.position() == position})
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