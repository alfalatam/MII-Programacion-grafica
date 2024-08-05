class BarChart{
  
  // Defino un color
  color color_barra;
  int margen,gap;
  float[] setData;
  String[] labels;
  int max_value,min_value;
  int bgColor,barColor,axiColor,labelColor;
  // parametros para colorear con raton
  float[] pX,pY,pW,pH;
  //
  BarChart(){
    color_barra = color(200,0,0);
    margen=40;
    bgColor=0;
    barColor=255;
    axiColor=0;
    labelColor=0;
    gap=30;
    max_value=0;
    min_value=0;

  }
  //Colorear barra
   boolean RatonEnBarra(float x1,float y2,float  w,float h){
    boolean resultado=false;
    
     for (int i = 0; i < setData.length; i++) {   
      if(mouseX >x1 && mouseX < w+x1){
        if(mouseY >(h+y2) && mouseY < (y2)){
            resultado=true;
            
        
      }
    }
        }
    return resultado;
    
  }
  // Colores
  void serBackColour(color c){
    bgColor = c;
  }
  void setBarColour(color bc){
    barColor = bc; 
  }
  void setAxiColour(color ac){
    axiColor=ac;  
  }
  void setLabelColour(color lb){
    labelColor=lb;   
  }
  // 
  void setData(float[]x){
    x = sort(x);
    setData= x;
  }
  void setBarGap(int g){
    gap=g;
  }
  
  void setBarLabels(String [] l){
    labels=l;
  }
  
 void setMinMaxValor(int min,int max){
   max_value=max;
   min_value=min;
  }
  

  
  
  void draw(){

      background(bgColor);
      // Color de contorno de la linea
      stroke(axiColor);
      // ancho de la linea
      strokeWeight(4);
      line(margen,margen,margen,height-margen);
      line(margen,height-margen,width-margen,height-margen);

      //

      stroke(barColor);
      //Case 2
      textSize(20);
      text(str(max_value),5,margen+10);
      text(str(min_value),10,height-margen);
      

      for (int i = 0; i < setData.length; i++) {
              
         float normalize= (setData[i]-min_value)/(max_value-min_value);
        //float h = map(setData[i], 0, 5, 0, 400);

        float x1=margen+10+i*((width-margen*2)/(setData.length));
        float y2=height-margen-10;
        float w=(width-margen)/(setData.length)-gap-10;
        float h=(-height+margen*2)*normalize;
        //
        
        // rect X Y Width Height
       if(RatonEnBarra(x1, y2, w,h)){
         print(h);
        text((str(setData[i])), x1+(w/2)-margen/2, h+y2-10);
        fill(0);
      } else{
          fill(barColor);

        }
        rect(x1, y2, w,h);
        text(str(int(setData[i])), 10, (-height+margen*2)*normalize+height-margen);
        // Text Color
        fill(labelColor);
        text((labels[i]), x1+(w/2)-margen/2, height-margen/2);
        fill(barColor);
        


     
  }
  

    
 }

}
