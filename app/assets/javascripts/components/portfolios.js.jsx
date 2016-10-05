var Portfolios = React.createClass({
  getInitialState: function() {
    return {
      portfolios: this.props.data
    };
  },
  getDefaultProps: function() {
    return {
      portfolios: []
    };
  },
  render: function() {
    var portfolio;
    return React.DOM.div({
      className: 'portfolios'
    }, React.DOM.h2({
      className: 'name'
    }, 'Portfolios'), React.DOM.thead(React.DOM.th(null, 'Name'), React.DOM.th(null, 'Amount')))
  }
});