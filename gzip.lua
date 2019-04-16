-- scaffold geniefile for gzip

gzip_script = path.getabsolute(path.getdirectory(_SCRIPT))
gzip_root = path.join(gzip_script, "gzip")

gzip_includedirs = {
	path.join(gzip_script, "config"),
	gzip_root,
}

gzip_libdirs = {}
gzip_links = {}
gzip_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { gzip_includedirs }
	end,

	_add_defines = function()
		defines { gzip_defines }
	end,

	_add_libdirs = function()
		libdirs { gzip_libdirs }
	end,

	_add_external_links = function()
		links { gzip_links }
	end,

	_add_self_links = function()
		links { "gzip" }
	end,

	_create_projects = function()

project "gzip"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		gzip_includedirs,
	}

	defines {}

	files {
		path.join(gzip_script, "config", "**.h"),
		path.join(gzip_root, "**.h"),
		path.join(gzip_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
