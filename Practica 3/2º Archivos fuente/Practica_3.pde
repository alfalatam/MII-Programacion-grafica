// Variables inicializadas
float angulo1,angulo2;
PImage fondo,tierra,luna,sol;
int sunSize,eSize,moonSize;
int x1,x2,y1,y2,r;
//
void setup(){
  size(1280,720);
  angulo1=0.0;
  angulo2=0.0;
  // Redimensiono el fondo
  fondo = loadImage("stars.png");
  fondo.resize(width,height);

  //Cargo las imagenes y las redimensiono para que tenga un tamaño acorde
  tierra = loadImage("earth.png");
  eSize=height/15;
  tierra.resize(eSize,eSize);

  sol = loadImage("sun.png");
  sunSize=height/8;
  sol.resize(sunSize,sunSize);
  
  luna = loadImage("moon.png");
  moonSize=height/30;
  luna.resize(moonSize,moonSize);
  
}


void draw(){
  //cargo el fondo y pongo el sol en el medio de la imagen
  background(fondo);
  image(sol,(width-sunSize)/2,(height-sunSize)/2);
  
  // ecuaciones paramétricas para el ángulo 
  x1 = width/2 + int(300.0 * cos(radians(angulo1)));
  y1 = height/2 + int(300.0 * sin(radians(angulo1)));

 //Antes y después de las transformaciones llamo a push y pop matrix para restablecerlos cambios
 
  pushMatrix();
  //translado la tierra y la roto para que de vueltas
    translate(x1, y1);
    rotate(radians(r)); // rotación de 45 grados
    //incremento
    r +=1;
    image(tierra,-eSize/2,-eSize/2);
  popMatrix();
  
  angulo1 +=1;

//Aqui hago lo mismo pero para la luna con un movimiento circular
  pushMatrix();
    translate(x1, y1);
     // la función varía ya que ahora es un movimiento circular    
     x2 =  int(50*cos(angulo2));
     y2 =  int(50*sin(angulo2));
     image(luna,x2-moonSize/2,y2-moonSize/2);
  popMatrix();
  angulo2 +=0.1;
}
