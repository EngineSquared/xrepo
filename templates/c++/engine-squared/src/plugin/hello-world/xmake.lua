local plugin_name = "PluginHelloWorld"

target(plugin_name)
    set_kind("static")
    set_languages("c++20")

    add_packages("enginesquared", {public = true})

    add_headerfiles("src/(system/*.hpp)")
    add_headerfiles("src/(plugin/*.hpp)")
    add_headerfiles("src/(*.hpp)")

    add_includedirs("src/", {public = true})

    add_files("src/**.cpp")

for _, file in ipairs(os.files("tests/**.cpp")) do
    local name = path.basename(file)
    if name == "main" then
        goto continue
    end
    target(name)
        set_languages("c++20")
        set_kind("binary")
        set_default(false)
        if is_plat("linux") then
            add_cxxflags("--coverage", "-fprofile-arcs", "-ftest-coverage", {force = true})
            add_ldflags("--coverage")
        end
        add_packages("gtest")
        add_links("gtest")

        add_deps(plugin_name)
        add_files(file)
        add_files("tests/main.cpp")

        add_tests("default")
    ::continue::
end
