//
//  main.swift
//  Ejercitario2SwiftSofi
//
//  Created by Bootcamp on 2025-05-13.
//

import Foundation

/** Ejercicio 1: Cargar un array de manera aleatoria con 10 números enteros del -5 al 5. Imprimirlo en  pantalla y computar cuál es el mayor elemento del vector. */

var array1: [Int] = []

// "_" sirve para ignorar el indice
// "1...10" genera 10 numeros aleatorios
for _ in 1...10 {
    let aleatorio = Int.random(in: -5...5) // Entre -5 y 5
    array1.append(aleatorio) // Agrega al array
}

print("Array: \(array1)")

if let mayor = array1.max() {
    print ("El mayor elemento es: \(mayor)")
}

print("\n")

/** Ejercicio 2: Cargar  un  array  de  manera  aleatoria  con  100  números enteros del -30 al 30. Imprimirlo en pantalla y computar cuál es el elemento que más veces se repite, y cuáles son los números  que no están presentes (si es que hay alguno).  */

var array2: [Int] = []

for _ in 1...100 {
    let random = Int.random(in: -30...30) // Entre -30 y 30
    array2.append(random)
}

// Crear un diccinario
var diccionario: [Int: Int] = [:]

// Contar ocurrencias de elementos
for array in array2 {
    diccionario[array, default: 0] += 1
}

print("Array: \(array2)")

// ".max(by:) Busca el elemento (clave, valor) del diccionario donde valor sea mayor"
if let (numero, cantidad) = diccionario.max(by: { $0.value < $1.value}) {
    print("El numero que mas se repite es \(numero), aparece \(cantidad) veces." )
}

// Crear un conjunto con todos los elementos posibles
let elementos = Set(-30...30)
// Crear un conjunto con los elementos del arreglo
let presentes = Set(array2)
// Encuentre los elementos faltantes
let ausentes = elementos.subtracting(presentes)

print("Elementos ausentes: \(ausentes)")

print("\n")

/** Ejercicio 3: Hacer una función que, dada una palabra (String) o frase, diga si la misma es palíndromo o  no. Una palabra/frase palíndromo es aquella que se lee igual tanto de atrás para adelante,  como de adelante  para  atrás.  Ejemplos  de  palíndromos:  "MADAM",  "RACECAR",  "AMORE,   ROMA", "BORROW OR ROB", "WAS IT A CAR OR A CAT I SAW?" */

var palabra: String = "MADAM"

let palindromo = String(palabra.reversed())

if palindromo == palabra {
    print("La palabra \(palabra) es palindromo")
} else {
    print("La palabra \(palabra) No es palindromo")
}
print("\n")

/** Dada una cadena de caracteres (String) de longitud desconocida que tiene solamente dígitos,
 crear un array de N elementos (donde N es el tamaño de la cadena) que tenga cada uno de los
 valores numéricos de los dígitos. */

let cadena = "1234567A90"

var digitos: [Int] = []

for caracter in cadena {
    if let numero = Int(String(caracter)) {
        digitos.append(numero)
    } else {
        print("Caracter no valido: \(caracter)")
    }
}

print(digitos)




