var Stock = React.createClass({

    render: function() {
      return (
        <div>
           <h2 id='symbol'>Company: {this.props.name}</h2>
           <h3 id='price'>Current Price: {this.props.last_price}</h3>

           <p>Ticker: {this.props.symbol}</p>

           <p>Stock Exchange: { this.props.exchange}</p>

        </div>

      );
     }
});
