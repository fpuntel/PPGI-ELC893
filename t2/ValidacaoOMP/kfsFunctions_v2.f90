!***********************************************************************
! Funções: main (), inicio() e criacaoMatrizes()
!	Autor: Fernando Emilio Puntel
! 	Programa de Pós-Graduação em Informática (Semestre 2016/2)
!	Universidade Federal de Santa Maria
! Funções: droplet(), model2d()
! 	Traducao da funcao ndgrid do Matlab para o Fortran
! 	Tradutora: Sabrina Sambati (CAP/INPE)
!***********************************************************************

PROGRAM main
	USE KfsFunctionsPara
	real :: start, finish

	call cpu_time(start)
	CALL inicio ()
        call cpu_time(finish)
        print '("Time = ",f6.3," seconds.")',finish-start
END PROGRAM main

MODULE KfsFunctionsPara
!    use Globais
     integer*4 nj/400/, ni/400/

     real qGl(400, 400)
     real uGl(400, 400)
     real vgl(400, 400)

CONTAINS

    !***********************************************************************
    ! Traducao da funcao droplet e ndgrid do Matlab para o Fortran
    !SUBROUTINE droplet(height,width,Dd)
    !***********************************************************************
    SUBROUTINE droplet(height,width)
        IMPLICIT NONE
        real, allocatable, dimension(:,:) :: x, y
        real, allocatable, dimension(:,:) :: Dd, D

        real count
        integer :: height, width
        integer :: i, j

        count = -1.0

        allocate(x(width,width))
        allocate(y(width,width))
        allocate(Dd(width,width))

        do j = 1, width !j = coluna
            do i = 1, width !i = linha
                x(i,j) = count !para todas as linhas da coluna j
            enddo
            count = count + (2/(real(width-1)))
        enddo

        y = transpose(x)

        Dd = real(height)*exp(-5*(x**2+y**2)) !para todas as linha da coluna j

        D = Dd

        deallocate(x)
        deallocate(y)
        deallocate(Dd)

    END SUBROUTINE !droplet

    SUBROUTINE inicio()
	
	CALL criacaoMatrizes()

	print *, "#### Inicio do Model2d ####"
	CALL model2d(real (1.0, 8), real (1.0, 8), 1, ni, nj, 1, real (1.0, 8), real (1.0, 8), real (1.0, 8), real (1.0, 8), real (1.0, 8))
	print *, "#### Final do Model2d ####"

	print *, "#### Inicio salvar em arquivo ###"
	CALL salvarDados()
	print *, "#### Final salvar em arquivo ###"

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

    !***********************************************************************
    ! Traducao da funcao modelo2D do Matlab para o Fortran
    !SUBROUTINE model2d(dx,dy,dt,ni,nj,nk,q,u,v,Hmean,rq,ru,rv,f,g)
    !***********************************************************************
    SUBROUTINE model2d(dx, dy, dt, ni, nj, Hmean, rq, ru, rv, f, g)
        IMPLICIT NONE
        integer :: i, j
        integer :: ni, nj
        integer :: dt, Hmean

        double precision :: dx, dy
        double precision :: rq, ru, rv, f, g
        double precision :: rho_a, rho_w
        double precision :: cx, cy
        double precision :: Cd
        double precision :: Fv, Fu
        double precision :: ua

        double precision, allocatable, dimension(:,:) :: divx, divy
        double precision, allocatable, dimension(:,:) :: dqdx, dqdy, aux
        double precision, allocatable, dimension(:,:) :: ubar, vbar

        allocate(divx(ni,nj))
        allocate(divy(ni,nj))
        allocate(dqdx(ni,nj))
        allocate(aux(ni,nj))
        allocate(dqdy(ni,nj))
        allocate(ubar(ni,nj))
        allocate(vbar(ni,nj))

        cx = 1.0/dx
        cy = 1.0/dy

        Cd = 1.6d-3
        rho_a = 1.275
        rho_w = 1.0d3
        ua = 5.0d0

        Fu = Cd * rho_a * ua * ua / (real(Hmean) * rho_w)
        Fv = 0.0

        divx=0.0
        divy=0.0
        dqdx=0.0
        dqdy=0.0

	! Primeira parte paralelizada	
	!$OMP PARALLEL

		!$OMP DO
		!Calculo dos divergentes na direcao x
		do i = 1, ni - 1 
		    do j = 1, nj - 1 
		        divx(i,j)  = cx * (uGl(i+1, j) - uGl(i, j))
		    enddo
		enddo
		!$OMP END DO

		!$OMP DO
		do j = 1, nj - 1
		    divx(ni,j) = cx * (uGl(1,j) - uGl(ni,j))
		enddo
		!$OMP END DO

		!$OMP DO
		!Calculo dos divergentes na direcao y
		do i = 1, ni !i = linha
		    do j = 1, nj - 1 !j = coluna
		        divy(i, j)  = cy * (vGl(i, j+1) - vGl(i, j))
		    enddo
		enddo
		!$OMP END DO

		!$OMP DO
		do j = 1, nj - 1 !j = coluna
		    divy(ni, j) = cy * (uGl(1, j) - uGl(ni, j))
		enddo
		!$OMP END DO

	!$OMP END PARALLEL 
	!End


        do i = 1, ni !i = linha
            do j = 1, nj-1 !j = coluna
                qGl(i,j) = qGl(i,j) + real(dt) *(-(real(Hmean)) * (divx(i,j) + divy(i,j)) - (rq * qGl(i,j)))
            enddo
        enddo


	!$OMP PARALLEL

	!$OMP DO
		do i = 2, ni !i = linha
		    do j = 1, nj-1 ! j = coluna
		        dqdx(i,j) = cx * (qGl(i,j) - qGl(i-1,j))
		    enddo
		enddo
		!$OMP END DO

		!$OMP DO
		do j = 1, nj-1 ! j = coluna
		    dqdx(1,j) = cx * (qGl(1,j) - qGl(ni,j))
		enddo
		!$OMP END DO

		!$OMP DO
		do i = 1, ni !i = linha
		    do j = 2, nj-1 !j = coluna
		        dqdy(i,j)= cy * (qGl(i,j) - qGl(i,j-1))
		    enddo
		enddo
		!$OMP END DO	
	!$OMP END PARALLEL


	!$OMP PARALLEL
		!$OMP DO
		do i = 1, ni-1 !i = linha
		    do j = 2, nj-1!j = coluna
		        ubar(i,j) = 0.25 * (uGl(i+1,j) + uGl(i,j) + uGl(i+1,j-1) + uGl(i,j-1))
		    enddo
		enddo
		!$OMP END DO

		!$OMP DO
		do j = 2, nj-1!j = coluna
		    ubar(ni,j) = 0.25 * (uGl(1,j) + uGl(ni,j) + uGl(1,j-1) + uGl(ni,j-1))
		enddo
		!$OMP END DO

		!$OMP DO
		do i = 2, ni !j = coluna
		    do j = 1, nj-1 !i = linha
		        vbar(i,j) = 0.25 * (vGl(i,j+1) + vGl(i,j) + vGl(i-1,j+1) + vGl(i-1,j))
		    enddo
		enddo
		!$OMP END DO
	
		!$OMP DO
		do j = 1, nj-1 !i = linha
		    vbar(1,j) = 0.25 * (vGl(1,j+1) + vGl(1,j) + vGl(ni,j+1) + vGl(ni,j))
		enddo
		!$OMP END DO
	!$OMP END PARALLEL
	
        !Atualizando u
        do i  = 1, ni !i = linha
            do j = 1, nj-1 !j = coluna
                uGl(i,j) = uGl(i,j) + real(dt) *(f * vbar(i,j) - g * dqdx(i,j) - ru * uGl(i,j) + Fu)
            enddo
        enddo

        !Atualiza v
        do i = 1, ni !i = linha    
            do j = 2, nj-1 !j= coluna
                vGl(i,j) = vGl(i,j) + real(dt) * (-f * ubar(i,j) - g * dqdy(i,j) - rv * vGl(i,j) + Fv)
            enddo
        enddo

        deallocate(divx)
        deallocate(divy)
        deallocate(dqdx)
        deallocate(aux)
        deallocate(dqdy)
        deallocate(ubar)
        deallocate(vbar)

    END SUBROUTINE !model2d


    SUBROUTINE salvarDados()
	OPEN(1, FILE='vGlParalelizado.txt', STATUS='REPLACE')
	do i = 1, ni !i = linha    
            do j = 2, nj-1  !j= coluna
		OPEN(1, FILE='vGlParalelizado.txt', STATUS='old')
                WRITE(1,*) vGl(i,j)
            enddo
        enddo

	OPEN(1, FILE='uGlParalelizado.txt', STATUS='REPLACE')
	do i = 1, ni !i = linha    
            do j = 2, nj-1  !j= coluna
		OPEN(1, FILE='uGlParalelizado.txt', STATUS='old')
                WRITE(1,*) uGl(i,j)
            enddo
        enddo
    END SUBROUTINE

    !***********************************************************************
    ! Returns the inverse of a matrix calculated by finding the LU
    ! decomposition.  Depends on LAPACK.
    !***********************************************************************
    


END MODULE




