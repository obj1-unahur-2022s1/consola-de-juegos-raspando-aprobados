import wollok.game.*
import juego.*
import vidas.*

class Enemigo{	
	var property position
	var vida = 1
	const property image = ["monstruo.png", "monstruoNivel2.png"]	
	const property esArma = false
	const property esEnemigo = true
	const property esVida = false
	
	
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		if (player.estaArmado()){
			game.sound("matarenemigo.mp3").play()
			vida -= 1
			game.removeVisual(self)
	    } else {
	    	game.say(player, "¡Auch! No debi hacer eso")
	    }
	}
	
	
	
} 