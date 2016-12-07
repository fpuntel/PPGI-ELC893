#include <stdio.h>
#include <stdlib.h>
#include "mpi.h"
#include "dmumps_c.h"

#define T 2
#define ICNTL(I) icntl[(I) - 1]
#define JOB_INIT -1
#define USE_COMM_WORLD -987654

typedef struct
{
        //bool symmetric;
        int n;
        int irn[T];
        int jcn[T];
        double a[T*T];
}mumps_matrix;


int main(){
        mumps_matrix A;
        DMUMPS_STRUC_C id;
        int i;


        // set matrix
        for (i = 0; i < T; i++){
                A.irn[i] = i;
                A.jcn[i] = i;
        }


        A.a[0] = 5;
        A.a[1] = 8;
        A.a[2] = 14;
        A.a[3] = 3;

        //printf("%f\n %f\n %f\n %f\n", A.a[0], A.a[1], A.a[2], A.a[3]);


        id.n = 4;
        id.nz = 4;
        id.irn = A.irn;
        id.jcn = A.jcn;
        id.a = A.a;
        id.nz_rhs = 4;
        id.nrhs = 4;
        id.rhs_sparse = A.a;
        id.irhs_sparse = A.irn;
        id.irhs_ptr = A.jcn;
        id.job = JOB_INIT;
        id.par = 1;
        id.sym = 0;
        id.comm_fortran = USE_COMM_WORLD;

        id.ICNTL(3) = -1;
        id.ICNTL(4) = 1;
        id.ICNTL(7) = 0;
        id.ICNTL(30) = 1;

        printf("%f\n %f\n %f\n %f\n", id.a[0], id.a[1], id.a[2], id.a[3]);

        dmumps_c(&id);
//      printf("%f", id.rhs_sparse[0]);

        printf("%f\n %f\n %f\n %f\n", id.a[0], id.a[1], id.a[2], id.a[3]);

}
