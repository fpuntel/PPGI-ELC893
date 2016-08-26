! Teste para alocao dinamica matriz 

PROGRAM ALLOCATEE
	integer :: arrsize
	double precision, allocatable, dimension(:,:) :: qGl
	allocate(qGl(2000,2000))

	arrsize = size(qGl)	
	print *, "Size: ", arrsize

END PROGRAM ALLOCATEE
