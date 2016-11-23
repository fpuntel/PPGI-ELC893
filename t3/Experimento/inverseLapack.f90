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

	call cpu_time(start)
	CALL inicio ()
        call cpu_time(finish)
        print '("Time = ",f6.3," seconds.")',finish-start
	totalTime = finish - start
	print *, totalTime
	OPEN(1, FILE='temp.txt', STATUS='REPLACE')
        WRITE(1,*) totalTime
END PROGRAM main


MODULE inversao

      IMPLICIT NONE
      DOUBLE PRECISION, ALLOCATABLE, DIMENSION(:,:) :: A, A_aux, A_iden, Ainv
      DOUBLE PRECISION, ALLOCATABLE, DIMENSION(:) :: WORK
      INTEGER :: i,j, LWORK, CONT
      DOUBLE  PRECISION :: SOMA

      INTEGER	     INFO, LDA,	M, N
      INTEGER, ALLOCATABLE, DIMENSION(:) :: IPIV

      INTEGER DeAllocateStatus

      CHARACTER :: A_filename*20

      DOUBLE PRECISION ALPHA, BETA
      real :: start, finish

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
      		!PRINT*,"Entre com o tamanho da matriz:"
      		!READ*,N
                N=1000
               ! PRINT *, N
		LDA = N
     		LWORK = N*N
      		ALLOCATE (A(LDA,N))
                ALLOCATE (A_aux(LDA,N))
                ALLOCATE (A_iden(LDA, N))
      		ALLOCATE (Ainv(LDA,N))
      		ALLOCATE (WORK(LWORK))
      		ALLOCATE (IPIV(N))

		PRINT '("")'
		!PRINT '( "Entre com o nome da matriz:")'
		!READ(*,*)A_filename
                A_filename="m"

		OPEN(UNIT=10,FILE=A_filename,STATUS='OLD',ACTION='READ')

	      	DO i=1,N
			READ(10,*) (A(i,j),j=1,N)
                        A_aux(i,j) = A(i,j) 
	      	ENDDO
                CLOSE(UNIT=10)
                OPEN(UNIT=10,FILE=A_filename,STATUS='OLD',ACTION='READ')

                DO i=1,N
                        READ(10,*) (A_aux(i,j),j=1,N)
                       ! A_aux(i,j) = A(i,j)
                ENDDO



	      	!PRINT '(" ")'
	      	!PRINT*,"Input Matrix:"

	      	!DO i = 1, N
		!	DO j = 1, N
		! 		PRINT *, A(i,j) !WRITE(*,)(A(i,j), j = 1, N)
		!	END DO
	      	!END DO
	    		!FORMAT(100(G10.4,1X))

	      	PRINT '(" ")'

	END SUBROUTINE


	SUBROUTINE inv()
		M=N
      		LDA=N
                call cpu_time(start)
		CALL DGETRF( M, N, A, LDA, IPIV, INFO )

		CALL DGETRI(N, A, N, IPIV, WORK, LWORK, INFO)
                call cpu_time(finish)
                print '("Tempo total  = ",f6.3," seconds.")',finish-start

		PRINT *, " MATRIZ INVERTIDA "
                !Salvo em arquivo para testar se a inversao funcionou
                !OPEN(1, FILE='matrizInvertida.txt', STATUS='NEW') 
		!DO i = 1, N
		!	DO j = 1, N
		! 		PRINT *, A(15,15) !WRITE(*,)(A(i,j), j = 1, N)
			        !WRITE(1,*) A(i,j) Escreve no arquivo
                !        END DO
	      	!END DO
                
                ! IDENTIDADE                
                
                ALPHA = 1.0 
                BETA = 0.0
                CALL DGEMM('T', 'T', N, N, N, ALPHA, A, N, A_aux, N, BETA, A_iden, N)

                !DIAGONA PRINCIPAL                
                SOMA = 0.0
                CONT = 0
                PRINT *, "IDENTIDADE"
                DO i=1,N
                        SOMA = SOMA + ((1 - A_iden(i,i)) * (1 - A_iden(i,i)))
                        CONT = CONT + 1     
                        !DO j=1, N
                                !PRINT *, "A_iden (", i, ",", i, "):", A_iden(i,i)                           
                                !PRINT *, "A_aux (", i, ",", i, "):", A_aux(i,j)
                                !PRINT *, "A (", i, ",", i, "):",A(i,j)
                !        READ(10,*) (A_aux(i,j),j=1,N) 
                        !ENDDO
                ENDDO
                SOMA = SQRT(SOMA)
                SOMA = SOMA / CONT
                PRINT *, "########### RESULTADO: ", SOMA

                ! ELEMENTOS FORA DA DIAGONAL PRINCIPAL
                SOMA = 0.0
                CONT = 0

                DO i=1,N
                        DO j=1,N
                                IF (i /= j) THEN
                                        SOMA = SOMA + (A_iden(i,j) * A_iden(i,j))
                                        CONT = CONT + 1
                                END IF
                        ENDDO
                ENDDO
                SOMA = SQRT(SOMA)
                SOMA = SOMA / CONT

                PRINT *, "###### ELEMENTOS FORA DA DIAGONAL: ", SOMA

		PRINT '(" ")'

                PRINT *, '####### (5,5)', A(5,5)
                PRINT *, '####### (50,50)', A(50,50)
                PRINT *, '####### (89,89)', A(89,89)
                PRINT *, '####### (501,501)', A(501,501)
                PRINT *, '####### (880,880)', A(880,880)
                PRINT *, '####### (240,240)', A(240,240)


	END SUBROUTINE



END MODULE
