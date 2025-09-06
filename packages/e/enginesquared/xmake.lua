package("enginesquared")
    set_kind("library")
    set_description("The enginesquaredcore package")
    add_deps("entt")
    add_deps("gtest")
    add_deps("spdlog")
    add_deps("tinyobjloader")
    add_deps("glm >=1.0.1")
    add_deps("glfw >=3.4")
    add_deps("glew")
    add_deps("fmt")
    add_deps("stb")
    add_deps("joltphysics")
    add_deps("miniaudio")
    add_deps("rmlui >=6.0")

    add_urls("https://github.com/EngineSquared/EngineSquared.git")

    -- add_versions("v0.1.0", "c93dc690c80147a9c208cc5cd921335b61ed53a6")
    add_versions("preview", "f2ce460711d5275db52875a4f5f186d06bd9ba68") --- IGNORE: this version is a version for test ---
    add_versions("webgpu", "a9eaf4e83e0077d288ece929556de7258ce76510")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        -- assert(package:check_cxxsnippets({test = [[
        --     void test(int args, char** argv) {
        --         ES::Engine::Core core;

        --         core.RunSystems();
        --     }
        -- ]]}, {configs = {languages = "cxx20"}, includes = {"Core.hpp"}}))
    end)
