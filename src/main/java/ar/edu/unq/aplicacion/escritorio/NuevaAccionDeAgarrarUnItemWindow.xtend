package ar.edu.unq.aplicacion.escritorio

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel

class NuevaAccionDeAgarrarUnItemWindow extends Dialog<AdministradorSistemaAppModel> {
	
	new(WindowOwner owner, AdministradorSistemaAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar accion de agarrar un elemento"
		
		new Label(mainPanel).text = "Escriba el elemento que aparecera en la habitacion"
		
		new TextBox(mainPanel) => [
			value <=> "nombreItem" 
			width = 200
		]
		
		crearPanelDeBotonesNuevaAccionDeAgarrarUnItem(new Panel(this))
	}
	
	def crearPanelDeBotonesNuevaAccionDeAgarrarUnItem(Panel owner) {
		
		val Panel nuevaAccionDeAgarrarUnItemPanel = new Panel(owner)
		nuevaAccionDeAgarrarUnItemPanel.layout = new HorizontalLayout
		
		new Button(nuevaAccionDeAgarrarUnItemPanel)=>[
			caption = "Agregar"
			onClick [ | 
				this.modelObject.agregarAccionDeAgarrarUnElementoAHabitacionSeleccionada
				this.close
			]	
		]
				
		new Button(nuevaAccionDeAgarrarUnItemPanel)=>[
			caption = "Cancelar"
			onClick [ |
				this.close
			]
		]
	}

	
}