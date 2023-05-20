program setenv

   use            :: forenv
   use, intrinsic :: iso_c_binding

   implicit none

   character(c_char), dimension(256) :: env_name, env_value
   integer(c_int)                    :: result

   env_name  = 'MY_VARIABLE'
   env_value = 'my_value'

   call set_environment_variable(env_name, env_value, 1, result)

   if (result == 0) then
      print *, 'Environment variable set successfully'
   else
      print *, 'Failed to set environment variable'
   end if

end program setenv
