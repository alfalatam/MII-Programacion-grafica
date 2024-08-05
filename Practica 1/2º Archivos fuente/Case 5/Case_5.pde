class BarChart{
  
  // Defino un color
  color color_barra;
  int margen;
  //int margen= 40;
  int gap=30;
  float[] setData;
  String[] labels;
  int max_value=0;
  int min_value=0;
  int bgColor;
  int barColor;
  int axiColor;
  int labelColor;
  
  BarChart(){
    color_barra = color(200,0,0);
    margen=40;
    bgColor=0;
    barColor=255;
    axiColor=0;
    labelColor=0;

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
   
   //float max = max(setData);
   //float min = min(setData);
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
      fill(barColor);
      

      
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
        // rect X Y Width Height
        rect(x1, y2, w,h);
        text(str(int(setData[i])), 10, (-height+margen*2)*normalize+height-margen);
        // Text Color
        fill(labelColor);
        text((labels[i]), x1+(w/2)-margen/2, height-margen/2);
        fill(barColor);

     
  }
  
  //}
  // boolean RatonEnBarra(){
  //  boolean resultado=false;
  //  if(mouseX >10 && mouseX < 10+50){
  //    if(mouseY >(height -100-10) && mouseY < (height-10)){
  //      resultado=true;
  //    }
  //  }
  //  return resultado;
    
 }

}
