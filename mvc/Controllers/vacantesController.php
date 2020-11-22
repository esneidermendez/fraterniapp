<?php 
/**
* 
*/
class UsuarioController
{
	
	function __construct()
	{
		
	}

	function index(){
		require_once('Views/Vacantes/bienvenido.php');
	}

	function register(){
		require_once('Views/Vacantes/register.php');
	}

	function save(){
		if (!isset($_POST['estado'])) {
			$estado="of";
		}else{
			$estado="on";
		}
		$vacante= new Vacante(null, $_POST['nombres'],$_POST['apellidos'],$estado);

		Vacante::save($vacante);
		$this->show();
	}

	function show(){
		$listaVacantes=Vacante::all();

		require_once('Views/Vacantes/show.php');
	}

	function updateshow(){
		$id=$_GET['idVacante'];
		$vacante=Vacante::searchById($id);
		require_once('Views/Vacantes/updateshow.php');
	}

	function update(){
		$vacante = new Vacante($_POST['id'],$_POST['nombres'],$_POST['apellidos'],$_POST['estado']);
		Vacante::update($vacante);
		$this->show();
	}
	function delete(){
		$id=$_GET['id'];
		Vacante::delete($id);
		$this->show();
	}

	function search(){
		if (!empty($_POST['id'])) {
			$id=$_POST['id'];
			$vacante=Vacante::searchById($id);
			$listaVacantes[]=$vacante;
			//var_dump($id);
			//die();
			require_once('Views/Vacantes/show.php');
		} else {
			$listaVacantes=Vacante::all();

			require_once('Views/Vacantes/show.php');
		}
		
		
	}

	function error(){
		require_once('Views/Vacantes/error.php');
	}

}

?>