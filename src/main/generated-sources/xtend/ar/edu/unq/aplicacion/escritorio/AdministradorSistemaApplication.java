package ar.edu.unq.aplicacion.escritorio;

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel;
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema;
import ar.edu.unq.aplicacion.escritorio.AdministradorSistemaComponentizadoWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class AdministradorSistemaApplication extends Application {
  protected Window<?> createMainWindow() {
    AdministradorSistemaComponentizadoWindow _xblockexpression = null;
    {
      AdministradorSistemaAppModel _administradorSistemaAppModel = new AdministradorSistemaAppModel();
      final Procedure1<AdministradorSistemaAppModel> _function = new Procedure1<AdministradorSistemaAppModel>() {
        public void apply(final AdministradorSistemaAppModel it) {
          AdministradorSistema _administradorSistema = new AdministradorSistema();
          it.setAdministrador(_administradorSistema);
        }
      };
      final AdministradorSistemaAppModel model = ObjectExtensions.<AdministradorSistemaAppModel>operator_doubleArrow(_administradorSistemaAppModel, _function);
      _xblockexpression = new AdministradorSistemaComponentizadoWindow(this, model);
    }
    return _xblockexpression;
  }
  
  public static void main(final String[] args) {
    AdministradorSistemaApplication _administradorSistemaApplication = new AdministradorSistemaApplication();
    _administradorSistemaApplication.start();
  }
}
