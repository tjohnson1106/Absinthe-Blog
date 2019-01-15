import React, { Component } from "react";
import ReactDOM from "react-dom";

import css from "../css/app.css";
import "phoenix_html";

export default class App extends Component {
  render() {
    return (
      <div className="root">
        <h1>React App Setup</h1>
        <h2> React Phoenix </h2>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById("app"));
