import wollok.game.*
import direcciones.*

object player {
	
	var property position = game.at(4, 0)
	var property direccion = arriba 
	var property estaArmado = false

	var vidas = 3
	
	method image() {
		if (self.estaArmado()){
		  return "guerrero.png"
		}  else {
		  return "guerreroSinArma.png"
	   }
	}
	method mensaje() = "Necesito poder defenderme"
	
//Intento de collide----------------------------------
    
    method juegoTerminado() = vidas == 0
	
	method resetPosition() {
		position = game.at(4, 0)
	}

	method chocarCon(rival) {
		if(!self.estaArmado()){
		vidas -= 1
		self.resetPosition()
		if (self.juegoTerminado()) {
			game.stop()
		}else{
			game.removeVisual(rival.image())
		}
	}
}
	
//----------------------------------------------------
	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	
	method irArriba() {
		direccion = arriba
		self.validarLugarLibre(direccion)
		self.avanzar()
	}
	

	method irAbajo() {
		direccion = abajo
		self.validarLugarLibre(direccion)
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.validarLugarLibre(direccion)
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.validarLugarLibre(direccion)
		self.avanzar()
	}
	
	method avanzar() {
		position = direccion.siguiente(position)
	}
	
	method validarLugarLibre(unaDireccion) {
		const posicionAlLado = unaDireccion.siguiente(position) 
		const lugarLibre = game.getObjectsIn(posicionAlLado).all{ obj => obj.tePuedePisar(self) } //obtengo objetos de la posicion de al lado 
																								  //y pregunta si lo puede pisar el jugador
		if (!lugarLibre) 																		  //si no hay lugar se lanza la excepcion con el mensaje
			throw new Exception(message = "NO PUEDES MOVERTE AHI.")
	
	}

}































class Juego {
	var property position = null
	var property color 
	
	method iniciar(){
        game.addVisual(object{method position()= game.center() method text() = "Juego "+color + " - <q> para salir"})		
	}
	
	method terminar(){

	}
	method image() = "juego" + color + ".png"
	
}
