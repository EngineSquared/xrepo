local project_name = "${TARGET_NAME}"

set_project(project_name)
add_rules("mode.debug", "mode.release")

add_repositories("EngineSquaredrepo https://github.com/EngineSquared/xrepo.git")
add_requires(
    "enginesquared 0.3.3",
    "gtest v1.17.0",
    { debug = is_mode("debug") })

includes("src/plugin/hello-world/xmake.lua")

add_rules("plugin.compile_commands.autoupdate", {outputdir = ".vscode"})
target(project_name)
    set_kind("binary")
    set_languages("c++20")

    add_deps("PluginHelloWorld")

    add_files("src/project/**.cpp")

    add_includedirs("$(projectdir)/src/")

    set_rundir("$(projectdir)")

${FAQ}
