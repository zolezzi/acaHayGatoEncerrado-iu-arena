package ar.edu.unq.aplicacion.escritorio

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import ar.edu.unq.aplicacion.componentes.LabeledSelector
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.acahaygatoencerrado.aplicacion.NuevaAccionDeIrHabitacionAppModel

class NuevaAccionDeIrHabitacionWindow extends Dialog<NuevaAccionDeIrHabitacionAppModel>{
	
	new(WindowOwner owner, NuevaAccionDeIrHabitacionAppModel model) {
		 super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar accion de ir a otra habitacion"
		
		new Label(mainPanel).text = "Selecciona la habitacion"
		
		val Panel panelNuevaAccionDeIrAOtraHabitacion = new Panel(mainPanel)

		new LabeledSelector(panelNuevaAccionDeIrAOtraHabitacion)=>[
			
			bindItemsToProperty("habitacionesALaCualIr")
			bindValueToProperty("habitacionALaCualIr")
		]
		
		val Panel panelDeBotonDeIrAOtraHabitacion = new Panel(this)
		crearPanelDeBotonDeIrAOtraHabitacion(panelDeBotonDeIrAOtraHabitacion)
	}
	
	def crearPanelDeBotonDeIrAOtraHabitacion(Panel panel) {

		panel.layout = new HorizontalLayout
	
		new Button(panel)=>[
			caption = "Agregar"
			onClick [ | 
				this.modelObject.agregarAccionDeIrAHabitacionALaHabitacionSeleccionada
				this.close
			]
		]
		
		new Button(panel)=>[
			caption = "Cancelar"
			onClick [ | 
				this.close
			]
		]
	}
}