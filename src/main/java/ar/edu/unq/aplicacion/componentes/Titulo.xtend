package ar.edu.unq.aplicacion.componentes

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label

class Titulo extends Label {
	new(Panel container, String text, Integer fontSize) {
		super(container)
		this.text = text
		this.fontSize = fontSize
	}
	
	new(Panel container, String text) {
		super(container)
		this.text = text
		this.fontSize = 14
	}
	
}