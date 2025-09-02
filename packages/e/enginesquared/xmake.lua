package("enginesquared")
    set_description("The enginesquaredcore package")
    add_deps("entt")
    add_deps("spdlog")
    add_deps("fmt")
    add_deps("glm")

    add_urls("https://github.com/EngineSquared/EngineSquared.git")

    add_versions("v0.1.0", "c93dc690c80147a9c208cc5cd921335b61ed53a6")
    add_versions("webgpu", "7cd0ecfb587e87939e1481f508cf8941cc85b2d8")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        -- TODO check includes and interfaces
        assert(package:has_cxxtypes("Core", {includes = "Core.h"})
    end)
