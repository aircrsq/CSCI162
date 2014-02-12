/*
*
* Purpose: This program reads an input file of data in binary and adds, 
* subtracts of multiplies the numbers on each line of the file. 
*/

#include <stdio.h>
#include <string.h>
#include <math.h>

void Flipit(int Ar1[], int Ar2[])
{
   int i;
   for (i=0; i<8; i++)
   {
      if (Ar1[i] == 1) {Ar2[i] = 0;}
      else {Ar2[i] = 1;}
   }
}

/*********************************************************
 * Step 2: Write the add function
 * This function adds two arrays of 1s and  0s representing
 * an 8 bit twos complement binary numbers.
 *********************************************************/

void add(int in1[], int in2[], int output[])
{
   int i;
   int carry = 0;

   for(i = 7 ; i >=0 ; i--)
   {
      output[i] = in1[i] + in2[i] + carry;
      switch (output[i])
      {
         case 0:
            break;
         case 1:
            output[i] = 1;
            carry = 0;
            break;
         case 2:
            output[i] = 0;
            carry = 1;
            break;
         case 3:
            output[i] = 1;
            carry = 1;
            break;
      }
   }
}

/***********************************************************
 * Step 1: Write the convert function.
 *
 * This function converts an array of 1s and 0s representing 
 * an 8 bit twos complement binary number into a decimal number.
 *
 * input[0] is the most significant digit. If it is 1, the number
 * is negitive (-), otherwise it is positive (+). If the number is 
 * positve, then result = input[7] 
 *                      + 2* input[6]
 *                      + 2^2 * input[5]
 *                      + 2^2 * input[4]
 *                      + 2^2 * input[3]
 *                      + 2^2 * input[2]
 *                      + 2^2 * input[1]
 *
 * If the number it negitive you must determine your own method for 
 * converting it.
 **********************************************************/
int convert(int input[]){
   int result = 0;
   int NegBit = 1;
   int IsNeg = 0;
   int Ar1[8];
   int AddOne[8];
   int i =0;
   
   for(i=0; i<8 ; i++) 
   {
      AddOne[i] = 0;
      Ar1[i] = input[i];
   }
   AddOne[7] = 1;

   if (input[0] == NegBit)
   {
      Flipit(input, Ar1);
      add(Ar1, AddOne, Ar1);    
   }

   for (i=7; i>=1; i--)
   {
      result = result + pow(2, 7-i)*Ar1[i];
   }

   if (input[0] == NegBit)
      result = result * -1;

   return result;
}

void shiftRight(int array[])
{
   int i;
   for (i=7 ; i > 0 ; i--)
      array[i] = array[i-1];
   array[0] = 0;
}

void shiftLeft(int array[])
{
   int i;
   for (i=0 ; i < 7 ; i++)
      array[i] = array[i+1];
   array[7] = 0;
}

void ShiftArrays(int A1[], int A2[])
{
   int i;
   i = A2[0];
   shiftRight(A1);
   A1[0] = A2[7];
   shiftRight(A2);
   A2[0] = i;
}

/*********************************************************
 * Step 3: Write the multiply function
 * This function multiplies two arrays of 1s and  0s representing
 * an 8 bit twos complement binary numbers.
 *
 * Note: The shiftLeft function may be of use to you.
 *********************************************************/
void multiply(int in1[], int in2[], int output[])
{
   int i;
   int Q1;
   int shiftedin1[8];
   int Flippedin2[8];
   int AddOne[8];
   Flipit(in2, Flippedin2);

   for(i=0; i<8 ; i++) 
   {
      output[i] = in1[i];
      shiftedin1[i]= 0;
      AddOne[i] = 0;
      Q1 = 0;
   }
   AddOne[7] = 1;
   add(Flippedin2, AddOne, Flippedin2);    

   for (i = 7 ; i >=0 ; i--)
   {
/*  Your code here */
      if (output[7] > Q1)
      {
         add(shiftedin1, Flippedin2, shiftedin1);
         Q1 = output[7];
         ShiftArrays(output, shiftedin1);
      }
      else if (output[7] < Q1)
      {
         add(shiftedin1, in2, shiftedin1);
         Q1 = output[7];
         ShiftArrays(output, shiftedin1);
      }
      else
      {
         Q1 = output[7];
         ShiftArrays(output, shiftedin1);
      }
   }
}

void printArray(int array[]) {
    int i;
    for(i = 0 ; i < 8 ; i++)
        printf("%1d", array[i]);
}

void parseLine(char line[])
{
    int i;
    int binaryInt1[8];
    int binaryInt2[8];
    int binaryAnswer[8];

    char function = line[0];
    for(i=0 ; i<8 ;  i++) {
       binaryInt1[i] = line[i+2] - '0';
       binaryInt2[i] = line[i+11] - '0';
       binaryAnswer[i] = 0;
    }
    if(function == '+')
        add(binaryInt1, binaryInt2, binaryAnswer);    
    else
        multiply(binaryInt1, binaryInt2, binaryAnswer);

    printArray(binaryInt1);
    printf(" %c ", function);
    printArray(binaryInt2);
    printf(" = ");
    printArray(binaryAnswer);
    printf("\n");

    printf("%d", convert(binaryInt1));
    printf(" %c ", function);
    printf("%d", convert(binaryInt2));
    printf(" = ");
    printf("%d", convert(binaryAnswer));
    printf("\n\n"); 
}


/*
 * Name:         main
 *
 * Purpose:      main entrypoint for the program
 *
 * Parameters:
 *       Input:
 *                               argc: number of arguments given at the commandline
 *                               argv: list of arguments from commandline
 *                               args[1]: the filename being searched
 *       Output:
 *
 * Returns:
 *                               0 if normal operation, -1 if an eror
 *
 * Comments:                     
 */
int main( int argc, const char* argv[] )
{
   FILE* f;
   int result;
   char line[80]; /* The line we will read from the file. */
   
   /* Open file */
   if((f = fopen("input.txt", "r")) == NULL){
      printf("You need to download the file input.txt from Moodle, and it needs to be in this directory. \n");
      return(1);
   }
   
   /* File was opened */
   printf("Running %s\n",argv[0]);
   while(fgets(line,80,f) != NULL) {
         parseLine(line);
   }

   fclose(f);
   return 0;
}

