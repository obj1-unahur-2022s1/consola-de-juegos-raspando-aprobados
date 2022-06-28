import wollok.game.*
import juego.*

class TextoNivel {

	const property position
	const property image = ["nivel1Texto.png", "nivel2Texto.png", "nivel3Texto.png", "nivel4Texto.png"]
	
	method tePuedePisar(unObjeto) = false
	
	method colisionadoPor(objeto){/*Polimrfimso */}

}