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
		game.addVisual(new Maiz (position = self.position()))
		granja.semillasSembradas.add(new Maiz (position = self.position()))
	}

	method sembrarTrigo() {
		game.addVisual(new Trigo (position = self.position()))
		granja.semillasSembradas.add(new Trigo (position = self.position()))
	}

	method sembrarTomaco() {
		game.addVisual(new Tomaco (position = self.position()))
		granja.semillasSembradas.add(new Tomaco (position = self.position()))
	}
}