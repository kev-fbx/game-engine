#pragma once

#ifdef LEIDO_PLATFORM_WINDOWS
	#ifdef LEIDO_BUILD_DLL
		#define LEIDO_API __declspec(dllexport)
	#else
		#define LEIDO_API __declspec(dllimport)
	#endif
#else
	#error Leido only supports Windows!
#endif