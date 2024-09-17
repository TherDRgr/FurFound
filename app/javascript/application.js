import "@hotwired/turbo-rails"
import "controllers"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import { Turbo } from "@hotwired/turbo-rails"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Import the hamburger menu functionality
import "hamburger_menu";