#pragma once

#include "Core.h"

namespace Leido
{
	class LEIDO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	/* Will be defined in client */
	Application* CreateApplication();
}
