import wollok.game.*
import juego.*

class Vida {

	const property position
	
	method image() = "vida.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		player.agregarVida()
		game.removeVisual(self)
	}
}

class BarraVida {
	
	const property position
	
	method image() { 
		 if(player.vidasActuales() == 2){
	 	  return "barraVidas2.png" 
		} else if(player.vidasActuales() == 1){
	 	  return "barraVidas1.png" 
        } else if(player.vidasActuales() == 0){
	 	  return "barraVidas0.png" 
        } else if (player.vidasActuales() == 3){
	 	  return "barraVidasLlena.png"
	 	}
	 	else {
	 		return ""
	 	}
    }
    
    method tePuedePisar(unObjeto) = false
}