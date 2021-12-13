import java.awt.*;

Frame frame;

void initFrame(){
  //System.setProperty("apple.laf.useScreenMenuBar", "true");
  
  // https://stackoverflow.com/questions/12145166/when-you-use-frame-or-jframe-in-java
  
  // https://discourse.processing.org/t/show-an-desktop-menu-bar/9651/2
  //JFrame frame = (java.awt.Frmae) ((processing.awt.PSurfaceAWT.SmoothCanvas)this.getSurface().getNative()).getFrame();
  //JMenuBar menu_bar = new JMenuBar();
  //  // Add the menubar to the frame
  //frame.setJMenuBar(menu_bar);
  //JMenu import_menu = new JMenu("File");
  //menu_bar.add(import_menu);
  //frame.setVisible(true);
  
  // https://www.javatpoint.com/java-awt-menuitem-and-menu
  frame = (java.awt.Frame) ((processing.awt.PSurfaceAWT.SmoothCanvas)this.getSurface().getNative()).getFrame();
  MenuBar menubar =new MenuBar();  
  Menu file_menu=new Menu("File");  
  MenuItem file_open =new MenuItem("Exit");  
  file_menu.add(file_open);
  
  menubar.add(file_menu);  
  
  frame.setMenuBar(menubar);    
  frame.setVisible(true);
}
