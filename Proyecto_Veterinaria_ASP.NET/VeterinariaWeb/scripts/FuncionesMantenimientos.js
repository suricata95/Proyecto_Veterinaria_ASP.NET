function ConfirmarIngreso()
{
    var mensaje = confirm("¿Desea continuar con el ingreso?");
    if (mensaje) {
        alert("Datos ingresados correctamente");
    }
    else {
        alert("Se canceló el ingreso de datos");
    }
}