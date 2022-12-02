// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DisplayController from "./display_controller"
application.register("display", DisplayController)

import TerrainController from "./terrain_controller"
application.register("terrain", TerrainController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import ProfileController from "./profile_controller"
application.register("profile", ProfileController)

import TypedJsController from "./typed_js_controller"
application.register("typed-js", TypedJsController)

import FooterController from "./footer_controller"
application.register("footer", FooterController)
