program unsetenv

   use            :: forenv
   use, intrinsic :: iso_c_binding

   implicit none

   character(c_char), dimension(256) :: env_name, env_value
   integer(c_int)                    :: result

   env_name  = 'MY_VARIABLE'

   call unset_environment_variable(env_name, result)

end program unsetenv
