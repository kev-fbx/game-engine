#pragma once

#ifdef LEIDO_PLATFORM_WINDOWS

extern Leido::Application* Leido::CreateApplication();

int main(int argc, char** argv)
{
	Leido::Log::Init();
	LEIDO_CORE_WARN("Initalised logger"); 

	auto app = Leido::CreateApplication();
	app->Run();
	delete app;
}
#endif