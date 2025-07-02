#include "leidopch.h"
#include "Application.h"

#include "Leido/Events/ApplicationEvent.h"
#include "Leido/Log.h"

namespace Leido
{
	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		while (m_Running)
		{
			m_Window->OnUpdate();
		}
	}
}