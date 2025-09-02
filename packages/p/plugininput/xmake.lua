package("plugininput")
    set_description("The plugininput package")
    add_deps("enginesquaredcore", "pluginwindow", "utilslog", "utilsfunctioncontainer")
    add_deps("glm >=1.0.1")
    add_deps("glfw >=3.4")
    add_deps("entt")
    add_deps("spdlog")
    add_deps("fmt")

    add_urls("https://github.com/myrepo/foo.git")
    add_versions("1.0", "<shasum256 or gitcommit>")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        -- TODO check includes and interfaces
        -- assert(package:has_cfuncs("foo", {includes = "foo.h"})
    end)
