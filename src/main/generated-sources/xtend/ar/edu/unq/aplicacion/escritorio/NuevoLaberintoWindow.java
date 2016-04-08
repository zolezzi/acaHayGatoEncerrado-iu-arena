package ar.edu.unq.aplicacion.escritorio;

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearLaberintoAppModel;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class NuevoLaberintoWindow extends Dialog<CrearLaberintoAppModel> {
  public NuevoLaberintoWindow(final WindowOwner owner, final CrearLaberintoAppModel model) {
    super(owner, model);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
