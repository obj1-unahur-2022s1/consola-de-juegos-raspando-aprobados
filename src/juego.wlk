import wollok.game.*
import consola.*

object juego {
	
	
	method configurar(){
		game.height(10)
		game.width(13)
		game.title("laberintoGame")
		game.boardGround("laberinto.jpeg")
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
