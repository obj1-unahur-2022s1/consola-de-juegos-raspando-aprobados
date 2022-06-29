
import wollok.game.*
import direcciones.*
import arma.*
import vidas.*

object player {
	
	var property position = game.at(4, 0)
	var property direccion = arriba 
	var property estaArmado = false
	

	var vidas = 3
	
	method image() {
		if (self.estaArmado())
		  return "guerrero.png"
		 else 
		  return "guerreroSinArma.png"
	}
	   
	
	method mensaje() = "Necesito poder defenderme"
	
//Intento de collide----------------------------------
    
    method vidasActuales() = vidas
    
   
	
	method agregarVida(){
		if(vidas < 3)
			vidas += 1
		return vidas
	}
	
	method gameOver(){
		if(vidas == 0){
			game.clear()
		}
		
	}
	
    
	
	method resetPosition() {
		
		position = game.at(4, 0)
	}
	
	
	method chocarConObjeto(unObjeto){
		if(unObjeto.esArma()){
			self.estaArmado(true)
		}else if(unObjeto.esEnemigo() and !self.estaArmado()){
			vidas-=1
			self.resetPosition()
			self.gameOver()
		}else if(unObjeto.esVida())
			self.agregarVida()
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


































/*import wollok.game.*
import direcciones.*
import arma.*
import vidas.*

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
	
	method vidasActuales() = vidas
	
	method mensaje() = "Necesito poder defenderme"
	
	method agregarVida(){
		if(vidas < 3)
			vidas += 1
		return vidas
	}
	
	method restarVida(){vidas -= 1}
	
//----------------------------------------------
	method resetPosition() {
		position = game.at(4, 0)
	}

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
		const lugarLibre = game.getObjectsIn(posicionAlLado).all{ obj => obj.tePuedePisar(self) } 
																								  
		if (!lugarLibre) 																		  
			throw new Exception(message = "NO PUEDES MOVERTE AHI.")
	
	}

}

*/





























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
