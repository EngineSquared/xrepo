package("pluginscene")
    set_description("The pluginscene package")
    add_deps("enginesquaredcore", "utilslog", "utilsstring")
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
