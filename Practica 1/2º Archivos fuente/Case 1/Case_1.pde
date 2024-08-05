class BarChart{
  
  // Defino un color
  color color_barra;

  int margen= 40;
  float[] setData;
  
  BarChart(){
    color_barra = color(200,0,0);
  }
  void setData(float[]x){
    x = sort(x);
    setData= x;
    
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
      
      
      float max = max(setData);
      float min = min(setData);
      for (int i = 0; i < setData.length; i++) {
         float normalize= (setData[i]-min)/(max-min);
        //float h = map(setData[i], 0, 5, 0, 400);

        // rect       X                                 Y                  Width        //Separador      Height
        rect(margen+10+i*((width-margen*2)/(setData.length)), height-margen-10, (width-margen)/(setData.length)-30,(-height+margen*2)*normalize);
        text(str(int(setData[i])), 10, (-height+margen*2)*normalize+height-margen);
        textSize(20);
  }

 }

}
