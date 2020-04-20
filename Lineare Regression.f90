!  LineareRegression.f90 
!
!  FUNCTIONS:
!  LineareRegression - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: LineareRegression
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program LineareRegression

    implicit none

    ! Variables
    double precision :: sx= 0d0, sy = 0d0, sxx = 0d0, sxy = 0d0, a, b
    integer :: s = 0, stat
    double precision :: x,y
    open(1, file="lin-reg.txt", action="read")
    do  
        read(1, *, iostat=stat) x,y
        if (stat /= 0) exit !fall es einen Fehler gab oder wir am Ende sind beende die Schleife
        s = s + 1
        sx = sx + x
        sxx = sxx + x**2
        sy = sy + y
        sxy = sxy + y * x   
    end do
    
    close(1)
    
    a = (sxx * sy - sx*sxy)/(s * sxx - sx**2)
    b = (s*sxy - sx*sy)/(s*sxx - sx**2)
    open(2, file="fit-parameter.dat", action="write")
    write(2,*) "Fit für f(x) = a + b x mit a = " , a, " und b = " ,b
    close(2)


    end program LineareRegression

