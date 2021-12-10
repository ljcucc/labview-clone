import processing.javafx.*;
import java.util.*;

abstract class Renderable{
  int zindex = 0;
  
  abstract void render(Renderer r);
  
  boolean mousePressed(){
    return false;
  }
  
  void mouseReleased(){
  }
  
  void mouseDragged(){
  }
  
  void setZindex(int z){
    this.zindex = z;
  }
}

class Renderer{
  int posX = 0, posY = 0;
  
  public void draw_rect(int x, int y, int w, int h){
    rect(x + this.posX, y + this.posY, w, h);
  }
  
  public void draw_text(String text, int x, int y){
    text(text, x, y);
  }
}

class RenderPool extends ArrayList<Renderable> {
  public void sorting(){
    RenderPool rp = new RenderPool();

    while(this.size() > 0){
      int minIndex = 0;

      for(int i = 0; i < this.size(); i++)
        if( this.get(i).zindex < this.get(minIndex).zindex) minIndex = i;

      rp.add(this.remove(minIndex));
    }
    
    this.addAll(rp);
  }
  
  public void resorting(){
    RenderPool rp = new RenderPool();

    while(this.size() > 0){
      int maxIndex = 0;

      for(int i = 0; i < this.size(); i++)
        if( this.get(i).zindex > this.get(maxIndex).zindex) maxIndex = i;

      rp.add(this.remove(maxIndex));
    }
    
    this.addAll(rp);
  }
}

RenderPool rects = new RenderPool();
Renderer globalRenderer = new Renderer();

void settings(){
  size(800,600, JAVA2D);
}

void setup(){
  surface.setResizable(true);
  surface.setTitle("Labview clone - Program Editor");
  
  initFrame();
  
  MenuRect r = new MenuRect();

  rects.add(r);
}

void draw(){
  clear();
  background(200);
  
  rects.sorting();
  for(Renderable r: rects){
    r.render(globalRenderer);
  }
}

int zindex_count = 0;

void keyReleased(){
  if(key == 'c'){
    Rect r = new Rect(100, 100);
    r.setZindex(zindex_count++);
    
    rects.add(r);
  }
}

void mousePressed() {
  rects.resorting();
  for(Renderable r: rects)
    if(r.mousePressed()) break;
}

void mouseReleased() {
  for(Renderable r: rects)
    r.mouseReleased();
}

void mouseDragged() {
  for(Renderable r: rects)
    r.mouseDragged();
}
