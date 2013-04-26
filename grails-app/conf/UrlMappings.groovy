class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "navigation", action: "home")
		"/home"(controller: "navigation", action: "home")
		"500"(view:'/error')
	}
}
