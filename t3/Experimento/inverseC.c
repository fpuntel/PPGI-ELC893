#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
	int N = 1000, NN = 1000000, i, j;
	double **A; //[1000][1000];
 	int pivotArray[1000000]; //since our matrix has three rows
	int errorHandler;
	double lapackWorkspace[1000000];
	FILE *file;
	char temp[30];

	A =  calloc (N, sizeof(double *));	

	for ( i = 0; i < N; i++ ) {
		A[i] =  calloc (N, sizeof(double));	
		if (A[i] == NULL) {
        		printf ("** Erro: Memoria Insuficiente **");
        	}
	}	


	file = fopen("/octave/PPGI/testeAmostragem/m", "r");

	for (i = 0; i < N; i++){
		for (j = 0; j < N; j++){
			fscanf(file, "%s", temp);
			A[i][j] = strtod(temp, NULL); //atof(temp);
		}
	}

	fclose(file);

        printf ("[4][4] = %f\n", A[4][4]);
        printf ("[49][49] = %f\n", A[49][49]);
        printf ("[88][88] = %f\n", A[88][88]);
        printf ("[501][501] = %f\n", A[501][501]);
        printf ("[880][880] = %f\n", A[880][880]);
        printf ("[240][240] = %f\n", A[240][240]);


//	extern void dgetrf_ (int * m, int * n, double * A, int * LDA, int * IPIV,
  //      	int * INFO);

//	extern void dgetri_ (int * n, double * A, int * LDA, int * IPIV,
//	        double * WORK, int * LWORK, int * INFO);

	dgetrf_(&N, &N,  A[0], &N, pivotArray, &errorHandler);
	dgetri_(&N, A[0], &N, pivotArray, lapackWorkspace, &NN, &errorHandler);


	for (i = 0; i < N; i++){
		for (j = 0; j < N; j++){
	//		printf("%f\t ", A[i][j]);
		}
	//	printf("\n");
	}

	printf ("[4][4] = %f\n", A[4][4]);
	printf ("[49][49] = %f\n", A[49][49]);
	printf ("[88][88] = %f\n", A[88][88]);
	printf ("[501][501] = %f\n", A[501][501]);
	printf ("[880][880] = %f\n", A[880][880]);
	printf ("[240][240] = %f\n", A[240][240]);

	fflush(stdin);
	
	return 0;
}
