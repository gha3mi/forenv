!> author: Seyed Ali Ghasemi
module forenv

   implicit none

   private

   public :: set_environment_variable, unset_environment_variable

contains

   !===============================================================================
   !> author: Seyed Ali Ghasemi
   impure subroutine set_environment_variable(name, value, replace, result)
      use, intrinsic :: iso_c_binding
      implicit none
      character(c_char), intent(in)  :: name(*)
      character(c_char), intent(in)  :: value(*)
      integer(c_int),    intent(in)  :: replace
      integer(c_int),    intent(out) :: result

      interface
         function setenv(c_name, c_value, c_replace) bind(c, name="setenv")
            use, intrinsic :: iso_c_binding
            implicit none
            character(c_char), intent(in) :: c_name(*)
            character(c_char), intent(in) :: c_value(*)
            integer(c_int)   , intent(in) :: c_replace
            integer(c_int)                :: setenv
         end function setenv
      end interface

      result = setenv(name, value, replace)
   end subroutine set_environment_variable
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   impure subroutine unset_environment_variable(name, result)
      use, intrinsic :: iso_c_binding
      implicit none
      character(c_char), intent(in)  :: name(*)
      integer(c_int),    intent(out) :: result

      interface
         function unsetenv(c_name) bind(c, name="unsetenv")
            use, intrinsic :: iso_c_binding
            implicit none
            character(c_char), intent(in) :: c_name(*)
            integer(c_int)                :: unsetenv
         end function unsetenv
      end interface

      result = unsetenv(name)
   end subroutine unset_environment_variable
!===============================================================================

end module forenv