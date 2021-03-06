cmake_minimum_required (VERSION 3.6)

set_property (GLOBAL PROPERTY USE_FOLDERS ON)

set (CMAKE_SUPPRESS_REGENERATION 1)
set (CMAKE_CONFIGURATION_TYPES Debug;Release;RelWithDebInfo)
set (CMAKE_DEBUG_POSTFIX "Debug")

add_definitions (-DUNICODE -D_UNICODE)

project (EmscriptenCMakeMinimal)

# WebApp

set (WebAppSourcesFolder Sources/WebApp)
file (GLOB
	WebAppSourceFiles
	${WebAppSourcesFolder}/*.hpp
	${WebAppSourcesFolder}/*.cpp
)
set (
	WebAppFiles
	${WebAppSourceFiles}
)

add_executable (WebApp ${WebAppFiles})
if (${EMSCRIPTEN})
	set_target_properties (WebApp PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE}")
	target_link_options (WebApp PUBLIC "-sEXPORTED_FUNCTIONS=[\"_main\", \"_MeaningOfLife\"]")
	target_link_options (WebApp PUBLIC "-sEXTRA_EXPORTED_RUNTIME_METHODS=[\"ccall\", \"cwrap\"]")
	target_link_options (WebApp PUBLIC -sALLOW_MEMORY_GROWTH=1 --no-heap-copy)
	set (WebSiteSourcesFolder Sources/WebSite)
	get_filename_component (WebSiteSourcesFolderFullPath "${WebSiteSourcesFolder}" ABSOLUTE)
	add_custom_command (TARGET WebApp POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_directory "${WebSiteSourcesFolderFullPath}" $<TARGET_FILE_DIR:WebApp>
	)
else ()
	target_compile_options (WebApp PUBLIC "$<$<CONFIG:Debug>:-DDEBUG>")
	set_target_properties (WebApp PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<CONFIG>")
endif ()
if (WIN32)
	target_compile_options (WebApp PUBLIC /W4 /WX)
else ()
	target_compile_options (WebApp PUBLIC -Wall -Wextra -Werror)
endif ()
