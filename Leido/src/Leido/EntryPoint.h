#pragma once

#ifdef LEIDO_PLATFORM_WINDOWS

extern Leido::Application* Leido::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Leido::CreateApplication();
	app->Run();
	delete app;
}
#endif