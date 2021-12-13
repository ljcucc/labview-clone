class Rect extends Renderable{
  int w, h, posX, posY, lposX, lposY, mposX, mposY;
  boolean draggable = false;

  Label label = new Label();
  
  ConnectableSet connectables = new ConnectableSet(posX, posY);

  class Label {
    String text = "untitle block "+String.valueOf(zindex);
    boolean display = true;
  }

  Rect(int x, int y) { // comes from init
    this.w = 50;
    this.h = 50;
    this.posX = x;
    this.posY = y;
  }

  @Override
  void render(Renderer r) {
    fill(255);
    strokeWeight(1);
    
    int pX = this.posX, pY = this.posY;
    
    stroke(0);
    if (this.draggable) {
      pX = this.mposX;
      pY = this.mposY;

      strokeWeight(3);
    }
    
    r.draw_rect(pX, pY, this.w, this.h);
    
    connectables.render(pX, pY);

    if (this.label.display) {
      fill(0);
      textSize(14);
      r.draw_text(this.label.text, pX, pY - 4 );
    }
  }

  boolean mousePressed() {
    if(mouseButton == RIGHT) return false;
    if (mouseX > this.posX && mouseX < this.posX+ this.w && mouseY > this.posY && mouseY < this.posY+ this.h) {
      this.lposX = mouseX;
      this.lposY = mouseY;

      this.mposX = mouseX + this.posX - this.lposX;
      this.mposY = mouseY + this.posY - this.lposY;

      this.draggable = true;
      
      return true;
    }
    
    return false;
  }

  void mouseReleased() {
    surface.setCursor(ARROW);
    if (this.draggable) {
      this.draggable = false;

      this.posX = this.mposX;
      this.posY = this.mposY;
    }
  }

  void mouseDragged() {
    surface.setCursor(MOVE);
    this.mposX = mouseX + this.posX - this.lposX;
    this.mposY = mouseY + this.posY - this.lposY;
  }
  
  void setZindex(int z){
    this.zindex = z;
    this.label.text = "untitle block "+String.valueOf(zindex);
  }
}

class ConnectableSet extends RenderableContainer{
  ConnectableSet(int x, int y){
    super(x, y);
    
    ConnectablePoint c1 = new ConnectablePoint(0, 0);
    ConnectablePoint c2 = new ConnectablePoint(0, 10);
    ConnectablePoint c3 = new ConnectablePoint(0, 20);
    ConnectablePoint c4 = new ConnectablePoint(0, 30);
    ConnectablePoint c5 = new ConnectablePoint(0, 40);
    this.add(c1);
    this.add(c2);
    this.add(c3);
    this.add(c4);
    this.add(c5);
  }
}

class ConnectablePoint extends Renderable{
  int posX, posY, w, h;
  ConnectablePoint(){
    this.posX = 0;
    this.posY = 0;
    this.w = 10;
    this.h = 10;
  }
  
  ConnectablePoint(int x, int y){
    this.posX = x-5;
    this.posY = y;
    this.w = 10;
    this.h = 10;
  }
  
  public void render(Renderer r){
    if(mouseX > r.getPosX(this.posX) && mouseX < r.getPosX(this.posX+ this.w) && mouseY > r.getPosY(this.posY) && mouseY < r.getPosY(this.posY+ this.h)){
      fill(0);
      r.draw_rect(this.posX, this.posY, 10, 10);
    }
  }
}
