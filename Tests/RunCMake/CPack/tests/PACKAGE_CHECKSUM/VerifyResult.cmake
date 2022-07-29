if(NOT ${RunCMake_SUBTEST_SUFFIX} MATCHES "invalid")
  string(TOLOWER ${RunCMake_SUBTEST_SUFFIX} CHECKSUM_EXTENSION)
  file(GLOB PACKAGE RELATIVE ${bin_dir} "*.tar.gz")
  file(STRINGS ${PACKAGE}.${CHECKSUM_EXTENSION} CHSUM_VALUE)
  file(${RunCMake_SUBTEST_SUFFIX} ${PACKAGE} expected_value )
  set(expected_value "${expected_value}  ${PACKAGE}")

  if(NOT expected_value STREQUAL CHSUM_VALUE)
    message(FATAL_ERROR "Generated checksum is not valid! Expected [${expected_value}] Got [${CHSUM_VALUE}]")
  endif()
endif()