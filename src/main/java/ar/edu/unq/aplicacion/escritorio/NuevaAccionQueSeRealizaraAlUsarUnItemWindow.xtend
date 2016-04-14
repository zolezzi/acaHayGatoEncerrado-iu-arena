package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeUsarUnItemAppModel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class NuevaAccionQueSeRealizaraAlUsarUnItemWindow extends Dialog<CrearAccionDeUsarUnItemAppModel> {
	
	new(WindowOwner owner, CrearAccionDeUsarUnItemAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		title = "Crear Nueva Acción que se realizará al Usar un Item"
		
		new Label(mainPanel).text = "Selecciona una accion a agregar"
		
		val Panel panelDeBotonesNuevaAccion = new Panel(this)
		crearPanelDeBotonesCrearAccionDeUsarUnItem(panelDeBotonesNuevaAccion)
	}
	
	def crearPanelDeBotonesCrearAccionDeUsarUnItem(Panel owner) {
		
		val Panel nuevaAccionPanel = new Panel(owner)
		nuevaAccionPanel.layout = new HorizontalLayout
		
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de ir a otra habitacion"
			onClick [ | new NuevaAccionDeIrHabitacionWindow(this, this.modelObject).open]
		]
			
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de agarrar un elemento"
			onClick [ | new NuevaAccionDeAgarrarUnItemWindow(this, this.modelObject).open]
		]
	}
}