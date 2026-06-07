#include <gtest/gtest.h>
#include <Engine.hpp>

void TestSystem(Engine::Core &core)
{
    core.GetResource<std::uint8_t>() = 67;
}

TEST(HelloWorld, SmokeTest)
{
    Engine::Core core;

    core.RegisterResource<std::uint8_t>(42);

    core.RegisterSystem(TestSystem);

    core.RunSystems();

    ASSERT_EQ(core.GetResource<std::uint8_t>(), 67);
}
