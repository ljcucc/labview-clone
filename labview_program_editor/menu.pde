class MenuRect extends Renderable{
  int posX, posY, width, height;
  boolean display = false;
  
  RenderPool rp = new RenderPool();

  MenuRect(){
    this.width = 100;
    this.height = 50;
    this.zindex = 1000;
  }

  //void render(){
  //}

  void render(Renderer r){
    if(!display) return;

    fill(255);
    rect(this.posX, this.posY, this.width, this.height);
  }

  boolean mousePressed(){
    boolean inRange =  mouseX > this.posX &&
      mouseX < this.posX + this.width &&
      mouseY > this.posY &&
      mouseY < this.posY + this.height;


    if(display && mouseButton == LEFT && !inRange ){
      display = false;
      return false;
    }

    if(mouseButton != RIGHT || inRange) return false;

    display = mouseButton == RIGHT;
    
    this.posX = mouseX;
    this.posY = mouseY;
    
    return true;
  }
}
