package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeAgarrarUnItemAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label

class NuevaAccionDeAgarrarUnItemWindow extends Dialog<CrearAccionDeAgarrarUnItemAppModel> {
	
	new(NuevaAccionWindow owner, CrearAccionAppModel model) {
		super(owner, new CrearAccionDeAgarrarUnItemAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar accion de agarrar un elemento"
		
		new Label(mainPanel).text = "Escriba el elemento que aparecera en la habitacion"
		
		
	}
	
}