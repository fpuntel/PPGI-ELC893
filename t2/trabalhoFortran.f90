! - Programa de Pós-Graduação em Informática - UFSM
! - Fernando Emilio Puntel
! - Parte trabalho 2 - Construção da função para criação de matrizes
! - O código não esta completo, pois, a parte do código que utiliza essas
! funções não é de minha autoria, contendo assim, somente a parte 
! desenvolvida para o trabalho.

PROGRAM main
	USE KfsFunctions
	CALL inicio ()
END PROGRAM main

MODULE KfsFunctions
!    use Globais
     integer*4 nj/10/, ni/10/
     real qGl(10, 10)
     real uGl(10, 10)
     real vgl(10,10)

    SUBROUTINE inicio()
	CALL criacaoMatrizes()
	    !model2d(dx, dy, dt, ni, nj, Hmean, rq, ru, rv, f, g)
	    !model2d(f , f , i , i , i , i    , d , d , d , d, d)	
	    !real(x,8)
	print *, "#### Inicio do Model2d ####"
	CALL model2d(real (1.0, 8), real (1.0, 8), 1, ni, nj, 1, real (1.0, 8), real (1.0, 8), real (1.0, 8), real (1.0, 8), real (1.0, 8))
	print *, "#### Final do Model2d ####"
	RETURN
    END SUBROUTINE

    SUBROUTINE criacaoMatrizes()
	integer :: i, j			
	print *, "#### Inicio da criacao das Matrizes ####"

	call random_seed() 

	! Matriz uGl
        do i = 1, ni - 1 
            do j = 1, nj - 1 
                call random_number(uGl(i,j)) 
            enddo
        enddo

	! Matriz vGl
        do i = 1, ni - 1 
            do j = 1, nj - 1 
                 call random_number(vGl(i,j))
            enddo
        enddo
        
        ! Matriz qGl 
        do i = 1, ni - 1 
            do j = 1, nj - 1 
                call random_number(qGl(i,j))
            enddo
        enddo

	print *, "#### Final da criacao das matrizes ####"
	RETURN
    END SUBROUTINE

END MODULE
