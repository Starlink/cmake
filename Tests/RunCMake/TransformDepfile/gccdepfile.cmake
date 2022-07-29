if(EXISTS "${RunCMake_SOURCE_DIR}/${name}.d.txt")
  file(READ "${RunCMake_SOURCE_DIR}/${name}.d.txt" expected_contents)

  if(EXISTS "${RunCMake_TEST_BINARY_DIR}/out.d")
    file(READ "${RunCMake_TEST_BINARY_DIR}/out.d" actual_contents)
    if(NOT actual_contents STREQUAL expected_contents)
      string(REPLACE "\n" "\n  " p_expected_contents "${expected_contents}")
      string(REPLACE "\n" "\n  " p_actual_contents "${actual_contents}")
      string(APPEND RunCMake_TEST_FAILED "Expected contents of ${RunCMake_TEST_BINARY_DIR}/out.d:\n  ${p_expected_contents}\nActual contents:\n  ${p_actual_contents}")
    endif()
  else()
    string(APPEND RunCMake_TEST_FAILED "${RunCMake_TEST_BINARY_DIR}/out.d should exist\n")
  endif()
elseif(EXISTS "${RunCMake_TEST_BINARY_DIR}/out.d")
  string(APPEND RunCMake_TEST_FAILED "${RunCMake_TEST_BINARY_DIR}/out.d should not exist\n")
endif()
