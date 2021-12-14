import processing.javafx.*;
import java.util.*;

//RenderPool rects = new RenderPool();
//Renderer globalRenderer = new Renderer();
BlockWorkspace rootContainer = new BlockWorkspace(0, 0);

void settings(){
  size(800,600, JAVA2D);
}

void setup(){
  surface.setResizable(true);
  surface.setTitle("Labview clone - Program Editor");
  
  initFrame();
  
  MenuRect r = new MenuRect();

  //rects.add(r);
  rootContainer.renderables.add(r);
}

void draw(){
  clear();
  background(255);
  
  //rects.sorting();
  //for(Renderable r: rects){
  //  r.render(globalRenderer);
  //}
  rootContainer.render();
}

int zindex_count = 0;

void keyReleased(){
  if(key == 'c'){
    Rect r = new Rect(100, 100);
    r.setZindex(zindex_count++);
    
    //rects.add(r);
    rootContainer.renderables.add(r);
  }else if(key == 's'){
    new SettingsFrame();
  }
}

void mousePressed() {
  //surface.setFrameRate(30.0);
  //rects.resorting();
  //for(Renderable r: rects)
  //  if(r.mousePressed()) break;
  rootContainer.mousePressed();
}

void mouseReleased() {
  //surface.setFrameRate(10.0);
  //for(Renderable r: rects)
  //  r.mouseReleased();
  rootContainer.mouseReleased();
}

void mouseDragged() {
  //for(Renderable r: rects)
  //  r.mouseDragged();
  rootContainer.mouseDragged();
}
