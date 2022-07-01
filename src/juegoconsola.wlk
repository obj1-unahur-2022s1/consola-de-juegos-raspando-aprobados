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
import musica.*



class Juego{
	var property position = null
	var property color = "Amarillo"

	method iniciar(){
		game.addVisual(object{method position()= game.center() method text() = "Juego "+ color + " - <q> para salir"})
	}
	method terminar(){}
	method image() = "juego" + color + ".png" //Son los dinosaurios
}
object juegoLaberinto inherits Juego{
	
	override method image() = "guerreroSinArma.png"
	
	override method iniciar(){
		game.title("Laberinto")
		game.height(13)
		game.width(24)	
		game.cellSize(50)	
		game.ground("suelo.png")
		game.addVisualIn(pantallaDeInicio,game.at(0,0))
		pantallaDeInicio.iniciarAnimacion()
		keyboard.enter().onPressDo({nivel1.configuracion()})  
//		musicaNivel.play()	

	}

}
