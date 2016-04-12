package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeAgarrarUnItemAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog

class NuevaAccionDeAgarrarUnItemWindow extends Dialog<CrearAccionDeAgarrarUnItemAppModel> {
	
	new(NuevaAccionWindow owner, CrearAccionAppModel model) {
		super(owner, new CrearAccionDeAgarrarUnItemAppModel(model))
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}