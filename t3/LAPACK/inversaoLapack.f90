! Inversao de Matriz Matlab
! PPGI
! Aluno: Fernando Emilio Puntel
! Professora: Andrea Charão
! Referências:
! INVERSE_MATRIX.F  VER 1.4  FEBRUARY 25, 2013 BY TOM IRVINE EMAIL: tomirvine@aol.com
! DGETRI - http://bit.ly/2eEMKQH
! DGETRF - http://bit.ly/2euvBce

PROGRAM main
	USE inversao

	CALL inicio()

END PROGRAM main


MODULE inversao

      IMPLICIT NONE
      DOUBLE PRECISION, ALLOCATABLE, DIMENSION(:,:) :: A, Ainv
      DOUBLE PRECISION, ALLOCATABLE, DIMENSION(:) :: WORK
      INTEGER :: i,j, LWORK

      INTEGER	     INFO, LDA,	M, N
      INTEGER, ALLOCATABLE, DIMENSION(:) :: IPIV

      INTEGER DeAllocateStatus

      CHARACTER :: A_filename*20


	CONTAINS

	SUBROUTINE inicio()
		print *, "#### INICIO ####"
		CALL leituraMatriz()
		CALL inv()
		print *, "#### FINAL ####"
		RETURN
	END SUBROUTINE

	SUBROUTINE leituraMatriz()


		PRINT '(" ")'
      		PRINT*,"Entre com o tamanho da matriz:"
      		READ*,N

		LDA = N
     		LWORK = N*N
      		ALLOCATE (A(LDA,N))
      		ALLOCATE (Ainv(LDA,N))
      		ALLOCATE (WORK(LWORK))
      		ALLOCATE (IPIV(N))

		PRINT '("")'
		PRINT '( "Entre com o nome da matriz:")'
		READ(*,*)A_filename

		OPEN(UNIT=10,FILE=A_filename,STATUS='OLD',ACTION='READ')

	      	DO i=1,N
			READ(10,*) (A(i,j),j=1,N)
	      	ENDDO

	      	PRINT '(" ")'
	      	PRINT*,"Input Matrix:"

	      	DO i = 1, N
			DO j = 1, N
		 		PRINT *, A(i,j) !WRITE(*,)(A(i,j), j = 1, N)
			END DO
	      	END DO
	    		!FORMAT(100(G10.4,1X))

	      	PRINT '(" ")'

	END SUBROUTINE


	SUBROUTINE inv()
		M=N
      		LDA=N

		CALL DGETRF( M, N, A, LDA, IPIV, INFO )

		CALL DGETRI(N, A, N, IPIV, WORK, LWORK, INFO)

		PRINT *, " MATRIZ INVERTIDA "

		DO i = 1, N
			DO j = 1, N
		 		PRINT *, A(i,j) !WRITE(*,)(A(i,j), j = 1, N)
			END DO
	      	END DO
		PRINT '(" ")'

	END SUBROUTINE



END MODULE
