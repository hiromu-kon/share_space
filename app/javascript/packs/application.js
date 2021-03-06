// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require('jquery')
import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require('./top_button')
require('./header_follow')
require('./image_preview')
require('./fade_in')
require('./flash_remove.js')
require('./header_dropdown.js')
require('./word_count.js')
require('./curtain.js')
require('./humburger_menu.js')
require('./marker.js')



Rails.start()
// Turbolinks.start()
ActiveStorage.start()
