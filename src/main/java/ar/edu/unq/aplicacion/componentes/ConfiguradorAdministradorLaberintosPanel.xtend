package ar.edu.unq.aplicacion.componentes

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.List
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import ar.edu.unq.aplicacion.escritorio.NuevoLaberintoWindow
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorLaberintosAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel

class ConfiguradorAdministradorLaberintosPanel{
	
	new(WindowOwner window, AdministradorSistemaAppModel appModel, Panel owner) {

		val Panel panelDeListadoDeLaberintos = new Panel(owner)
		
		new Titulo(panelDeListadoDeLaberintos, "Tus Laberintos")
		
		new List<Laberinto>(panelDeListadoDeLaberintos) => [
				(items <=> "administrador.laberintos").adapter = new PropertyAdapter(Laberinto, "nombre")
				height = 270
				width = 185
				value <=> "laberintoSeleccionado"
			]
		
		val Panel panelDeBotonesAdministradorLaberintos = new Panel(panelDeListadoDeLaberintos)
		crearPanelDeBotonesHorizontalParaAdministradorLaberintos(window, appModel, panelDeBotonesAdministradorLaberintos)	
	}
	
	def crearPanelDeBotonesHorizontalParaAdministradorLaberintos(WindowOwner window, AdministradorSistemaAppModel appModel, Panel owner) {
		
		val Panel panelDeBotonesAdministradorLaberintos = new Panel(owner)
		panelDeBotonesAdministradorLaberintos.layout = new HorizontalLayout
		
		new Button(panelDeBotonesAdministradorLaberintos) =>[
			caption = "Crear Laberinto"
			onClick [ | new NuevoLaberintoWindow(window,new AdministradorLaberintosAppModel(appModel)).open ]
		] 
		
		new Button(panelDeBotonesAdministradorLaberintos) =>[
			caption = "Eliminar Laberinto"
			onClick [ | appModel.quitarLaberinto ]
		] 
	}
}