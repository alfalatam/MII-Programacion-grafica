//Defino las variables que necesito usar
var cube = [];
var x=0;
var y=0;
var z=0;
var c=0;
var key;
var cursorX;
var cursorY;

//Creamos la escena
var scene = new THREE.Scene();
// Creo el cubo y su tamaño 
var geometry = new THREE.BoxGeometry( 1, 1, 1 );
// 
const pointer  = new THREE.Vector2();
// Para poder seleccionar los cubos seleccionados con el ratón
var raycaster = new THREE.Raycaster();

//Creamos la cámara
// Definiendo el campo de visión, el aspect ratio y lo cerca/lejos que se renderiza
var camera = new THREE.PerspectiveCamera( 90, window.innerWidth/window.innerHeight, 0.1, 1000 );
//Para que no se solapen movemos la cámara un poco
camera.position.z = 6;

//Defino el renderder para poder mostrar el cubo, hemos usado WEBGL
var renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.body.appendChild( renderer.domElement );
//Control de la camara
var control_camara = new THREE.OrbitControls(camera,renderer.domElement);

//Array con los colores del cubo
let material = [];
material.push(new THREE.MeshBasicMaterial( { color: 'white' }));
material.push(new THREE.MeshBasicMaterial( { color: 'red' }));
material.push(new THREE.MeshBasicMaterial( { color: 'yellow' }));
material.push(new THREE.MeshBasicMaterial( { color: 'green' }));
material.push(new THREE.MeshBasicMaterial( { color: 'blue' }));
material.push(new THREE.MeshBasicMaterial( { color: 'orange' }));


//Aqui creo los 27 cubos del cubo de rubik
for (let f = 0; f < 3; f++) {
    for (let i = 0; i < 9; i++) {
        //Asigno al cubo la posicion
        cube[c] = new THREE.Mesh(geometry, material);
        cube[c].position.x = (x*1.05-1);
        cube[c].position.y = (y*1.05-1);
        cube[c].position.z = (f*1.05-1);
        x+=1;
        //Si llego a estos valores tengo que saltar a otra fila y reinicio
        if(x==3 || x ==6){
            x=0;
            y+=1;
        }
        scene.add(cube[c]);
        c+=1;
    }
    // al mover la z reinicio las variables
    x=0;
    y=0;
}

// Para mostrar la posición del ratón
document.onmousemove = function(e){
    cursorX = e.pageX;
    cursorY = e.pageY;
}


//Guardo la ultima tecla pulsada para saber el movimiento a realizar
document.onkeydown = function (e) {
            key=e.key
            };


            
const onMouseMove = (event) => {

        // Calculo la posición del ratón
        pointer.x = (event.clientX / window.innerWidth) * 2 - 1;
        pointer.y = -(event.clientY / window.innerHeight) * 2 + 1;
    
        //Aqui defino una variable con los objetos que intersecciona con mi ratón al hacer click
        raycaster.setFromCamera(pointer, camera);
        var intersects = raycaster.intersectObjects(scene.children);

        //Recorro los cubos y si están en la intersección definida anteriormente los muevo si corresponde
        for (const element of cube) {
            if(element.position.x.toFixed(2) == (intersects[0].object.position.x).toFixed(2) ){
                //Ahora compruba la tecla del movimiento y si corresponde, llamo a la funcion para rotar
                //El angulo a rotar es negativo o positivo para que gire en el lado correcto.
                if(key =='ArrowDown'){
                    var puntoRotacion = new THREE.Vector3(0, 0.05, 0.05);
                    var axis = new THREE.Vector3(1, 0, 0).normalize();
                    rotateAroundPoint(element,puntoRotacion,axis,Math.PI/2)
                    }
                
                if(key =='ArrowUp'){
                    var puntoRotacion = new THREE.Vector3(0, 0.05, 0.05);
                    var axis = new THREE.Vector3(1, 0, 0).normalize();
                    rotateAroundPoint(element,puntoRotacion,axis,Math.PI/-2)
                    }
            
            }
            // Si el movimiento es vertical
            if(element.position.y.toFixed(2) == (intersects[0].object.position.y).toFixed(2)){
                if(key =='ArrowLeft'){
                    var puntoRotacion = new THREE.Vector3(0.05, 0, 0.05);
                    var axis = new THREE.Vector3(0, 1, 0).normalize();
                    rotateAroundPoint(element,puntoRotacion,axis,Math.PI/-2);
                    }
                if(key =='ArrowRight'){
                    var puntoRotacion = new THREE.Vector3(0.05, 1.1, 0.05);
                    var axis = new THREE.Vector3(0, 1, 0).normalize();
                    rotateAroundPoint(element,puntoRotacion,axis,Math.PI/2);
                    }  
                }
                
            }
            //Dejo la variable tecla vacia, si quisiera mover varias sin pulsar varias veces, comentaría la línea siguiente.
            key='';      
        } 

    // llamo al evento al clickar
    window.addEventListener('mousedown', onMouseMove);
    



//Para conseguir hacer funcionar la rotación en el que consiste el siguiente método he usado las siguientes fuentes de informacion:
    // Para entender  el funcionamiento del quaternion 
        //https://youtu.be/zjMuIxRvygQ
    // Como referencia para saber como se mueve translada y rota un objeto en three.js
        // https://stackoverflow.com/questions/42812861/three-js-pivot-point
    // Para entender el funcionamiento de Matrix4
        // https://threejs.org/docs/#api/en/math/Matrix4


// element es el cubo a rotar
// point es el punto de rotacion
function rotateAroundPoint(element, point, axis, angle) {
    // Se establece esta matriz como una m de transformacion:
    var r =  new THREE.Matrix4().makeTranslation(point.x,point.y,point.z);
    //Defino un nuevo quaternion para la rotacion
    //roto con respecto a axis y en un angulo de x radianes 
    var q = new THREE.Quaternion();
    q.setFromAxisAngle(axis, angle);
    // Creo una copia del punto y lo invierto
    var copy = new THREE.Vector3().copy(point);
    var n= copy.negate();
    //Creo una matrix de 4x4 como matriz de transformacion con los valores de la variable anterior
    var uMatrix = new THREE.Matrix4().makeTranslation(n.x,n.y,n.z);
    //Establece el componente de rotación de esta matriz en la rotación especificada por el quaterion definido anteriormente
    var matrix2 = new THREE.Matrix4().makeRotationFromQuaternion(q);
    var matrix3 = matrix2.multiply(uMatrix);
    r.multiply(matrix3);
    //Multiplico este cubo por la matriz, y divido por la perspectiva.
    element.applyMatrix4(r);


}


var animate = function () {
    //Actualizamos la cámara todo el rato antes de renderizar
    control_camara.update();
    requestAnimationFrame( animate );
    //renderizo la escena
    renderer.render( scene, camera );  
    //Actulizo la información del cursor
    document.getElementById("info").innerHTML = "Cursor en: " + cursorX + ", " + cursorY 

};

animate();