project "ImGui-Node-Editor"
    kind "StaticLib"
    language "C++"
    
    targetdir ("imgui/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("imgui/obj/" .. outputdir .. "/%{prj.name}")

    files
    {
        "imgui_bezier_math.h",
        "imgui_bezier_math.inl",
        "imgui_canvas.h",
        "imgui_canvas.cpp",
        "imgui_extra_math.h",
        "imgui_extra_math.inl",
        "imgui_node_editor.h",
        "imgui_node_editor.cpp",
        "imgui_node_editor_api.cpp",
        "imgui_node_editor_internal.h",
        "imgui_node_editor_internal.inl",
    }
    
    includedirs {
        "%{wks.location}\\dependencies\\imgui",
        "%{wks.location}\\dependencies\\json"
    }

    links { 
        "imgui"
    }

    disablewarnings {
        "26812"
    }
    
    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

    filter { "system:windows", "configurations:Debug" }
        buildoptions "/MTd"
        
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"
