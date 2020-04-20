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
    double precision a1,b1, a2,b2
    ! Variables
    call fitLinReg(a1,b1)
    call fitBrown(a2,b2)
   
    open(3, file="fit-parameter.dat", action="write")
    write(3,*) "Fit für f(x) = a + b x"
    write(3,*) "Lin-reg.txt"
    write(3,*) "a = " , a1, " und b = " ,b1
    write(3,*) "random_walk2.dat"
    write(3,*) "a = " , a2, " und b = " ,b2

    close(3)


    end program LineareRegression

    subroutine fitLinReg(a,b)
        implicit none
        double precision, intent(out) ::a, b
        double precision :: sx, sy, sxx, sxy
        integer :: s,stat
        double precision :: x,y    
        open(1, file="lin-reg.txt", action="read")
        s = 0
        sx = 0d0
        sy = 0d0
        sxx = 0d0
        sxy = 0d0
        do
            read(1, *, iostat=stat) x,y
            if (stat /= 0) exit
            s = s + 1
            sx = sx + x
            sxx = sxx + x**2
            sy = sy + y
            sxy = sxy + y * x
        end do
        
        close(1)
        a = (sxx * sy - sx*sxy)/(s * sxx - sx**2)
        b = (s*sxy - sx*sy)/(s*sxx - sx**2)
    end subroutine fitLinReg
    subroutine fitBrown(a,b)
        implicit none
        double precision, intent(out) ::a, b
        double precision :: sx, sy, sxx, sxy
        integer :: s,stat
        double precision :: x,y    
        
        open(2, file="random_walk2d.dat", action="read")
        s = 0
        sx = 0d0
        sy = 0d0
        sxx = 0d0
        sxy = 0d0
        do
            read(2, *, iostat=stat) x,y
            if (stat /= 0) exit
            y = y**2 !um die Eingabe zu linearisieren
            s = s + 1
            sx = sx + x
            sxx = sxx + x**2
            sy = sy + y
            sxy = sxy + y * x
        end do
        
        close(2)
        a = (sxx * sy - sx*sxy)/(s * sxx - sx**2)
        b = (s*sxy - sx*sy)/(s*sxx - sx**2)
    end subroutine fitBrown