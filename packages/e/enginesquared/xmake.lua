package("enginesquared")
    set_kind("library")
    set_description("The enginesquaredcore package")
    add_deps("entt")
    add_deps("spdlog")
    add_deps("fmt")
    add_deps("glm")

    add_urls("https://github.com/EngineSquared/EngineSquared.git")

    -- add_versions("v0.1.0", "c93dc690c80147a9c208cc5cd921335b61ed53a6")
    add_versions("webgpu", "b66da6e5d19b188fc9ab3f55f10a571ea937755d")

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
