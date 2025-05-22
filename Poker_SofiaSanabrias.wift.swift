//
//  GitHub
//  Ejercicio realizado por Sofia Sanabria
//
//  Poker
//
//  Created by Bootcamp on 2025-05-21.
//

import Foundation

class Carta {
    
    let valor: String
    let palo: String
    
    // Constructor de Carta
    init(_ representa: String) {
        // La descripcion es como "AS", "9D", "TH", etc.
        self.valor = String(representa.prefix(1)) // Prefijo(Primer caracter)
        self.palo = String(representa.suffix(1)) // Sufijo(Segundo caracter)
    }
    
    // Convierte el valor textual a un numero entero util para comparaciones
    func valorNumerico() -> Int {
        switch valor {
        case "A": return 14 // A puede ser 14 o 1
        case "K": return 13
        case "Q": return 12
        case "J": return 11
        case "T": return 10
        default:
            return Int(valor) ?? 0
        }
    }
//    func poderPalo() -> Int {
//        switch palo {
//        case "S": return 4
//        case "H": return 3
//        case "D": return 2
//        case "C": return 1
//        default:  return 0
//        }
//    }
}

// Resultado de una mano de jugador
struct Resultado {
    let jugador: String          // Nombre del jugador
    let tipoJugada: String      // Nombre de la jugada
    let ranking: Int             // Ranking de la jugada
    let valores: [Int]           // Lista de valores de las cartas
}

// Analiza las cartas de un jugador y devuelve el resultado
func analizarMano(jugador: String, cartas: [Carta]) -> Resultado {
    // Diccionario para contar los valores de cartas de cada jugador
    // [clave: valor]
    // clave, valor numerico de la carta
    // valor, veces que aparece ese numero en la mano
    var conteoValores: [Int: Int] = [:]
    var conteoPalos: [String: Int] = [:]
    var valores: [Int] = []
    
    // Guarda los valores de las cartas en un arreglo
    for carta in cartas {
        let val = carta.valorNumerico()
        valores.append(val)
        conteoValores[val, default: 0] += 1 // Cuantas veces aparece cada valor de carta
        conteoPalos[carta.palo, default: 0] += 1 // Si no existe valor, asumir que es 0(cero)
    }
    
    valores.sort(by: >) // Ordena de mayor a menor
    
    // Es Color cuando hay 5 cartas con el mismo palo
    let esColor = conteoPalos.values.contains(5)
    // Es Escalera cuando hay 5 cartas con valores concecutivos
    let esEscalera = (valores.max()! - valores.min()! == 4) && Set(valores).count == 5
    // Comparacion de valores no necesariamente ordenados, 14 en vez de 1 es escalera tambien
    let escaleraBaja = Set(valores) == Set([14, 2, 3, 4, 5])
    
    // Inicializacion
    var tipo = ""
    var ranking = 0
    
    // Condiciones para saber el tipo de jugada y medir el ranking
    if (esEscalera || escaleraBaja) && esColor {
        tipo = "Escalera de Color"; ranking = 9
    } else if conteoValores.values.contains(4) {
        tipo = "Poker"; ranking = 8
    } else if conteoValores.values.contains(3) && conteoValores.values.contains(2) {
        tipo = "Full"; ranking = 7
    } else if esColor {
        tipo = "Color"; ranking = 6
    } else if  esEscalera || escaleraBaja {
        tipo = "Escalera"; ranking = 5
    } else if conteoValores.values.contains(3) {
        tipo = "Trio"; ranking = 4
    // Verifica si la mano contiene exactamente dos pares distintos
    } else if conteoValores.values.filter({$0 == 2}).count == 2 {
        tipo = "Doble par"; ranking = 3
    } else if conteoValores.values.contains(2) {
        tipo = "Par"; ranking = 2
    } else {
        tipo = "Carta alta"; ranking = 1
    }
    
    return Resultado (
        jugador: jugador,
        tipoJugada: tipo,
        ranking: ranking,
        valores: valores
    )
    
}

// Compara dos resultados y determina el ganador sin usar palos
func determinarGanador(j1: Resultado, j2: Resultado) {
    print("\(j1.jugador): \(j1.tipoJugada)")
    print("\(j2.jugador): \(j2.tipoJugada)")

    if j1.ranking > j2.ranking {
        print("Gana \(j1.jugador) con \(j1.tipoJugada)!")
    } else if j2.ranking > j1.ranking {
        print("Gana \(j2.jugador) con \(j2.tipoJugada)!")
    } else {
        // Mismo tipo de jugada, comparar valores
        let n = min(j1.valores.count, j2.valores.count)
        var ganadorEncontrado = false
        
        for i in 0..<n {
            if j1.valores[i] > j2.valores[i] {
                print("Gana \(j1.jugador) por tener cartas mas altas!")
                ganadorEncontrado = true
                break
            } else if j2.valores[i] > j1.valores[i] {
                print("Gana \(j2.jugador) por tener cartas mas altas!")
                ganadorEncontrado = true
                break
            }
        }
        
        // Si termina el bucle sin diferencias, es un empate
        if !ganadorEncontrado {
            print("Empate!")
        }
    }
}


// -------- Ejemplo de uso ---------

// Jugada Poker
let cartasJugador1 = [
    Carta("5H"), Carta("KS"), Carta("KC"), Carta("KD"), Carta("3H")
]

// Jugada Escalera de color baja (A, 2, 3, 4, 5)
let cartasJugador2 = [
    Carta("AS"), Carta("2S"), Carta("3S"), Carta("4S"), Carta("5S")
]

let resultado1 = analizarMano(jugador: "Sofi", cartas: cartasJugador1)
let resultado2 = analizarMano(jugador: "Xime", cartas: cartasJugador2)

determinarGanador(j1: resultado1, j2: resultado2)

//let manoEscalera = [
//    Carta("2S"),
//    Carta("3S"),
//    Carta("4S"),
//    Carta("5S"),
//    Carta("6S")
//]
//
//print("\(manoEscalera)")
//
//let manoPoker = [
//    Carta("AS"),
//    Carta("AD"),
//    Carta("AH"),
//    Carta("AC"),
//    Carta("6S")
//]
//
//print("\(manoPoker)")
//
//let manoColor = [
//    Carta("AD"),
//    Carta("3D"),
//    Carta("TD"),
//    Carta("8D"),
//    Carta("KD")
//]
//
//print("\(manoColor)")
