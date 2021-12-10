class Rect extends Renderable{
  int w, h, posX, posY, lposX, lposY, mposX, mposY;
  boolean draggable = false;

  Label label = new Label();

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

  void render(Renderer r) {
    fill(255);
    strokeWeight(1);

    int pX = this.posX, pY = this.posY;

    if (this.draggable) {
      pX = this.mposX;
      pY = this.mposY;

      strokeWeight(2);
    }
    
    r.draw_rect(pX, pY, this.w, this.h);

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
