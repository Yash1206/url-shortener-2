import React, { Component } from "react";

class AddUrlForm extends Component {
  constructor() {
    super();
    this.state = {
      original: "",
    };
  }

  handleChange = (e) => {
    e.preventDefault();
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const api = "/api/v1/urls/";
    const url = {
      original: this.state.original,
    };
    fetch(api, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(url),
    }).then((response) => {
      this.props.handleResponse(response);
      this.setState({ original: "" });
    });
  };

  render() {
    return (
      <form>
        <div className="form-group">
          <input
            type="text"
            className="form-control"
            placeholder="Enter Original Url"
            value={this.state.original}
            onChange={this.handleChange}
            name="original"
          />
        </div>
        <div className="d-flex justify-content-end">
          <button
            type="submit"
            onClick={this.handleSubmit}
            className="btn btn-link "
          >
            Submit
          </button>
        </div>
      </form>
    );
  }
}

export default AddUrlForm;
