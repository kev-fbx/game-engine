#include <Leido.h>

class Sandbox : public Leido::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Leido::Application* Leido::CreateApplication()
{
	return new Sandbox();
}