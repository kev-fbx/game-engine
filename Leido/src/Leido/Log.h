#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"

namespace Leido
{
	class LEIDO_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

/* Core log macros */
#define LEIDO_CORE_TRACE(...)	::Leido::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define LEIDO_CORE_INFO(...)	::Leido::Log::GetCoreLogger()->info(__VA_ARGS__)
#define LEIDO_CORE_WARN(...)	::Leido::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define LEIDO_CORE_ERROR(...)	::Leido::Log::GetCoreLogger()->error(__VA_ARGS__)
#define LEIDO_CORE_FATAL(...)	::Leido::Log::GetCoreLogger()->fatal(__VA_ARGS__)

/* Client logmacros */
#define LEIDO_TRACE(...)	::Leido::Log::GetClientLogger()->trace(__VA_ARGS__)
#define LEIDO_INFO(...)	::Leido::Log::GetClientLogger()->info(__VA_ARGS__)
#define LEIDO_WARN(...)	::Leido::Log::GetClientLogger()->warn(__VA_ARGS__)
#define LEIDO_ERROR(...)	::Leido::Log::GetClientLogger()->error(__VA_ARGS__)
#define LEIDO_FATAL(...)	::Leido::Log::GetClientLogger()->fatal(__VA_ARGS__)