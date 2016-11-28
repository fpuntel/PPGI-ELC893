
PROGRAM main
        IMPLICIT NONE

        INTEGER    :: lda,ipiv(2),info,lwork
        DOUBLE PRECISION, ALLOCATABLE, DIMENSION(:,:) :: B
        complex(8), allocatable :: A(:,:),RA(:,:) !,work(4)
        COMPLEX*16 :: work(2*64)
        INTEGER :: i, j, N
        CHARACTER :: A_filename*20


        A_filename="m"
        N = 3

        ALLOCATE(A(N, N))
        ALLOCATE(RA(N,N))
        ALLOCATE(B(N, N))

	! Carrega matriz
        OPEN(UNIT=10,FILE=A_filename,STATUS='OLD',ACTION='READ')
        DO i=1,N
                READ(10,*) (B(i,j),j=1,N)
        ENDDO

        RA(:,:) = B(:,:)
        lwork=N
        lda=N

        CALL ZGETRF(N,N,RA,lda,ipiv,info)
        IF(info/=0) write(0,*) 'ERROR OCCURED IN ZGETRF!'

        CALL ZGETRI(N,RA,lda,ipiv,work,lwork,info)
        IF(info/=0) write(0,*) 'ERROR OCCURED IN ZGETRI'

        DO i=1,N
                DO j=1,N
                       PRINT *, 'RA (', i, ',', j, ') = ', RA(i,j)
                ENDDO
        ENDDO


END PROGRAM main
