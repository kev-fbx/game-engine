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

project "Leido"
	location "Leido"
	kind "SharedLib"
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
		"Leido/vendor/spdlog/include"
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