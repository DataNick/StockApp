var Stock = React.createClass({

    render: function() {
      return (
        <div>
           <h2 id='symbol'>{this.props.name}</h2>
           <h3 id='price'>{this.props.last_price}</h3>
           <ul>
           <li>Symbol: {this.props.symbol}</li>
           <li>Stock Exchange: { this.props.exchange}</li>
           </ul>
        </div>

      );
     }
});
