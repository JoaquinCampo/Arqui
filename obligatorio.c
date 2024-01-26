#include <stdio.h>
#define ENTRADA 22
#define PUERTO_LOG_DEFECTO 24
#define PUERTO_SALIDA_DEFECTO 26

short pila[31];
short puerto_salida = PUERTO_SALIDA_DEFECTO;
short puerto_entrada = ENTRADA;
short puerto_bitacora = PUERTO_LOG_DEFECTO;
short tope = 0;
short aux;

void Num()
{
    printf("%d", puerto_entrada);
    if (tope == 31)
        printf("4\n"); // la operacion fallo por desbordamiento de pila
    else
    {
        pila[tope] = puerto_entrada;
        tope++;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void Puerto()
{
    printf("%d", puerto_entrada);
    puerto_salida = puerto_entrada;
    printf("16\n"); // la operacion se realizo con exito
}

void PuertoLog()
{
    printf("%d", puerto_entrada);
    puerto_bitacora = puerto_entrada;
    printf("16\n"); // la operacion se realizo con exito
}

void Top()
{
    if (tope == 0)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        printf("%d", pila[tope - 1]);
        printf("16\n"); // la operacion se realizo con exito
    }
}

void Dump()
{
    for (short i = 0; i < tope; i++)
        printf("%d", pila[i]);
    printf("16\n"); // la operacion se realizo con exito
}

void Duplicar()
{
    if (tope == 31)
        printf("4\n"); // la operacion fallo por desbordamiento de pila
    else
    {
        pila[tope] = pila[tope - 1];
        tope++;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void SWAP()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        aux = pila[tope - 1];
        pila[tope - 1] = pila[tope - 2];
        pila[tope - 2] = aux;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void Negativo()
{
    if (tope == 0)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        pila[tope - 1] = -pila[tope - 1];
        printf("16\n"); // la operacion se realizo con exito
    }
}

short Fact(short n)
{
    if (n == 0)
    {
        return 1;
    }
    else
    {
        return n * Fact(n - 1);
    }
}

void Sum()
{
    aux = 0;
    for (short i = 0; i < tope; i++)
        aux += pila[i];
    tope = 1;
    pila[tope - 1] = aux;
    printf("16\n"); // la operacion se realizo con exito
}

void Suma()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        pila[tope - 2] += pila[tope - 1];
        tope--;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void Resta()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        pila[tope - 2] -= pila[tope - 1];
        tope--;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void Multiplicacion()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        pila[tope - 2] *= pila[tope - 1];
        tope--;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void Division()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        if (pila[tope - 1] == 0)
            ; // la operacion fallo por division por cero
        else
        {
            pila[tope - 2] /= pila[tope - 1];
            tope--;
            printf("16\n"); // la operacion se realizo con exito
        }
    }
}

void Modulo()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        if (pila[tope - 1] == 0)
            ; // la operacion fallo por division por cero
        else
        {
            pila[tope - 2] %= pila[tope - 1];
            tope--;
            printf("16\n"); // la operacion se realizo con exito
        }
    }
}

void andBit()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        pila[tope - 2] &= pila[tope - 1];
        tope--;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void orBit()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        pila[tope - 2] |= pila[tope - 1];
        tope--;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void ShiftL()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        while(pila [tope - 1] > 0)
        {
            pila[tope - 2] <<= 1;
            pila[tope - 1]--;
        }
        tope--;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void ShiftR()
{
    if (tope < 2)
        printf("8\n"); // la operacion fallo por pila vacia
    else
    {
        while(pila [tope - 1] > 0)
        {
            pila[tope - 2] >>= 1;
            pila[tope - 1]--;
        }
        tope--;
        printf("16\n"); // la operacion se realizo con exito
    }
}

void Clear()
{
    tope = 0;
    printf("16\n"); // la operacion se realizo con exito
}

