// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"
import Alpine from "alpinejs"

window.Alpine = Alpine

document.addEventListener("DOMContentLoaded", function () {
    window.Alpine.start();
})