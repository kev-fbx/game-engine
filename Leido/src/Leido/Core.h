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

#ifdef LEIDO_ENABLE_ASSERTS
	#define LEIDO_ASERT(x, ...) { if (!x) { LEIDO_ERROR("Assertion failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define LEIDO_CORE_ASSERT(x, ...) { if(!x) { LEIDO_CORE_ERROR("Assertion failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define LEIDO_ASSERT(x, ...)
	#define LEIDO_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)