int main()
{
    do
    {
        printf("0"); // indica el comienzo de la operacion
        scanf("%hi", &puerto_entrada);
        switch (puerto_entrada)
        {
        case 1:          // agrega numero a la pila
            printf("1"); // indica que se va a agregar un numero a la pila
            scanf("%hi", &puerto_entrada);
            Num();
            break;
        case 2:          // setea el puerto de salida
            printf("2"); // indica que se va a setear el puerto de salida
            scanf("%hi", &puerto_entrada);
            Puerto();
            break;
        case 3:          // setea el puerto de la bitacora
            printf("3"); // indica que se va a setear el puerto de la bitacora
            scanf("%hi", &puerto_entrada);
            PuertoLog();
            break;
        case 4:            // muestra el tope de la pila en el puerto de salida (no retira de la pila)
            printf("4\n"); // indica que se va a mostrar el tope de la pila
            Top();
            break;
        case 5:          // realiza un volcado de la pila en el puerto de salida (no retira de la pila)
            printf("5"); // indica que se va a realizar un volcado de la pila
            Dump();
            break;
        case 6:          // duplica el tope de la pila
            printf("6"); // indica que se va a duplicar el tope de la pila
            Duplicar();
            break;
        case 7:          // intercambia el tope de la pila con el elemento debajo
            printf("7"); // indica que se va a intercambiar el tope de la pila con el elemento debajo
            SWAP();
            break;
        case 8:          // calcula el opuesto
            printf("8"); // indica que se va a calcular el opuesto
            Negativo();
            break;
        case 9:          // calcula el factorial recursivamente
            printf("9"); // indica que se va a calcular el factorial recursivamente
            if (tope == 0)
            {
                printf("4\n"); // la operacion fallo por falta de operandos en la pila
            }
            else
            {
                pila[tope - 1] = Fact(pila[tope - 1]);
                printf("16\n"); // la operacion se realizo con exito
            }
            break;
        case 10:          // Calcula la suma de todos los elementos de la pila (borrando la pila) y deja el resultado
                          // en el tope de la pila. Si no hay elementos deja 0 en el tope de la pila.
            printf("10"); // indica que se va a calcular la suma de todos los elementos de la pila
            Sum();
            break;
        case 11:          // suma los dos elementos de mas arriba en la pila y pone el resultado en la cima de la pila
            printf("11"); // indica que se va a sumar los dos elementos de mas arriba en la pila
            Suma();
            break;
        case 12:          // resta los dos elementos de mas arriba en la pila y pone el resultado en la cima de la pila
            printf("12"); // indica que se va a restar los dos elementos de mas arriba en la pila
            Resta();
            break;
        case 13:          // multiplica los dos elementos de mas arriba en la pila y pone el resultado en la cima de la pila
            printf("13"); // indica que se va a multiplicar los dos elementos de mas arriba en la pila
            Multiplicacion();
            break;
        case 14:          // divide los dos elementos de mas arriba en la pila y pone el resultado en la cima de la pila
            printf("14"); // indica que se va a dividir los dos elementos de mas arriba en la pila
            Division();
            break;
        case 15:          // calcula el modulo de los dos elementos de mas arriba en la pila y pone el resultado en la cima de la pila
            printf("15"); // indica que se va a calcular el modulo de los dos elementos de mas arriba en la pila
            Modulo();
            break;
        case 16:            // calcula el and bit a bit de los dos elementos de mas arriba en la pila y pone el resultado en la cima de la pila
            printf("16\n"); // indica que se va a calcular el and bit a bit de los dos elementos de mas arriba en la pila
            andBit();
            break;
        case 17:          // calcula el or bit a bit de los dos elementos de mas arriba en la pila y pone el resultado en la cima de la pila
            printf("17"); // indica que se va a calcular el or bit a bit de los dos elementos de mas arriba en la pila
            orBit();
            break;
        case 18:          // realiza el desplazaiento a la izquierda de la cima y lo pone en la cima de la pila
            printf("18"); // indica que se va a realizar el desplazaiento a la izquierda de la cima
            ShiftL();
            break;
        case 19:          // realiza el desplazaiento a la derecha de la cima y lo pone en la cima de la pila
            printf("19"); // indica que se va a realizar el desplazaiento a la derecha de la cima
            ShiftR();
            break;
        case 254:           // borra todo el contenido de la pila
            printf("254 "); // indica que se va a borrar todo el contenido de la pila
            Clear();
            break;
        default:
            printf("%d" , puerto_entrada);
            printf("2 "); // comando no reconocido
            break;
        }
    } while (puerto_entrada != 255);
    printf("255\n"); // indica que se va a terminar la ejecucion del programa
    printf("16\n");
Loop:
    goto Loop;

    return 0;
}
