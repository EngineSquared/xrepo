package("enginesquared")
    set_description("The enginesquaredcore package")
    add_deps("entt")
    add_deps("spdlog")
    add_deps("fmt")
    add_deps("glm")

    add_urls("https://github.com/EngineSquared/EngineSquared.git")

    add_versions("v0.1.0", "c93dc690c80147a9c208cc5cd921335b61ed53a6")
    add_versions("webgpu", "1dcaf59c048f85ce0e07425225e2823c8981a338")

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
