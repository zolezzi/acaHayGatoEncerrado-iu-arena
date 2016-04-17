package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeUsarUnItemAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.aplicacion.componentes.LabeledSelector
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class NuevaAccionDeUsarUnItemWindow extends Dialog<CrearAccionDeUsarUnItemAppModel> {
	
	new(WindowOwner owner, CrearAccionAppModel model) {
		super(owner, new CrearAccionDeUsarUnItemAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		title = "Crear Acción para Usar un Item"
		new Label(mainPanel).text = "Seleccione el Item para Usar"

		new LabeledSelector(mainPanel) => [
			
			bindItemsToProperty("itemsAgarrables")
			bindValueToProperty("itemRequeridoParaUsar")
		]

		val Panel panelInferiorDeNuevaAccionDeUsarUnItem = new Panel(this)
		crearPanelInferiorDeNuevaAccionDeUsarUnItem(panelInferiorDeNuevaAccionDeUsarUnItem)
		
/*		new Label(mainPanel).text = "Cree la Acción que se realizará"
		new Label(mainPanel).text = "al usar el item seleccionado"
*/
/*		new LabeledSelector(mainPanel)=>[
			
			bindItemsToProperty("laberinto.habitaciones")
			bindValueToProperty("habitacionALaCualIr")
		]
*/	/*	
		new TextBox(mainPanel) => [
			value <=> "itemNuevo.nombre" 
			width = 200
		]
*/	/*		
		new Button(mainPanel)=>[
			caption = "Agregar Acción"
			onClick [|new NuevaAccionQueSeRealizaraAlUsarUnItemWindow(this, this.modelObject).open]
		]
		
		new Label(mainPanel).text = this.modelObject.accionARealizarAlUsarElItem.nombre
*/		
/*		val Panel panelDeBotonesNuevaAccionDeUsarUnItem = new Panel(this)
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
		]*/		
	}
	
	def crearPanelInferiorDeNuevaAccionDeUsarUnItem(Panel owner) {
		
		val Panel panelInferiorDeNuevaAccionDeUsarUnItem = new Panel(owner)
		panelInferiorDeNuevaAccionDeUsarUnItem.layout = new HorizontalLayout
		
		val Panel panelParaCrearAccionDeUsarUnItemParaObtenerOtroItem = new Panel(panelInferiorDeNuevaAccionDeUsarUnItem)
		crearPanelParaCrearAccionDeUsarUnItemParaObtenerOtroItem(panelParaCrearAccionDeUsarUnItemParaObtenerOtroItem)
		
		val Panel panelParaCrearAccionDeUsarUnItemParaIrAUnaHabitacion= new Panel(panelInferiorDeNuevaAccionDeUsarUnItem)
		crearPanelParaCrearAccionDeUsarUnItemParaIrAUnaHabitacion(panelParaCrearAccionDeUsarUnItemParaIrAUnaHabitacion)
		
		new Button(panelInferiorDeNuevaAccionDeUsarUnItem)=>[
			caption = "Cancelar"
			onClick [ | this.close ]
		]
	}
	
	def crearPanelParaCrearAccionDeUsarUnItemParaIrAUnaHabitacion(Panel owner) {
		val Panel panelParaCrearAccionDeUsarUnItemParaIrAUnaHabitacion = new Panel(owner)
		
		new LabeledSelector(panelParaCrearAccionDeUsarUnItemParaIrAUnaHabitacion)=>[
			
			bindItemsToProperty("habitacionesALasCualesIr")
			bindValueToProperty("habitacionALaCualIr")
		]
		
		new Button(panelParaCrearAccionDeUsarUnItemParaIrAUnaHabitacion)=>[
			caption = "Crear Acción para usar un Item y Obtener Otro"
			onClick [ |
				this.modelObject.agregarAccionDeObtenerOtroItem
				this.close
			]
		]
	}
	
	def crearPanelParaCrearAccionDeUsarUnItemParaObtenerOtroItem(Panel owner) {
		val Panel panelParaCrearAccionDeUsarUnItemParaObtenerOtroItem = new Panel(owner)
		
		new TextBox(panelParaCrearAccionDeUsarUnItemParaObtenerOtroItem) => [
			value <=> "itemAObtener.nombre" 
			width = 180
		]

		new Button(panelParaCrearAccionDeUsarUnItemParaObtenerOtroItem)=>[
			caption = "Crear Acción para usar un Item e Ir a una Habitación"
			onClick [ |
				this.modelObject.agregarAccionDeIrAOtraHabitacion
				this.close
			]
		]
	}
}