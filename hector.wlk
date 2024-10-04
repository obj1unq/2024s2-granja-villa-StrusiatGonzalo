import wollok.game.*
import granja.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png" 

	method mover(direccion) {
	  const nuevaPosicion = direccion.siguiente(position)
	  granja.validarSiEstaDentroDelTablero(nuevaPosicion)

	  position = nuevaPosicion 
	  
	}

	method sembrarMaiz() {
		const maiz = new Maiz (position = self.position())
		granja.sembrar(maiz)
		game.addVisual(maiz)

	}

	method sembrarTrigo() {
		const trigo = new Trigo (position = self.position())
		granja.sembrar(trigo)
		game.addVisual(trigo)
	}

	method sembrarTomaco() {
		const tomaco = new Tomaco (position = self.position())
		granja.sembrar(tomaco)
		game.addVisual(tomaco)

	}

	method regar() {
	   granja.regarSemillasSiHay(self.position())//self.position me da la direccion actual
	   

	}
}