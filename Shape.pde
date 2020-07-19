class Shape{
  
  int x;
  int y;
  float t;
  private String state;
  color col;
  
  Shape(int _x, int _y, float _t, String _state, color _col){
    this.x = _x;
    this.y = _y;
    this.t = _t;
    this.state = _state;
    this.col = _col;
  }
  
  void update(){
    fill(col);
    
    //draw shapes, rect or circle
    
    if (this.state == "circle"){
      
      circle(this.x, this.y, this.t);
      
    }
    else if ( this.state == "rect"){
      
      rect(this.x, this.y, this.t, this.t);
      //rect(this.x, this.y, this.t, this.t, 10);
    }
    
    
    
  } 

}
