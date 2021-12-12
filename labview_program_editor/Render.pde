abstract class Renderable {
  int zindex = 0;

  void render(Renderer r) {
  }

  boolean mousePressed() {
    return false;
  }

  void mouseReleased() {
  }

  void mouseDragged() {
  }

  void setZindex(int z) {
    this.zindex = z;
  }
}

class Renderer {
  int posX = 0, posY = 0;

  public void draw_rect(int x, int y, int w, int h) {
    rect(x + this.posX, y + this.posY, w, h);
  }

  public void draw_text(String text, int x, int y) {
    text(text, this.posX + x, this.posY + y);
  }
}

class RenderPool extends ArrayList<Renderable> {
  public void sorting() {
    RenderPool rp = new RenderPool();

    while (this.size() > 0) {
      int minIndex = 0;

      for (int i = 0; i < this.size(); i++)
        if ( this.get(i).zindex < this.get(minIndex).zindex) minIndex = i;

      rp.add(this.remove(minIndex));
    }

    this.addAll(rp);
  }

  public void resorting() {
    RenderPool rp = new RenderPool();

    while (this.size() > 0) {
      int maxIndex = 0;

      for (int i = 0; i < this.size(); i++)
        if ( this.get(i).zindex > this.get(maxIndex).zindex) maxIndex = i;

      rp.add(this.remove(maxIndex));
    }

    this.addAll(rp);
  }
}

class RenderableContainer extends Renderable {
  public RenderPool renderables = new RenderPool();
  public Renderer renderer = new Renderer();
  
  RenderableContainer(int x, int y){
    renderer.posX = x;
    renderer.posY = y;
  }

  public void render() {
    this.renderables.sorting();
    for (Renderable r : this.renderables) {
      r.render(this.renderer);
    }
  }

  public boolean mousePressed() {
    this.renderables.resorting();
    for (Renderable r : this.renderables)
      if (r.mousePressed()) break;
    
    return false;
  }
  
  public void mouseReleased() {
    this.renderables.resorting();
    for (Renderable r : this.renderables)
      r.mouseReleased();
  }
  
  public void mouseDragged() {
    this.renderables.resorting();
    for (Renderable r : this.renderables)
      r.mouseDragged();
  }
}
