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
		require_once('Views/Publicaciones/bienvenido.php');
	}

	function register(){
		require_once('Views/Publicaciones/register.php');
	}

	function save(){
		if (!isset($_POST['estado'])) {
			$estado="of";
		}else{
			$estado="on";
		}
		$publicacion= new Publicaciones(null, $_POST['nombres'],$_POST['apellidos'],$estado);

		Publicaciones::save($publicacion);
		$this->show();
	}

	function show(){
		$listaPublicaciones=Publicaciones::all();

		require_once('Views/Publicaciones/show.php');
	}

	function updateshow(){
		$id=$_GET['idPublicaciones'];
		$publicacion=Publicaciones::searchById($id);
		require_once('Views/Publicaciones/updateshow.php');
	}

	function update(){
		$publicacion = new Publicaciones($_POST['id'],$_POST['nombres'],$_POST['apellidos'],$_POST['estado']);
		Publicaciones::update($publicacion);
		$this->show();
	}
	function delete(){
		$id=$_GET['id'];
		Publicaciones::delete($id);
		$this->show();
	}

	function search(){
		if (!empty($_POST['id'])) {
			$id=$_POST['id'];
			$publicacion=Publicaciones::searchById($id);
			$listaPublicaciones[]=$publicacion;
			//var_dump($id);
			//die();
			require_once('Views/Publicaciones/show.php');
		} else {
			$listaPublicaciones=Publicaciones::all();

			require_once('Views/Publicaciones/show.php');
		}
		
		
	}

	function error(){
		require_once('Views/Publicaciones/error.php');
	}

}

?>