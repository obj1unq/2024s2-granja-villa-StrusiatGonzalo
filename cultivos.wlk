import wollok.game.*
import hector.*
import granja.*

class Maiz { // las clases siempre arrancan con mayusculas 
	var property position = null
	var property image = self.esBebe()
	


	method regar() {
	  self.image(self.esAdulto())
	}

	method esBebe(){
		return "corn_baby.png"
	}

	method esAdulto() {
	  return "corn_adult.png"
	}
}

class Trigo {
	var property position = null
	var property image    = "wheat_0.png"
	var property estado   = 0 

		method regar() {
		self.evolucionar()	
	    self.image("wheat_"+ estado + ".png") // self.image le digo que lo haga instantaneamente el cambio
	}

	method evolucionar() {

	  if (estado == 0){
		estado = 1
	  }
	  else if (estado == 1){
		estado = 2
	  }
	  else if (estado == 2){
		estado = 3
	  }
	  else if (estado == 3){
		estado = 0
	  }
	}

}

class Tomaco {
	var property position = null
	var property image = "tomaco.png"

	method regar() {
		const nuevaPosition = position.up(1)

		if (not granja.haySemilla(nuevaPosition) && granja.estaDentroDeLosLimites(nuevaPosition)){
			position = nuevaPosition
		}
	  
	}

}

