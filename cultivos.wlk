import wollok.game.*
import hector.*
import granja.*

class Maiz { // las clases siempre arrancan con mayusculas 
	var property position = null
	var property image = self.esBebe()
	var property esAdulto = false
	


	method regar() {
	  self.image(self.evolucionar())
	  esAdulto = true 
	}

	method esBebe(){
		return "corn_baby.png"
	}

	method evolucionar() {
	  return "corn_adult.png"
	}

	method precio() {
	  return 150
	}
}

class Trigo {
	var property position = null
	var property image    = "wheat_0.png"
	var property estado   = 0 
	var property esAdulto = false

		method regar() {
		self.evolucionar()	
	    self.image("wheat_"+ estado + ".png") // self.image le digo que lo haga instantaneamente el cambio
		
	}

	method evolucionar() {

	  if (estado == 0){
		estado = 1
		esAdulto = true
	  }
	  else if (estado == 1){
		estado = 2
	  }
	  else if (estado == 2){
		estado = 3
	  }
	  else if (estado == 3){
		estado = 0
		esAdulto = false
	  }
	}

	method precio() {
	  return (estado - 1) * 100
	}

}

class Tomaco {
	var property position = null
	var property image = "tomaco.png"
	var property esAdulto = true // es una constante?

	method regar() {
		const nuevaPosition = position.up(1)

		if (not granja.haySemilla(nuevaPosition) && granja.estaDentroDeLosLimites(nuevaPosition)){
			position = nuevaPosition
		}
	}

	method precio() {
	  return 80
	}

}

