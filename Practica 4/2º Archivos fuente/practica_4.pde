import peasy.*;
PeasyCam cam;

int dim= 3;
int size=50;
int x =0;
void setup(){
  // Defino tamaño y que es un objeto 3D
  size(600,600,P3D);
  //Posicion inicial del objeto
  cam = new PeasyCam(this,400); 

}

void draw(){
  //Fondo
  background(50);
  //Translado para que el cubo este centrado
  translate(-size,-size,0);
  //Contorno de las cubos
  strokeWeight(4);
  //Color
  fill(#FF0000);
//Con este for creo las 3 filas moviendo el eje Z
for(int j =0; j<dim; j++){
 
 //La matriz por cada movimiento del eje la "saco"(POP) para que estén alineadas los cubos
 pushMatrix();
 //Creo 9 cubos por fila sin mover el eje Z
  for(int i =0; i < 9; i++){
  // Si es 3 o 6, que es lo mismo que si he terminado una fila de 3
  if(i == 3 || i==6){
  //Me muevo a la derecha lo equivalente a las 3 cajas que he creado
    translate(-size*3,size,0);
  }
  // creo una caja de tamaño un poco menor al tamaño para dejar un hueco
      box(size-5);
  // AL crear la caja me muevo a la derecha para hacer la siguiente
      translate(size,0,0);
  }
  popMatrix();
  // Cada 9 cajas, me muevo en el eje Z y así 3 veces
  translate(0,0,size);
}




}
