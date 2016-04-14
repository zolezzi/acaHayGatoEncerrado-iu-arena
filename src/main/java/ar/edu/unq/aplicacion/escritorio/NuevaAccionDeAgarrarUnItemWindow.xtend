package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeAgarrarUnItemAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class NuevaAccionDeAgarrarUnItemWindow extends Dialog<CrearAccionDeAgarrarUnItemAppModel> {
	
	new(NuevaAccionWindow owner, CrearAccionAppModel model) {
		super(owner, new CrearAccionDeAgarrarUnItemAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar accion de agarrar un elemento"
		
		new Label(mainPanel).text = "Escriba el elemento que aparecera en la habitacion"
		
		// falta algo aca
		
		crearPanelDeBotonesNuevaAccionDeAgarrarUnItem(new Panel(this))
	}
	
	def crearPanelDeBotonesNuevaAccionDeAgarrarUnItem(Panel owner) {
		
		val Panel nuevaAccionDeAgarrarUnItemPanel = new Panel(owner)
		nuevaAccionDeAgarrarUnItemPanel.layout = new HorizontalLayout
		
		new Button(nuevaAccionDeAgarrarUnItemPanel)=>[
			caption = "Agregar"
			//onClick [ | new NuevaAccionDeIrHabitacionWindow(this, this.modelObject).open]
		]
			
		new Button(nuevaAccionDeAgarrarUnItemPanel)=>[
			caption = "Cancelar"
			//onClick [ | new NuevaAccionDeAgarrarUnItemWindow(this, this.modelObject).open]
		]
	}
	
}