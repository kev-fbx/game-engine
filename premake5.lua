workspace "Leido"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Leido/vendor/GLFW/include"

include "Leido/vendor/GLFW"

project "Leido"
	location "Leido"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "leidopch.h"
	pchsource "Leido/src/leidopch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Leido/src",
		"Leido/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
		"LEIDO_PLATFORM_WINDOWS",
		"LEIDO_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPYFILE} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
		}

	filter "configurations:Debug"
		defines "LEIDO_DEBUG"
		symbols "On"

		
	filter "configurations:Release"
		defines "LEIDO_RELEASE"
		optimize "On"

		
	filter "configurations:Dist"
		defines "LEIDO_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"$(SolutionDir)Leido/vendor/spdlog/include",
		"$(SolutionDir)Leido/src"
	}

	links
	{
		"Leido"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
		"LEIDO_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "LEIDO_DEBUG"
		symbols "On"

		
	filter "configurations:Release"
		defines "LEIDO_RELEASE"
		optimize "On"

		
	filter "configurations:Dist"
		defines "LEIDO_DIST"
		optimize "On"