class BarChart{
  
  // Defino un color
  color color_barra;
  int margen,gap;
  float[] setData;
  String[] labels;
  int max_value,min_value;
  int bgColor,barColor,axiColor,labelColor;
  
  //Constructor
  BarChart(){
    // Defino unos valores si no le paso ninguno
    color_barra = color(200,0,0);
    margen=40;
    bgColor=0;
    barColor=255;
    axiColor=0;
    labelColor=255;
    gap=30;
    max_value=0;
    min_value=0;

  }
  //Colorear barra
   boolean RatonEnBarra(float x1,float y2,float  w,float h){
    boolean resultado=false;
    // Compruebo para cada barra si se encuentra el ratón dentro de los eyes X e Y
     for (int i = 0; i < setData.length; i++) {   
      if(mouseX >x1 && mouseX < w+x1){
        if(mouseY >(h+y2) && mouseY < (y2)){
            resultado=true;
            
        
      }
    }
        }
    return resultado;
    
  }
  // Aquí sobreesccribo los colores con los que le paso
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
  // Aquí añado los valores de setData
  void setData(float[]x){
    x = sort(x);
    setData= x;
  }
  //Aqui añado la separación
  void setBarGap(int g){
    gap=g;
  }
  //Aqui defino los colores
  void setBarLabels(String [] l){
    labels=l;
  }
 //Aqui defino el valor máximo y mínimo para los ejes y la normalización 
 void setMinMaxValor(int min,int max){
   max_value=max;
   min_value=min;
  }
  

  void draw(){
      // Color del fondo
      background(bgColor);
      // Color de contorno de la linea
      stroke(axiColor);
      // ancho de la linea
      strokeWeight(4);
      //Dibujo los axis
      line(margen,margen,margen,height-margen);
      line(margen,height-margen,width-margen,height-margen);
      //
      stroke(barColor);
      //Tamaño de la letra y el margen de separación
      textSize(20);
      text(str(max_value),5,margen+10);
      text(str(min_value),10,height-margen);
      
      // Recorro los valores de Data 
      for (int i = 0; i < setData.length; i++) {
         // Formula para normalizar los valores   
        float normalize= (setData[i]-min_value)/(max_value-min_value);
        // Aqui defino los valores para definir las barras(ancho y alto)
        float x1=margen+10+i*((width-margen*2)/(setData.length));
        float y2=height-margen-10;
        float w=(width-margen)/(setData.length)-gap-10;
        float h=(-height+margen*2)*normalize;
     
       //Compruebo si en esos valores está el ratón para colorear la barra
       if(RatonEnBarra(x1, y2, w,h)){
        //Si está en la barra pone encima el valor decimal de la barra
        text((str(setData[i])), x1+(w/2)-margen/2, h+y2-10);
        //Color del coloreado si está el ratón encima
        fill(200,0,0);
      } else{
          fill(barColor);

        }
        rect(x1, y2, w,h);
        // Dibuja los números en la barra
        text(str(int(setData[i])), 10, (-height+margen*2)*normalize+height-margen);
        // Color de las etiquetas
        fill(labelColor);
        text((labels[i]), x1+(w/2)-margen/2, height-margen/2);
        fill(barColor);

  }
     
 }

}
