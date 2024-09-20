import { Controller } from "stimulus";
import axios from "axios";

export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
    //console.log("Autocomplete connected"); // Debugging用のログ
    this.inputTarget.addEventListener("input", this.suggest.bind(this));
  }

  suggest() {
    const query = this.inputTarget.value;

    //console.log("URL:", this.data.get("urlValue")); // URLをログに出力
    //console.log("Query:", query); // クエリもログに出力


    if (query.length < 2) {
      this.listTarget.innerHTML = "";
      return;
    }

    axios.get(this.data.get("urlValue"), { params: { q: query } })
      .then((response) => {

        this.clearList();

        response.data.forEach((result) => {
          const item = document.createElement("li");
          item.textContent = result.label;
          item.classList.add("autocomplete-item");
          item.addEventListener("click", () => {
            this.inputTarget.value = result.value;
            this.listTarget.innerHTML = "";
          });

          this.listTarget.appendChild(item);
        });
      })
      .catch((error) => {
        console.error("There was an error fetching autocomplete results:", error);
      });
  }

  clearList() {
    this.listTarget.innerHTML = ""; // リストのクリア
  }

  // ここでEnterキーのイベントをキャンセルすることで、サジェストのリストが増え続けるのを防ぎます
  preventEnterKey(e) {
    if (e.key === "Enter") {
      e.preventDefault();
    }
  }
}
