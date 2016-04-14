package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeUsarUnItemAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter

class NuevaAccionDeUsarUnItemWindow extends Dialog<CrearAccionDeUsarUnItemAppModel> {
	
	new(NuevaAccionWindow owner, CrearAccionAppModel model) {
		super(owner, new CrearAccionDeUsarUnItemAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		title = "Crear Acción de Usar un Item"
		new Label(mainPanel).text = "Seleccione el Item para Usar"

		new Selector<Item>(mainPanel) => [
 		    allowNull(false)
     		value <=> "itemRequeridoParaUsar"
     		bindItems(new ObservableProperty(mainPanel.modelObject, "itemsAgarrables")).adapter = new PropertyAdapter(typeof(Item), "nombre")
		]
		
		new Label(mainPanel).text = "Cree la Acción que se realizará"
		new Label(mainPanel).text = "al usar el item seleccionado"
		
		new Button(mainPanel)=>[
			caption = "Agregar Acción"
			onClick [|new NuevaAccionQueSeRealizaraAlUsarUnItemWindow(this, this.modelObject).open]
		]
		
		//Agregar nombre de Accion
		
		val Panel panelDeBotonesNuevaAccionDeUsarUnItem = new Panel(this)
		crearPanelDeBotonesNuevaAccionDeUsarUnItem(panelDeBotonesNuevaAccionDeUsarUnItem)
	}
	
	def crearPanelDeBotonesNuevaAccionDeUsarUnItem(Panel owner) {
		val Panel panelDeBotonesNuevaAccionDeUsarUnItem = new Panel(owner)
		
		panelDeBotonesNuevaAccionDeUsarUnItem.layout = new HorizontalLayout
		
		new Button(panelDeBotonesNuevaAccionDeUsarUnItem)=>[
			caption = "Aceptar"
			onClick [ |
				this.modelObject.agregarAccion
				this.close
			]
		]
		
		new Button(panelDeBotonesNuevaAccionDeUsarUnItem)=>[
			caption = "Cancelar"
			onClick [ | this.close ]
		]		
	}
}