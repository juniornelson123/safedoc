// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import scss from "../css/app.scss"
import UIkit from 'uikit';
import Icons from 'uikit/dist/js/uikit-icons';

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// loads the Icon plugin
UIkit.use(Icons);

// components can be called from the imported UIkit reference
// UIkit.notification('Hello world.');

document.getElementById("customer_kind").addEventListener("change", (e) => {
  if(e.target.value == "juridical"){
    document.getElementById("juridical").classList.remove("isHidden");
    document.getElementById("individual").classList.add("isHidden");
  }else {
    document.getElementById("juridical").classList.add("isHidden");
    document.getElementById("individual").classList.remove("isHidden");
  }
});