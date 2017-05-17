#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define N 5000
#define maximum 1000
//http://qiita.com/hiso/items/5c36f50c7de61fe870a2より引用
typedef int value_type; /* ソートするキーの型 */
typedef long long int int64;
void quicksort(value_type a[],long long int left,long long int right);
value_type med3(value_type x, value_type y, value_type z);
void dump(value_type a[], long long int count);
void countingSort(int A[],int B[] ,int k ,int64 count);
void RadixSort(int A[] ,int B[], int max, int64 count);

void dump(value_type a[], int64 count){
    for(int64 i=0;i<count;i++){
       printf("%2d ",a[i]);
       if((i+1)%10 == 0)
       printf("\n");
    }
    printf("\n");
}

value_type med3(value_type x, value_type y, value_type z)
/* x, y, z の中間値を返す */
{
    if (x < y)
        if (y < z) return y; else if (z < x) return x; else return z; else
        if (z < y) return y; else if (x < z) return x; else return z;
}


void countingSort(int A[],int B[] ,int max ,int64 count){
    int C[max + 1];
    for(int j = 0;j <= max; j++)
        C[j] = 0;
    for(int64 i = 0;i < count; i++)
        C[A[i]]++;
    for(int j = 1;j <= max; j++)
        C[j] = C[j] + C[j - 1];
    for(int64 i = count - 1; i >= 0; i--){
        B[C[A[i]] - 1] = A[i];
        C[A[i]]--;
    }
}

void RadixSort(int A[] ,int B[], int max, int64 count){
    if(max > 0x0000FFFF){
        int C[0xFFFF] = {0};
        int m = 0;
        for(int64 i = 0; i < count; i++)
            C[((unsigned short *)&(A[i]))[0]]++;
        for(int j = 1;j <= 0xFFFF; j++)
            C[j] = C[j] + C[j - 1];
        for(int64 i = count - 1; i >= 0; i--){
            B[C[((unsigned short *)&(A[i]))[0]] - 1] = A[i];
            C[((unsigned short *)&(A[i]))[0]]--;
        }

        int D[0xFFFF] = {0};
        for(int64 i = 0; i < count; i++)
            D[((unsigned short *)&(B[i]))[1]]++;
        for(int j = 1;j <= 0xFFFF; j++)
            D[j] = D[j] + D[j - 1];
        for(int64 i = count - 1; i >= 0; i--){
            A[D[((unsigned short *)&(B[i]))[1]] - 1] = B[i];
            D[((unsigned short *)&(B[i]))[1]]--;
        }
    }else{
        countingSort(A,B,max,count);
    }
}

int int_sort( const void * a , const void * b ) {
  /* 引数はvoid*型と規定されているのでint型にcastする */
  if( *( int * )a < *( int * )b ) {
    return -1;
  }
  else
  if( *( int * )a == *( int * )b ) {
    return 0;
  }
  return 1;
}

int main(void){

    int *source = (int *)malloc(N*sizeof(int));
    if(source == NULL){
        printf("error");
        return -1;
    }
    FILE *fp;
    char *filename = "random1.txt";
    int64 count = 0;
    int ret;
    clock_t start, end;

    fp = fopen(filename, "r");
    //setvbuf(fp, NULL, _IOFBF, )
    if(fp == NULL){
        printf("error");
        return -1;
    }
    while(fscanf(fp, "%d", &source[count]) != EOF){
        count++;
    }
    start = clock();

    qsort(source, count, sizeof(int), int_sort);
    
    end = clock();

    printf("time : %d[ms]\n", end - start);
    fclose(fp);

    return 0;
}