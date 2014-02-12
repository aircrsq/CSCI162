/*
*
* Purpose:              The purpose of this program is to search within a binary file
*                                       for instances of a string and print ouf the byte indexes for
*                                       each one found
* Log:
*/

#include <stdio.h>
#include <string.h>

/*
* Name:         Find_Next_Instance
*
* Purpose:      Finds the next instance of the given string within the file
*                               provided
*
* Parameters:
*       Input:
*                               file: The file handle to search within
*                               searchString: The string to search for
*                               len: The length of the string
*       Output:
*
* Returns:
*                               The index into the file the string was found (in bytes)
*
* Comments:
*                               The file handle must be opened with the 'rb' flags beforehand
*/
int Find_Next_Instance( FILE* file, char searchString[], int len)
{
        
   int strIndex = 0;
   char buffer[1];
   
   while(fread(buffer,1,1,file) > 0 ){
      
      if(buffer[0]==searchString[strIndex]){
         if(strIndex==len-1){
            return ftell(file)-strIndex;
         }
         strIndex++;             
      }
      else{
         strIndex=0;
      }
   }
   
   return -1;
   
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
   
   //String we are searching for
   char searchString[] = "Hello World";
   int searchStringLength = strlen(searchString);
   
   //Open file
   f = fopen(argv[1], "rb");
   
   if(f){
      //File was opened
      printf("Opened file successfully\nSearching for \"%s\"\n",searchString);
      
      result = Find_Next_Instance(f, searchString, searchStringLength);
      while(result>=0){
         printf("Found instance of \"%s\" at %d bytes into the file\n",searchString,result);
         result = Find_Next_Instance(f, searchString, searchStringLength);
      }
      
      //Done
      printf("Finished reading from file\n");
      
      //Close the file after use
      fclose(f);
   }
   else{
      printf("Failed opening file\n Command format: ./lab1 <inputfile>\n");
      return -1;
   }
   
   return 0;
}

