#include<stdio.h>
#include<stdbool.h>
#include<assert.h>

typedef struct {
int addr;
int value;
int datum;
bool present;
} babbage_output;

babbage_output alonzo_to_babbage(int tam, int a_output[]){
    assert(tam == 2 || tam == 3); 
    babbage_output res;
    if (tam == 2){
        res.addr = a_output[0];
        res.value = a_output[1];
        res.datum = 0;
        res.present = false;
    } else {
        res.addr = a_output[0];
        res.value = a_output[1];
        res.datum = a_output[2]; 
        res.present = true; 
    }
    return res; 
}
int main(void){

    int a_output[2] = {4242,10};
    int a_output2[3] = {4242,10, 5555};
    babbage_output res1 = alonzo_to_babbage(2, a_output);
    babbage_output res2 = alonzo_to_babbage(3, a_output2);

    printf("Traducimos alonzo: {4242, 10} a babbage: \n");
    printf(" addr: %d \n value: %d \n datum: %d \n present %d \n", res1.addr, res1.value, res1.datum, res1.present);
    printf("Traducimos alonzo: {4242, 10, 5555} a babbage: \n");
    printf(" addr: %d \n value: %d \n datum: %d \n present %d \n", res2.addr, res2.value, res2.datum, res2.present);
    return 0;
}
    /*
        EJEMPLOS: 
        Traducimos alonzo: {4242, 10} a babbage: 
    addr: 4242 
    value: 10 
    datum: 0 
    present 0 

    Traducimos alonzo: {4242, 10, 5555} a babbage: 
    addr: 4242 
    value: 10 
    datum: 5555 
    present 1 

    */

    /*
    ACLARACION: 
    Como en la libreria estandar de c no existen los booleanos, no puedo pasar el tipo de dato bool en el printf. 
    Por lo tanto el true = 1  y el false = 0 por eso se imprimen esos numeros en el present. 
    LO que se podria hacer es un if y escribir  textualmente la palabra "true" y "false" teniendo en cuenta que serian de char* o string. Pero como el ejercicio no lo pide no lo hago. 
    */