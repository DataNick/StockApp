var Stocks = React.createClass({

    render: function() {
      return (
        <div>
           <h2 id='symbol'>{this.props.name}</h2>
           <ul>
           <li>Symbol: {this.props.symbol}</li>
           <li>Stock Price: {this.props.last_price}</li>
           </ul>
        </div>

      );
     }
});
