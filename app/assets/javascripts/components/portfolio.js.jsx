var Record = React.createClass({
  render: function() {
    return React.DOM.tr(null, React.DOM.td(null, this.props.portfolio.name),
      React.DOM.td(null, this.props.portfolio.amount),
      React.DOM.td(null, amountFormat(this.props.portfolio.amount)));
  }
});