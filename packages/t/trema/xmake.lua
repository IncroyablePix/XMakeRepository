package("trema")
    set_homepage("https://github.com/IncroyablePix/Trema")
    set_description("Trema is a C++ framework for creating Graphical User Interfaces (GUIs) on Windows, Linux and macOS.")
    set_license("MIT")
    set_policy("package.strict_compatibility", true)
    add_urls("https://github.com/IncroyablePix/Trema.git")
	
	-- add_versions("2022.12.18", "8574311f4b544fa89a3d8c3ee79d1929")


    on_load(function (package)
        package:addenv("PATH", "bin")
        if not package:config("shared") then
            package:add("defines", "TREMA_STATIC")
        end
    end)

    on_install(function (package)
        local configs = {}
        if package:is_debug() then
            configs.mode = "debug"
        else
            configs.mode = "release"
        end
        import("package.tools.xmake").install(package, configs)
    end)
