//
//  main.swift
//  FuncionNextBig
//
//  Created by Bootcamp on 2025-05-19.
//

import Foundation

func nextBig(num: Int) -> Int? {
    
    // Convertir el número a una lista de dígitos.
    let digitos = Array(String(num))

    // Ordenar el array
    let ordenado = digitos.sorted(by: >)
    
    // Si el numero ordenado descendente es igual a los digitos ingresados
    if ordenado == digitos {
        return nil // Es el mayor posible
    }
    
    // Convertir nuevamente a entero.
    return Int(String(ordenado))
}

func main () {
    
    let numero = 7609
    let resultado = nextBig(num: numero)
    print(resultado ?? "nil")
    print("\n")

}

main()

