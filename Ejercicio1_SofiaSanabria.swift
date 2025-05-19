/** Ejercicio 1: Declara dos variables numéricas (con el valor que desees), muestra por consola la suma, resta, multiplicación, división y módulo (resto de la división). */
//comentario
//comentario2
var numero1 = 16
var numero2 = 4

var suma = numero1 + numero2
var resta = numero1 - numero2
var multiplicacion = numero1 * numero2
var divicion = numero1 / numero2
var modulo = numero2 % numero1

print( "suma: ", suma)
print( "resta: ", resta)
print( "multiplicacion: ", multiplicacion)
print( "division: ", divicion)
print( "modulo ", modulo )

// suma:  20
// resta:  12
// multiplicacion:  64
// division:  4
// modulo  4

print("\n")

/** Ejercicio 2: Declara 2 variables numéricas (con el valor que desees), he indica cual es mayor de los dos. Si son iguales indicarlo también. Ve cambiando los valores para comprobar que funciona. */

var numero3 = 16
var numero4 = 25
var comparacion = 0

if numero3 > numero4 {
    comparacion = 1
} else if numero4 > numero3 {
    comparacion = 2
} else {
    comparacion = 0
}
    
switch comparacion {
    case 1:
        print("\(numero3) es mayor que \(numero4)" )
    case 2:
        print("\(numero4) es mayor que \(numero3)" )
    default:
        print("Son iguales")
}
// 25 es mayor que 16

print("\n")

/** Ejercicio 3: Declara  un  String  que  contenga  tu  nombre, después muestra un mensaje de bienvenida por consola. Por ejemplo: si introduzco “Fernando”, me aparece “Bienvenido Fernando”. */
var optionalName: String? = "Sofia Sanabria"
var greeting = "Bienvenida!"

// Tecnica binding: Si optionalName no es Nil, entonces asigna su valor a la constante name y ejecuta el bloque
if let name = optionalName {
    greeting = "Bienvenida, \(name)"
}
print(greeting)
// Prints Bienvenida, Sofia Sanabria

print("\n")

/** Ejercicio 4: Modifica la aplicación anterior, para que nos pida el nombre que queremos introducir. */

print("Porfavor, Introduce tu nombre: ")
let inputName = readLine() // Lee el nombre desde la consola

var mensaje = "Bienvenida!"

if let name = inputName, !name.isEmpty {
    mensaje = "Bienvenida, \(name)"
}
print(mensaje)
// Prints Bienvenida, Sofia Sanabria

print("\n")

/** Ejercicio 5: Lee  un  número  por  teclado  e  indica  si  es  divisible  entre  2  (resto = 0). Si no lo es, también debemos indicarlo. */

print("Ingrese un numero: ")

// let input = readLine() lee la entrada como String?
// let inputNum = Int(input) Intenta convertir a numero. Tambien es opcional (Int?)

if let input = readLine(), let inputNum = Int(input) {
    if inputNum % 2 == 0 {
        print ("\(inputNum) es divisible entre 2")
    } else {
        print ("\(inputNum) No es divisible entre 2")
    }
} else {
    print("El valor ingresado no es valido")
}
print("\n")

/** Ejercicio 6: Lee un número por teclado que pida el precio de un producto (puede tener decimales) y calcule el precio final con IVA. El IVA será una constante que será del 10% */

let IVA: Double = 0.10  // 10% de IVA

print("Ingrese el precio del producto:")

if let input = readLine(), let precio = Double(input) {
    let precioFinal: Double = precio + (precio * IVA)
    print("El precio final con IVA es: \(precioFinal)")
} else {
    print("Entrada invalida")
}
print("\n")


/** Ejercicio 7: Muestra los números del 1 al 100 (ambos incluidos) divisibles entre 2 y 3. */

var contador = 0

repeat {
    contador += 1
    
    if contador % 2 == 0 {
        print(contador, terminator: " ")
    } else if contador % 3 == 0 {
        print(contador, terminator: " ")
    } else {
        continue;
    }
    
} while contador <= 100

print("\n")

/** Ejercicio 8: Lee un número por teclado y comprueba que este número es mayor o igual que cero, si no lo es lo volverá a pedir (do while), después muestra ese número por consola. */

var numero: Int? = nil

print ("Ingrese un valor: ")

repeat {

    if let input = readLine(), let valor = Int(input) {
        if valor >= 0 {
            numero = valor
        } else {
            print ("Ingrese un numero mayor o igual a O: ")
        }
    } else {
        print("El valor ingresado no es valido")
    }

} while numero == nil

print("Numero Ingresado: \(numero!)")

print("\n")

/** Ejercicio 9: Escribe una aplicación con un String que contenga una contraseña cualquiera. Después se te pedirá  que  introduzcas  la  contraseña,  con  3  intentos.  Cuando  aciertes  ya  no  pedirá  más  la contraseña y mostrará un mensaje diciendo “Correcto!”. Piensa bien en la condición de salida (3 intentos y si acierta sale, aunque le queden intentos, si no acierta en los 3 intentos mostrar el mensaje “Fallaste jaja!!”).  */


let password = "SofiGould"
var intento = 0
var exito = false

while intento < 3 {
    print("Ingresa una contraseña: ")
    if let input = readLine() {
        if input == password {
            print("Correcto!")
            exito = true
            break
        } else {
            print("Contraseña incorrecta")
        }
    } else {
        print("Entrada invalida")
    }
    intento += 1
}

if !exito {
    print("Fallaste jaja!!")
}

 print ("\n")

/** Ejercicio10: Crea una aplicación que nos pida un día de la semana y que nos diga si es un día laboral o no (“De lunes a viernes consideramos días laborales”) */

print("Ingresa un dia de la semana: ")

if let input = readLine() {

    switch input {
    case "lunes", "martes", "miercoles", "jueves", "viernes":
        print("\(input) es un dia laboral")
    case "sabado", "domingo":
        print("\(input) es fin de semana.")
    default:
        print("Entrada invalida. Ingresa un dia valido")
    }
}
print("\n")
