import wollok.game.*
import playerdeljuego.*
import vidasdeljuego.*

class Enemigo{	
	var property position
	var vida = 1
	const property esArma = false
	const property esEnemigo = true
	const property esVida = false
	
	method image()= "monstruo.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		if (player.estaArmado()){
			vida -= 1
			game.removeVisual(self)
	    }
	}
	
}