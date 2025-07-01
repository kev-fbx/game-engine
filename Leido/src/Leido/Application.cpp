#include "Application.h"

#include "Leido/Events/ApplicationEvent.h"
#include "Leido/Log.h"

namespace Leido
{
	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		LEIDO_TRACE(e);

		while (true);
	}
}