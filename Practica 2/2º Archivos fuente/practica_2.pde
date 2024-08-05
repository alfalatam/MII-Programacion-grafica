int numFrames = 8;  // El número de frames
int currentFrame = 0; //frame actual
PImage[] images = new PImage[numFrames]; // conjunto de imágenes
PImage fondo;
float num=0;

void setup() {
  size(1024, 760);
  frameRate(12);

  // Cargo el fondo y lo adapto al tamaño del cuadro
  fondo= loadImage("fondo.png");
  fondo.resize(width,height);
  
  // cargo las imágenes del sprite
  images[0]  = loadImage("0001.png");
  images[1]  = loadImage("0002.png");
  images[2]  = loadImage("0003.png");
  images[3]  = loadImage("0004.png");
  images[4]  = loadImage("0005.png");
  images[5]  = loadImage("0006.png");
  images[6]  = loadImage("0007.png");
  images[7]  = loadImage("0008.png");

} 
 
void draw() { 
  //Dibujo primero el sprite del fondo
  background(fondo);

  // Voy dibujando actualizando y desplazando los frames para dar la sensación de movimiento
  image(images[currentFrame], num, height/3);
  //Actualizo la posición X(num) y currentFrame(Frame actual)
  num+=numFrames*2;
  currentFrame+=1;
  // Si llego al último frame que tengo vuelvo al primero haciendo un bucle
  if(currentFrame==numFrames){
    currentFrame=0;
  }
}
