#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
        int N = 2000, NN = 4000000, i, j;
        double A[2000][2000];
        int pivotArray[2000]; //since our matrix has three rows
        int errorHandler;
        double lapackWorkspace[4000000];
        FILE *file;
        char temp[30];
//      srand( (unsigned)time(NULL) );

        file = fopen("m", "r");

        for (i = 0; i < N; i++){
                for (j = 0; j < N; j++){
                        fscanf(file, "%s", temp);
                        A[i][j] = atof(temp);
                        //A[i][j] = (rand() % 101);
                        //A[i][j] = A[i][j]/100;
                        //printf ("%f\t",  A[i][j]);
                }
                printf("\n");
        }
        fclose(file);

        //printf("\n\n");

        extern void dgetrf_ (int * m, int * n, double * A, int * LDA, int * IPIV,
                int * INFO);

        extern void dgetri_ (int * n, double * A, int * LDA, int * IPIV,
                double * WORK, int * LWORK, int * INFO);

        dgetrf_(&N, &N, A[0], &N, pivotArray, &errorHandler);
        dgetri_(&N, A[0], &N, pivotArray, lapackWorkspace, &NN, &errorHandler);


        for (i = 0; i < N; i++){
                for (j = 0; j < N; j++){
                                      printf("%f\t ", A[i][j]);
                }
              printf("\n");
        }

        printf("[4][4] = %f\n", A[4][4]);
        printf("[49][49] = %f\n", A[49][49]);
        printf("[88][88] = %f\n", A[88][88]);

        return 0;
}
