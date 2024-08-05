BarChart ventas;
void setup() {
size(1024,768);
ventas = new BarChart();
ventas.setData(new float[] { 17, 50.5, 30, 40, 10, 33.24, 90.12 } );
//case 2
ventas.setMinMaxValor(0, 100);
//Case 3
ventas.setBarGap(30);


}
void draw(){
  ventas.draw();
}
