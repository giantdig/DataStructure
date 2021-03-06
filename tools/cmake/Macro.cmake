#File defines convenience macros for available feature testing

macro(source_group_by_dir source_files)
  set(sgbd_cur_dir ${CMAKE_CURRENT_SOURCE_DIR})
  foreach(sgbd_file ${${source_files}})
    string(REGEX REPLACE "${sgbd_cur_dir}/(.*)" \\1 sgbd_fpath ${sgbd_file})
    string(REGEX REPLACE "(.*)/.*" \\1 sgbd_group_name ${sgbd_fpath})
    string(COMPARE EQUAL ${sgbd_fpath} ${sgbd_group_name} sgbd_nogroup)
    if(sgbd_nogroup)
      continue()
    endif()
    if (sgbd_file MATCHES ".*.h$")
      source_group("Header Files\\${sgbd_group_name}" FILES ${sgbd_file})
    else()
      source_group("Source Files\\${sgbd_group_name}" FILES ${sgbd_file})
    endif()
  endforeach(sgbd_file)
endmacro(source_group_by_dir)