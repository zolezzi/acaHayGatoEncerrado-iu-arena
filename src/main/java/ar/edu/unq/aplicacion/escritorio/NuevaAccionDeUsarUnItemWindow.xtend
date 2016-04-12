package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeUsarUnItemAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog

class NuevaAccionDeUsarUnItemWindow extends Dialog<CrearAccionDeUsarUnItemAppModel> {
	
	new(NuevaAccionWindow owner, CrearAccionAppModel model) {
		super(owner, new CrearAccionDeUsarUnItemAppModel(model))
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
}