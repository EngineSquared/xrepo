package("enginesquared")
    set_description("The enginesquaredcore package")
    add_deps("entt")
    add_deps("spdlog")
    add_deps("fmt")
    add_deps("glm")

    add_urls("https://github.com/EngineSquared/EngineSquared.git")

    add_versions("v0.1.0", "c93dc690c80147a9c208cc5cd921335b61ed53a6")
    add_versions("webgpu", "8ef7d3221fc58766647298fcd33f2a89c88b6f8a")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        -- TODO check includes and interfaces
    end)
