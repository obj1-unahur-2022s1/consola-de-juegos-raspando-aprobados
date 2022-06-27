import wollok.game.*
import juego.*

class Arma {

	const property position
	
	method image() = "arma2.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		game.removeVisual(self)
		player.estaArmado(true) 
	}
}

/*class Escudo inherits Arma {
   override method image() = "escudo.png" */
