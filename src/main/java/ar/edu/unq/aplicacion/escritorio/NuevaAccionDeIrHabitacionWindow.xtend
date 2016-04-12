package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeIrHabitacionAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog

class NuevaAccionDeIrHabitacionWindow extends Dialog<CrearAccionDeIrHabitacionAppModel>{
	
	new(NuevaAccionWindow owner, CrearAccionAppModel model) {
		super(owner, new CrearAccionDeIrHabitacionAppModel(model))
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
}