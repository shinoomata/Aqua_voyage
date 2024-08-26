// Entry point for the build script in your package.json
import "chartkick/chart.js"
import "@hotwired/turbo-rails"

// Stimulusを使用してコントローラーを登録
import { Application } from "stimulus";
import AutocompleteController from "./controllers/autocomplete_controller";
import LoadingController from "./controllers/loading_controller";

const application = Application.start();

// 手動でコントローラーをロード
application.register("autocomplete", AutocompleteController);
application.register("loading", LoadingController);