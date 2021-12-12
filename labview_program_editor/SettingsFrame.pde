import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

class SettingsFrame extends Frame implements WindowListener {
  SettingsFrame() {
    this.setSize(300, 300);
    this.setVisible(true);

    this.addWindowListener(this);
  }

  public void windowClosing(WindowEvent we) {
    dispose();
  }

  public void windowDeactivated(WindowEvent e) {
  }
  public void windowDeiconified(WindowEvent e) {
  }
  public void windowIconified(WindowEvent e) {
  }
  public void windowOpened(WindowEvent e) {
  }
  public void windowActivated(WindowEvent e) {
  }
  public void windowClosed(WindowEvent e) {
  }
}
