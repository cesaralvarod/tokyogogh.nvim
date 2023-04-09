<?php

// Comentario de una línea

/*
Comentario
de
varias
líneas
*/

// Variables
$miVariable = "Hola mundo";
$miNumero = 42;
$miBooleano = true;
$miArray = array("uno", "dos", "tres");

// Constantes
define("MI_CONSTANTE", "Valor constante");

// Estructuras de control
if ($miNumero == 42) {
    // Código si la condición es verdadera
} elseif ($miNumero == 43) {
    // Código si la primera condición es falsa y la segunda es verdadera
} else {
    // Código si ambas condiciones son falsas
}

switch ($miVariable) {
    case "Hola":
        // Código si la variable es igual a "Hola"
        break;
    case "Mundo":
        // Código si la variable es igual a "Mundo"
        break;
    default:
        // Código si la variable no coincide con ninguno de los casos anteriores
}

for ($i = 0; $i < 10; $i++) {
    // Código que se ejecuta en cada iteración del bucle
}

foreach ($miArray as $valor) {
    // Código que se ejecuta para cada valor en el array
}

while ($miNumero < 50) {
    // Código que se ejecuta mientras se cumpla la condición
    $miNumero++;
}

do {
    // Código que se ejecuta al menos una vez, luego se verifica la condición
} while ($miNumero < 60);

// Funciones
function miFuncion($parametro1, $parametro2 = "Valor por defecto")
{
    // Código de la función
    return $resultado;
}

// Clases
class MiClase
{
    // Propiedades de la clase
    public $miPropiedad;

    // Constructor de la clase
    public function __construct($miParametro)
    {
        // Código del constructor
        $this->miPropiedad = $miParametro;
    }

    // Métodos de la clase
    public function miMetodo()
    {
        // Código del método
    }
}

// Namespace

namespace MiNamespace;

// Use
use MiNamespace\MiClase;

// Traits
trait MiTrait
{
    // Código del trait
}

class MiClase
{
    use MiTrait;
}

// Try / Catch
try {
    // Código que puede lanzar una excepción
} catch (Exception $e) {
    // Código que maneja la excepción
}

// Herencia de clases
class MiClaseHija extends MiClasePadre
{
    // Código de la clase hija
}

// Métodos mágicos
class MiClase
{
    public function __get($propiedad)
    {
        // Código del método mágico
    }

    public function __call($metodo, $argumentos)
    {
        // Código del método mágico
    }
}

// Operador ternario
$miVariable = ($condicion) ? $valorSiCondicionEsVerdadera : $valorSiCondicionEsFalsa;

// Listado de variables
list($miVariable1, $miVariable2) = array($valor1, $valor2);
