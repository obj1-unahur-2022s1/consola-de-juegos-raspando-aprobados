import wollok.game.*
import niveles.*

class Meta {
	const property position
	const property esArma = false
	const property esEnemigo = false
	const property esVida = false
	
	method tePuedePisar(unObjeto) = true
	method image() = "metafinal.png"
	method producirAccion(){
		if ((nivel3.nivelJuego()) == 3){
		 nivel1.pasarNivel(nivel3)
		}
		else if((nivel2.nivelJuego()) == 2){
		 nivel2.pasarNivel(nivel3)	
		} 
		else if((nivel3.nivelJuego()) == 3) {
		 nivel3.pasarNivel(nivel4)
		} 
	}
	
	method pasarNivel(nivel){
        game.sound("meta.mp3").play()
		nivel.pasarNivel() 
	} 
}
