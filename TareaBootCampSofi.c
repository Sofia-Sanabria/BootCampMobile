//
// GitHub
// Ejercicio realizado por Sofia Sanabria
//
// Ejercicio Vacas y Toros
//
// Created by Bootcamp on 2025-05-12.
//


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define TAM 4

// Genera un numero de cuatro digitos
void adivinarNumero(char secreto[]) {
    int usado[10] = {0}; // Registra los numero que ya se usaron
    int i = 0;
    while (i < TAM) {
        int dig = rand() % 10; // Genera digitos aleatorios del 0 al 9
        if(i == 0 && dig == 0) continue; // No empezar con 0
        if(!usado[dig]) {
            secreto[i++] = dig + '0'; // Conversion de int a char
            usado[dig] = 1; // Marca el digito como usado
        }
    }
    secreto[TAM] = '\0'; //Agrega un caracter nulo para que el string sea valido

}

// secreto[] e intento[] son las cadenas que vamos a comparar, *vacas y *toros son punteros para contar
void contarVacasToros(const char secreto[], const char intento[], int *vacas, int *toros) {
    *vacas = 0;
    *toros = 0;

    for( int i = 0; i < TAM; i++ ) {
        if(intento[i] == secreto[i]) { // Si los numeros coinciden y estan en la misma posicion
            (*toros)++; // Cuenta toros
        } else {
            for(int j = 0; j < TAM; j++) { 
                if(intento[i] == secreto[j] && i != j) { // si los numero coinciden pero no en la misma posicion
                    (*vacas)++; // Cuenta vacas
                    break;
                }
            }
        }
    }
}

int main() {

    srand(time(NULL)); // Inicializa numeros aleatorios, permite generar numeros diferentes
    char secreto[TAM + 1]; // Guarda el numero secreto con '\0' al final
    char intento[10]; // Array para guardar lo que el usuario ingrese
    int toros, vacas;

    adivinarNumero(secreto);  // Llamada a la funcion para generar un numero para adivinar

    printf("DEBUG: %s\n", secreto); 

    printf("Bienvenido al juego Vacas y Toros\n");

    do {
        printf("Ingrese un Número: ");
        scanf(" %9s", intento);

        if( strlen(intento) != 4) { // Si el tamaño del string es distinto a 4
            printf("Entrada Inválida.\n");
            continue;
        }

        contarVacasToros(secreto, intento, &vacas, &toros); // LLamada a la funcion para contar Vacas y Toros

        if(toros != 4) {
            printf("%d vacas, %d toros\n", vacas, toros);
            printf("Por favor, Intente de Nuevo\n");
        }
        

    } while( toros != 4); // Ejecuta mientras la cantidad de toros sea distinto a 4

    printf("Felicidades! El Número secreto era: %s\n", secreto);
    return 0;
}
