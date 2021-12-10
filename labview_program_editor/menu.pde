class MenuRect extends Renderable{
  int posX, posY, width, height;
  boolean display = false;
  
  PopupMenu popupmenu = new PopupMenu("Edit");

  MenuRect(){
    this.width = 100;
    this.height = 50;
    this.zindex = 1000;
    
    MenuItem cut = new MenuItem("Cut");  
    MenuItem copy = new MenuItem("Copy");  
    MenuItem paste = new MenuItem("Paste");  
    
    MenuItem m2top = new MenuItem("Move to Top");  
    MenuItem m2bottom = new MenuItem("Move to Bottom");  
    MenuItem mf = new MenuItem("Move Forward");  
    MenuItem mb = new MenuItem("Move Backward");  
    
    popupmenu.add(cut);
    popupmenu.add(copy);
    popupmenu.add(paste);
    
    popupmenu.addSeparator();
    
    popupmenu.add(m2top);
    popupmenu.add(m2bottom);
    popupmenu.add(mf);
    popupmenu.add(mb);
    
    frame.add(popupmenu);
  }
  
  boolean mousePressed(){
    boolean inRange =  mouseX > this.posX &&
      mouseX < this.posX + this.width &&
      mouseY > this.posY &&
      mouseY < this.posY + this.height;
      
    if(mouseButton == LEFT) return false;
    
    this.posX = mouseX;
    this.posY = mouseY;
    
    popupmenu.show(frame, this.posX, this.posY);
    
    return true;
  }
}
