// Entry point for the build script in your package.json
import "chartkick/chart.js"
import "@hotwired/turbo-rails"

// app/javascript/application.js
import { Application } from "stimulus";
import AutocompleteController from "./controllers/autocomplete_controller";

const application = Application.start();

// 手動でコントローラーをロード
application.register("autocomplete", AutocompleteController);
