// Path : app/javascript/components/GreetUser.js
import React from "react";
import PropTypes from "prop-types";

class ItemsCount extends React.Component {
  render() {
    return (
      <div className="shopping-cart-badge">
        <div>
          <i class="shopping cart orange large icon" />
          <span className="badge badge-pill badge-warning">
            {this.props.items}
          </span>
        </div>
      </div>
    );
  }
}

ItemsCount.propTypes = {
  items: PropTypes.number
};

export default ItemsCount;
