<?php ;
$con = new mysqli('localhost', 'root', '');
if($con){
echo 'conectado mysql';

}else{
echo 'no conectado';
}
echo '<br>';
$conn=$con->query('CREATE DATABASE practica');
if($conn){
echo 'creada';
 include_once 'vacantes.php';
}else{
  echo 'ya existe la base de datos';
  include_once 'vacantes.php';
}
echo '<br>';
mysqli_close($con); 



?>