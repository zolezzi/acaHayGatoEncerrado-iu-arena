package ar.edu.unq.aplicacion.componentes

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.acahaygatoencerrado.aplicacion.ReguladorDeInicioYFinalDeUnLaberintoAppModel

class ReguladorDeInicioYFinalDeUnLaberinto {
	
	new(Panel owner, ReguladorDeInicioYFinalDeUnLaberintoAppModel model) {
		
		var panelDelReguladorDeInicioYFinalDeUnLaberinto = new Panel(owner)
		panelDelReguladorDeInicioYFinalDeUnLaberinto.layout = new ColumnLayout(2)
		
		new Label(panelDelReguladorDeInicioYFinalDeUnLaberinto) => [
			text = "Habitación Inicial:"]
			
		new LabeledSelector(panelDelReguladorDeInicioYFinalDeUnLaberinto) => [
			
			bindItemsToProperty("laberintoSeleccionado.habitaciones")
			bindValueToProperty("laberintoSeleccionado.habitacionInicial")
//			bindValueToProperty("setHabitacionInicialAlLaberintoSeleccionado")
		]
		
		new Label(panelDelReguladorDeInicioYFinalDeUnLaberinto) => [
			text = "Habitación Final:"]
		
		new LabeledSelector(panelDelReguladorDeInicioYFinalDeUnLaberinto) => [
			
			bindItemsToProperty("laberintoSeleccionado.habitaciones")
			bindValueToProperty("laberintoSeleccionado.habitacionFinal")
//			bindValueToProperty("setHabitacionFinalAlLaberintoSeleccionado")
		]
	}
}