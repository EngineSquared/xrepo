#include "HelloWorldPlugin.hpp"
#include <Engine.hpp>

int main(int ac, char **av) {
  Engine::Core core;

  core.AddPlugins<HelloWorld::Plugin>();

  core.RunSystems();

  return 0;
}
