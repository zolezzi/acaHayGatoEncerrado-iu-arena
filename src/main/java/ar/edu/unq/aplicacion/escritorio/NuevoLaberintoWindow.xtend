package ar.edu.unq.aplicacion.escritorio

import org.uqbar.arena.windows.Dialog
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearLaberintoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

class NuevoLaberintoWindow extends Dialog<CrearLaberintoAppModel>{
	
	new(WindowOwner owner, CrearLaberintoAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}