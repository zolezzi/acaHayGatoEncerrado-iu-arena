package ar.edu.unq.aplicacion.componentes;

import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;

@SuppressWarnings("all")
public class Titulo extends Label {
  public Titulo(final Panel container, final String text, final Integer fontSize) {
    super(container);
    this.setText(text);
    this.setFontSize((fontSize).intValue());
  }
  
  public Titulo(final Panel container, final String text) {
    super(container);
    this.setText(text);
    this.setFontSize(14);
  }
}
