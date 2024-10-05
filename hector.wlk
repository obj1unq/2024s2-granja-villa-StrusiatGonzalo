import wollok.game.*
import granja.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png" 
	var property cosecha = #{} 
	var property oroDeHector = 0

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

	method cosechar() {
	  self.validarSiHayPlantaParaCosechar()
	  cosecha.add(granja.plantaEnLaDireccion(self.position()))
	  granja.cosecharPlanta(self.position())
	}

	method validarSiHayPlantaParaCosechar() {
	  if (not(granja.haySemilla(self.position()) and granja.plantaEnLaDireccion(self.position()).esAdulto()) ){
		self.error("No tengo nada para cosechar")
	  }
	}

	method vender() {
	  oroDeHector += cosecha.sum({planta => planta.precio()})
	  cosecha.clear()
	}

	method dineroDisponible() {
	  game.say(self, "Mi dinero disponible " + oroDeHector + " y tengo " + cosecha.size() + " plantas para vender" )
	}
}