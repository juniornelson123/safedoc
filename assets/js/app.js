// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import '../css/app.scss'
import UIkit from 'uikit'
import Icons from 'uikit/dist/js/uikit-icons'

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import 'phoenix_html'

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import App from './components/App.svelte'

const target = document.querySelector('#svelte-app')
new App({ target, props: { name: 'Nelson' } })

// loads the Icon plugin
UIkit.use(Icons)

// components can be called from the imported UIkit reference
// UIkit.notification('Hello world.');
