! 
! License-Identifier: GPL
!
! Copyright (C) 2018 The Yambo Team
!
! Authors (see AUTHORS file for details): AM
!
module RT_output_m
 !
 use drivers,    ONLY:l_elel_scatt,l_elph_scatt,l_elphoton_scatt
 use pars,       ONLY:DP,SP,schlen,lchlen,LP
 use units,      ONLY:FS2AUT
 use global_XC,  ONLY:QP_SE_NONE
 use descriptors,ONLY:IO_desc
 !
#include<memory.h>
 !
 integer, parameter       :: N_MAX_RT_o_files=100
 integer, parameter       :: N_MAX_RT_X_order=9
 integer, parameter       :: N_MAX_RT_headings=20
 !
 integer                  :: N_RT_o_files
 integer                  :: n_RT_headings(N_MAX_RT_o_files)
 character(lchlen)        :: RT_o_file_long(N_MAX_RT_o_files)
 character(schlen)        :: RT_o_file_short(N_MAX_RT_o_files)
 character(schlen)        :: RT_headings(N_MAX_RT_o_files,N_MAX_RT_headings)
 character(schlen)        :: YPP_append
 logical                  :: RT_o_file_is_open(N_MAX_RT_o_files)
 !
 ! Descriptors
 !
 type(IO_desc)            :: Gr_desc
 type(IO_desc)            :: RT_desc
 type(IO_desc)            :: TIME_STEP_desc
 integer                  :: n_RT_desc_static
 logical                  :: RT_descriptors_dumped(N_MAX_RT_o_files)
 !
 contains
   !
   subroutine RT_FILE_add(name,TITLES)
     !
     character(*) , OPTIONAL :: name
     character(*) , OPTIONAL :: TITLES(:)
     !
     integer :: i_t,N
     !
     if (present(name)) then
       N_RT_o_files=N_RT_o_files+1
       RT_o_file_short(N_RT_o_files)=trim(YPP_append)//trim(name)
       RT_o_file_long(N_RT_o_files) =RT_o_file_short(N_RT_o_files)
     endif
     N=size(TITLES)
     do i_t= 1,N
       RT_headings(N_RT_o_files,n_RT_headings(N_RT_o_files)+i_t)=trim(TITLES(i_t))
     enddo
     n_RT_headings(N_RT_o_files)=n_RT_headings(N_RT_o_files)+N
     !
   end subroutine
   !
end module
