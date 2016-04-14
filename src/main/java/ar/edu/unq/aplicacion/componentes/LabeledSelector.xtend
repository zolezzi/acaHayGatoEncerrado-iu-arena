package ar.edu.unq.aplicacion.componentes

import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class LabeledSelector<T> extends AbstractLabeledWidget {

	Selector<T> selector
	
	new(Container container) {
		super(container)
	}
	
	def bindItemsToProperty(String property){
		selector.bindItemsToProperty(property).adapter = new PropertyAdapter(Habitacion,"nombre")
		this
	}
	
	override createWidget(AbstractLabeledWidget widget) {
		selector = new Selector<T>(this) => [
			width = 200
		]
	}
	
	override bindValueToProperty(String property) {
		selector.bindValueToProperty(property)
		this
	}
}
