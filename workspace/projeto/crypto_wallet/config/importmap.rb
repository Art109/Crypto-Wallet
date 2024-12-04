# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery" , to: "https://code.jquery.com/jquery-3.7.1.js"
#pin "notify" , to: "https://cdnjs.cloudflare.com/ajax/libs/notify.js/2.0.0/notify.min.js"