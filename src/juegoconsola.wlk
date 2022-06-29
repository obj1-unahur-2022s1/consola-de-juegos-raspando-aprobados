import wollok.game.*
import paredes.*
import juego.*
import direcciones.*
import meta.*
import arma.*
import enemigos.*
import vidas.*
import consola.*
import niveles.*




class Juego{
	var property position = null
	var property color = "Verde"

	method iniciar(){
		game.addVisual(object{method position()= game.center() method text() = "Juego "+color + " - <q> para salir"})
	}
	
	method terminar(){}
	method image() = "juego" + color + ".png"
}
object juegoLaberinto inherits Juego{

	override method iniciar(){
		game.title("Laberinto")
		game.height(9)
		game.width(9)		
		game.ground('suelo.png')
		game.addVisualIn(pantallaDeInicio,game.at(0,0))
		pantallaDeInicio.iniciarAnimacion()
		keyboard.enter().onPressDo({nivel1.configuracion()})  
		musicaNivel.play()	

	}

}
