import wollok.game.*
import paredes.*
import juego.*
import meta.*
import arma.*
import enemigos.*
import vidas.*

object direcciones {
	method movGuerrero(prota) {
		keyboard.left().onPressDo{ self.move(izquierda, prota);player.direccion(izquierda)}//;player.image("bombermanIzquierda.png")}
		keyboard.right().onPressDo{ self.move(derecha, prota);player.direccion(derecha)}//;player.image("bombermanDerecha.png")}
		keyboard.up().onPressDo{ self.move(arriba, prota); player.direccion(arriba)}
		keyboard.down().onPressDo{ self.move(abajo, prota);player.direccion(abajo)}
	}

	method move(sentido, individuo) {
		individuo.position(sentido.direccion(individuo.position()))
	}

	method chocar(individuo, sentido) {
		self.move(sentido.alChocar(), individuo)
	}
}

object izquierda {
	method direccion(position) = position.left(1)
	method alChocar() = derecha
}

object derecha {
	method direccion(position) = position.right(1)
	method alChocar() = izquierda
}

object abajo {
	method direccion(position) = position.down(1)
	method alChocar() = arriba
}

object arriba {
	method direccion(position) = position.up(1)
	method alChocar() = abajo
}