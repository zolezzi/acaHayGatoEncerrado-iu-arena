package ar.edu.unq.aplicacion.escritorio

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import ar.edu.unq.aplicacion.componentes.LabeledSelector
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel

class NuevaAccionDeIrHabitacionWindow extends Dialog<AdministradorSistemaAppModel>{
	
	new(WindowOwner owner, AdministradorSistemaAppModel model) {
		 super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar accion de ir a otra habitacion"
		
		new Label(mainPanel).text = "Selecciona la habitacion"
		
		val Panel nuevaAccionDeIrAOtraHabitacion = new Panel(mainPanel)
		
		
		new LabeledSelector(nuevaAccionDeIrAOtraHabitacion)=>[
			
			bindItemsToProperty("habitacionesLaberintoSeleccionado")
			bindValueToProperty("habitacionALaCualIr")
		]
		
		val Panel panelDeBotonDeIrAOtraHabitacion = new Panel(this)
		crearPanelDeBotonDeIrAOtraHabitacion(panelDeBotonDeIrAOtraHabitacion)
	}
	
	def crearPanelDeBotonDeIrAOtraHabitacion(Panel nuevaAccionDeIrAOtraHabitacion) {

		nuevaAccionDeIrAOtraHabitacion.layout = new HorizontalLayout
	
		new Button(nuevaAccionDeIrAOtraHabitacion)=>[
			caption = "Agregar"
			onClick [ | 
				this.modelObject.agregarHabitacion
				this.close
			]
		]
		
		new Button(nuevaAccionDeIrAOtraHabitacion)=>[
			caption = "Cancelar"
			onClick [ | 
				this.close
			]
		]
	}
}