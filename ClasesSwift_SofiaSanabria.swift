//
//  Sofia Sanabria
//  Clases_Swift_Reloj
//
//  Created by Bootcamp on 2025-05-16.
//

import Foundation

class Reloj {
    private var hora: Int
    private var minutos: Int
    private var segundos: Int
    
    // Constructor por defecto (12:00:00)
    init() {
        self.hora = 12
        self.minutos = 00
        self.segundos = 00
    }
    // Constructor con tres parametros
    init(hora:Int, minutos:Int, segundos:Int) {
        self.hora = hora % 24
        self.minutos = minutos % 60
        self.segundos = segundos % 3600
    }
    // Constructor con el tiempo en segundos desde la media noche
    init(MediaNocheSegundos: Int) {
        self.hora = 00
        self.minutos = 00
        self.segundos = 00
        setReloj(MediaNocheSegundos)
    }
    
    // Metodo que contiene el valor de la media noche en segundo y lo convierte a hora, minuto y segundo
    func setReloj(_ timeSegundos: Int) {
        let segundos = timeSegundos % 86400
        self.hora = segundos / 3600
        self.minutos = (segundos % 3600) / 60
        self.segundos = segundos % 60
        
    }
    
    func getHoras() -> Int {
        return self.hora
    }
    func getMinutos() -> Int {
        return self.minutos
    }
    func getSegundos() -> Int {
        return self.segundos
    }
    func setHoras(_ hora: Int) {
        self.hora = hora
    }
    func setMinutos(_ minutos: Int) {
        self.minutos = minutos
    }
    func setSegundos(_ segundos: Int) {
        self.segundos = segundos
    }
    
    // Metodo de incremento de segundos
    func tick() {
        self.segundos += 1
        if self.segundos == 60 {
            self.segundos = 0
            self.minutos += 1
            if self.minutos == 60 {
                self.minutos = 0
                self.hora += 1
                if self.hora == 24 {
                    self.hora = 0
                }
            }
        }
    }
    
    // se tiliza '_' para no llamar al argumento
    func addReloj(_ agregarHora: Reloj) {
        
        // Convertir ambos tiempos en segundos
        let segActual = self.hora * 3600 + self.minutos * 60 + self.segundos
        let segOtro = agregarHora.hora * 3600 + agregarHora.minutos * 60 + agregarHora.segundos
        
        // Agrega las horas y mantiene el formato
        let sumaSegundos = (segActual + segOtro) % (24 * 60 * 60)
        
        // Actualiza el tiempo actual
        self.setReloj(sumaSegundos)

    }
    
    func toString() -> String {
        // Validacion de rango de hora, minutos y segundos
        if !(0...23).contains(hora) || !(0...59).contains(minutos) || !(0...59).contains(segundos) {
            return "Valores Invalidos"
        }
        // Impresion en formato [HH:MM:SS]
        return String(format: "[%02d:%02d:%02d]", hora, minutos, segundos)
    }
    
    // Metodo de decremento de segundos
    func tickDecrement() {
        self.segundos -= 1
        if self.segundos < 0 {
            self.segundos = 59
            self.minutos -= 1
            
            if self.minutos < 0 {
                self.minutos = 59
                self.hora -= 1
                
                if self.hora < 0 {
                    self.hora = 23
                }
            }
        }
    }

    
    func restaReloj(_ parametro: Reloj) {
        
        // Convertir ambos tiempos en segundos
        let segActual = self.hora * 3600 + self.minutos * 60 + self.segundos
        let segOtro = parametro.hora * 3600 + parametro.minutos * 60 + parametro.segundos
        
        // Calcular la diferencia
        var diferencia = segActual - segOtro
        
        // Si la diferencia es negativa, sumar 24hr en segundos para dar vuelta al reloj
        if diferencia < 0 {
            diferencia += 24 * 3600
        }
        
        // Convertir la diferencia a hora, minutos y segundos
        self.setReloj(diferencia)
    }
}

class DemoReloj {
    static func main() {
        
        print("Ingrese los Segundos desde la media noche")
        
        // Lee entrada del usuario, convierte a entero, valida rango de segundo, si algo no se cumple, retorna
        guard let input = readLine(), let segundos = Int(input), segundos >= 0 && segundos < 86400 else {
            print("Entrada invalida.")
            return
        }
        
        // Crear la instancia del primer reloj
        let miReloj = Reloj(MediaNocheSegundos: segundos)
        print("Hora inicial: \(miReloj.toString())\n")
        
        print("Horas: \(miReloj.getHoras())")
        print("Minutos: \(miReloj.getMinutos())")
        print("Segundos: \(miReloj.getSegundos())")
        print("\n")
        
        // Imprime 10 veces la hora al incrementar los segundos
        var i = 0
        print("-- Hora incrementando tick --")
        while i <= 10 {
            miReloj.tick()
            print("Hora tick \(i): \(miReloj.toString())")
            i = i + 1
        }
        print("\n")
        
        // Imprime 10 veces la hora al decrementar los segundos
        var j = 0
        print("-- Hora decrementando tick --")
        while j <= 10 {
            miReloj.tickDecrement()
            print("Hora tick \(j): \(miReloj.toString())")
            j = j + 1
        }
        print("\n")
        
        // Crear otra instancia de Reloj para agregarle tiempo
        let reloj1 = Reloj(hora: 12, minutos: 45, segundos: 05)
        
        miReloj.addReloj(reloj1)
        
        print("La hora actual agregando \(reloj1.toString()) es \(miReloj.toString())")
        
        // Crear otra instancia de Reloj para restarle tiempo
        let reloj2 = Reloj(hora: 04, minutos: 16, segundos: 11)
        
        miReloj.restaReloj(reloj2)
        
        print("La hora actual restando \(reloj2.toString()) es \(miReloj.toString()) ")

    }
}

DemoReloj.main()

