import wollok.game.*
import consola.*
import juego.*
import direcciones.*
import meta.*
import arma.*
import enemigos.*
import vidas.*
import juegoconsola.*



object paredesBorde {
	var property posDeBloquesBordes = []	

	method agregarBloquesDelBorde(){
		(game.width()).times{i=>posDeBloquesBordes.add(new Pared(
							position=new Position(x=i-1,y=0)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.width()-1).times{i=>posDeBloquesBordes.add(new Pared(
							position=new Position(x=i,y=game.height()-1)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.height()-1).times{i=>posDeBloquesBordes.add(new Pared(
							position=new Position(x=0,y=i)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.height()-1).times{i=>posDeBloquesBordes.add(new Pared(
							position=new Position(x=game.width()-1,y=i)))
							game.addVisual(posDeBloquesBordes.last())}		
		}	

}

class Pared {
	var property position
	const property esEnemigo = false

	method tePuedePisar(unObjeto) = false
	method image() ="muro.png"
}



/*class Pared {
	var property position
	
	method tePuedePisar(unObjeto) = false
	method image() ="muro.png"
	method producirAccion(){}
}
*/