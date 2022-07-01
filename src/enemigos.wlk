import wollok.game.*
import juego.*


class Enemigo{	
	var property position
	var vida = 1
	const property esArma = false
	const property esEnemigo = true
	const property esVida = false
	
	method image()= "monstruo.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(unPlayer){
		if(unPlayer.estaArmado()){
	    	game.removeVisual(self)
	    	vida -= 1 
	    }
	    else if(!unPlayer.estaArmado()){
			unPlayer.pierdeVida()
			//unPlayer.resetPosition()	
		}
		
	}
}