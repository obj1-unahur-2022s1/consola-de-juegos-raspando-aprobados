import wollok.game.*
import juego.*
import vidas.*

class Enemigo{	
	var property position
	var vida = 1
	const property image = ["monstruo.png", "monstruoNivel2.png"]	
	
	method tePuedePisar(unObjeto) = true
	
	method colisionadoPor(objeto) {
		if(player.estaArmado()) {
			vida -=1
			game.removeVisual(self)
		}
		else {
	    	player.restarVida()
	    	game.say(player, "¡Auch! No debi hacer eso")
	    }
}
	
	/*method producirAccion(){
		if (player.estaArmado()){
			game.sound("matarenemigo.mp3").play()
			vida -= 1
			game.removeVisual(self)
	    } else {
	    	player.restarVida()
	    	game.say(player, "¡Auch! No debi hacer eso")
	    }
	}
	*/
	
	
} 