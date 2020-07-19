class Title{
  PFont font;
  String input = "TITLE";
  String[] list;
  private int scl;

  Title(){
  
  }
  
  void update(){
    
    this.font = createFont("AlfaSlabOne-Regular.ttf", 70);
    textFont(font,70);
    
    fill(255);
    text(input, 50, 150, 0);    //Text-Feld
    titleLength();
    
  }
  
  void titleLength(){
  
    //je nach Länge des Titels ändert sich die Größe und somit Anzahl der Elemente
    
    if( input.length() <= 3){
      scl = 55;
    }
    else if( input.length() <= 4){
      scl = 50;
    }
    else if (input.length() <= 5){
      scl = 45;
    }
    else if (input.length() <= 6){
      scl = 40;
    }
    else if (input.length() <= 7){
      scl = 35;
    }
    else if (input.length() <= 8){
      scl = 30;
    }
  }
  
  
  //Tippen des Titels
  //in keyPressed() aufgerufen 
  //Titel wird gespeichert in input
  
  public void checkKeyPressed(){      
      
    if (key == BACKSPACE)
    {
      if(input.length()>0)  
      {
        input = input.substring(0,input.length()-1);
      }
    } 
    else if (key == CODED) 
    {
      if (keyCode == SHIFT)
      {
      }
    }
     else 
     {
      input+= key;
      println( input );
     
     }
      
     
    }
    
    
  public int getScale()
  {
    return this.scl;
  }
  
  
}
