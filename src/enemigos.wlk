import wollok.game.*
import juego.*

class Enemigo{	
	var property position
	
	method image()= "monstruo.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		if (player.estaArmado()){
			game.removeVisual(self)
	    } else {
	    	game.say(player, "¡Auch! No debi hacer eso")
	    }
	}
	
} 