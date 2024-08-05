class BarChart{
  
  // Defino un color
  color color_barra;

  int margen= 40;
  int gap=30;
  float[] setData;
  
  int max_value=0;
  int min_value=0;
  
  BarChart(){
    color_barra = color(200,0,0);

  }
  void setData(float[]x){
    x = sort(x);
    setData= x;
  }
  void setBarGap(int g){
    gap=g;
  }
  
 void setMinMaxValor(int min,int max){
   max_value=max;
   min_value=min;
   
   //float max = max(setData);
   //float min = min(setData);
  }
  
  
  void draw(){

      background(255);
      // Color de contorno de la linea
      stroke(0);
      // ancho de la linea
      strokeWeight(4);
      //
      fill(0);
      
      line(margen,margen,margen,height-margen);
      line(margen,height-margen,width-margen,height-margen);
      //Case 2
      textSize(20);
      text(str(max_value),5,margen+10);
      text(str(min_value),10,height-margen);
      

      for (int i = 0; i < setData.length; i++) {
         float normalize= (setData[i]-min_value)/(max_value-min_value);
        //float h = map(setData[i], 0, 5, 0, 400);

        // rect       X                                 Y                  Width                        //Separador      Height
        rect(margen+10+i*((width-margen*2)/(setData.length)), height-margen-10, (width-margen)/(setData.length)-gap-10,(-height+margen*2)*normalize);
        text(str(int(setData[i])), 10, (-height+margen*2)*normalize+height-margen);
        
        
        
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
