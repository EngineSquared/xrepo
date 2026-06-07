#include "plugin/PluginHelloWorld.hpp"
#include "system/HelloWorld.hpp"

void HelloWorld::Plugin::Bind()
{
    RegisterSystems<Engine::Scheduler::Update>(HelloWorld::HelloWorld);
}
