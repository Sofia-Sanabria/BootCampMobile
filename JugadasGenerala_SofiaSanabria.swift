//
//  GitHub
//  Ejercicio realizado por Sofia Sanabria
//
//  Jugadas Generala
//
//  Created by Bootcamp on 2025-05-20.
//

import Foundation

func jugadasGenerala () -> String{
    
    var dados: [Int] = []
    
    // Agrega 5 valores al array de dados
    for _ in 1...5{
        dados.append( Int.random(in: 1...6) ) // Agrega valores entre 1 y 6
    }
    
    // Contar cuantas veces aparece cada numero
    var contador = [Int](repeating: 0, count: 7) // Arreglo de 7 elementos con valores inicialmente cero(0)
    for dado in dados {
        contador[dado] += 1
    }
    
    var repeticiones: [Int] = []
    
    // Contar las repeticiones de un dado
    for i in 1...6 {
        if contador[i] > 1 {
            repeticiones.append(contador[i])
        }
    }
    
    // Arreglo de dados ordenado
    let ordenado = dados.sorted()

    // Secuencia de posibles escaleras
    let secuenciaA = [1, 2, 3, 4, 5]
    let secuenciaB = [2, 3, 4, 5, 6]
    let secuenciaC = [3, 4, 5, 6, 1]
    
    // Convertir un arreglo a String y separar por coma(,)
    let resultado = dados.map { String($0) }.joined(separator: ", ")
        
    var jugada = "NADA"
    // Si se repite 5 veces un mismo dado
    if repeticiones == [5] {
        jugada = "GENERALA"
    // Si se repite 4 veces un mismo dado
    } else if repeticiones == [4] {
        jugada = "POKER"
    // Si se repite 2 y 3 veces dos dado
    } else if repeticiones == [2, 3] {
        jugada = "FULL"
    // Comparacion con los arreglos definidos como escaleras. Set para comparar los elementos del arreglo, sin importar el orden
    } else if ordenado == secuenciaA || ordenado == secuenciaB || Set(ordenado) == Set(secuenciaC) {
        jugada = "ESCALERA"
    }
    
    return "Dados: \(resultado) -> Jugada: \(jugada)"
}
        

let jugadas = jugadasGenerala()
print(jugadas)
print("\n")

