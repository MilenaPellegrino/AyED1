#include<stdio.h>
#include<assert.h>

// IMPRMIR ENTERO
void imprimirEntero(char* n, int);
void imprimirEntero(char* n, int x){
    printf("El valor de %s = %d\n", n, x);
}
int main(void){
    int x, y, z;
    printf("Ingresa un numero para x\n"); 
    scanf("%d", &x);
    printf("Ingresa un numero para y\n"); 
    scanf("%d", &y);
    printf("Ingresa un numero para z\n"); 
    scanf("%d", &z);
    int entrada_x = x; 
    int entrada_y = y; 
    int entrada_z = z; 
    assert(x == entrada_x && y == entrada_y && entrada_x * entrada_y!=0);
    int x_aux = x;
    if (x % 2 == 0){
        x = x + 1;
        y = y + z + y; 
        z = 2 * x_aux; 
    }else {
        x = x - 1; 
        y = y - z - y; 
        z = 2 * x_aux;
    }
    assert(z == 2 * entrada_x && ((x == entrada_x + 1 && y == entrada_y + entrada_z + entrada_y) || (x == entrada_x - 1 && y == entrada_y - entrada_z - entrada_y))  );
    imprimirEntero("x", x);
    imprimirEntero("y", y);
    imprimirEntero("z", z);

    return 0;
}

/*
EJEMPLOS DE EJECUCIÒN: 
Ingresa un numero para x
10
Ingresa un numero para y
2
Ingresa un numero para z
3
El valor de x = 11
El valor de y = 7
El valor de z = 20


Ingresa un numero para x
5
Ingresa un numero para y
2
Ingresa un numero para z
3
El valor de x = 4
El valor de y = -3
El valor de z = 10

*/