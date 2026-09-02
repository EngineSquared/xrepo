package("enginesquared")
    set_kind("library")
    set_description("The enginesquaredcore package")

    add_configs("core_only", {description = "Build the engine core and the utils only, without the plugins",
                              default = false, type = "boolean"})

    add_deps("entt v3.15.0")
    add_deps("gtest v1.17.0")
    add_deps("spdlog v1.16.0")
    add_deps("fmt 12.1.0")

    add_urls("https://github.com/EngineSquared/EngineSquared.git")

    add_versions("0.3.6", "54f039fbdcd8a3fcb1d9092513fed964ce75463f")
    add_versions("0.3.5", "e70c7a8bbc1ab91280ba7ee81ad00dd8b0fd9bb8")
    add_versions("0.3.4", "3e9a8525ff1b3fe0762ed935859d85bb6697af5a")
    add_versions("0.3.3", "c7a6de65e8f5c16b419e0b683764172d7c889b51")
    add_versions("0.3.2", "76cd2cf83efc6a2f0139735cadacfd98cb20159f")
    add_versions("0.3.1", "e480ac2600be5262080f383d33985de8af27cfcb")
    add_versions("v0.3.0", "d5a87e7e96c49164d75d37950e85eec158781748")
    add_versions("v0.1.0", "e6b7ea2cf6aa49c5d45be7eff31aecd529b4cfd1")
    add_versions("webgpu", "a9eaf4e83e0077d288ece929556de7258ce76510")

    on_load(function (package)
        if package:config("core_only") then
            return
        end
        for _, dep in ipairs({"tinyobjloader v2.0.0rc13",
                              "glm 1.0.1",
                              "glfw 3.4",
                              "freetype 2.14.1",
                              "zlib 1.3.1",
                              "stb 2025.03.14",
                              "miniaudio 0.11.23",
                              "lodepng 2025.05.06",
                              "wgpu-native ^24.0.0",
                              "glfw3webgpu v1.3.0-alpha",
                              "joltphysics v5.4.0",
                              "rmlui 6.2"}) do
            package:add("deps", dep)
        end
    end)

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        if package:config("core_only") then
            configs.CoreOnly = "y"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            void test() {
                Engine::Core core;

                core.RunSystems();
            }
        ]]}, {configs = {languages = "cxx20"}, includes = {"core/Core.hpp"}}))
    end)
