contract c7962{
    /// @dev Computes next price of token given the current sale price.
    function computeNextPrice(uint256 _salePrice)
    internal
    pure
    returns(uint256) {
        if (_salePrice < first_step_limit) {
            return SafeMath.div(SafeMath.mul(_salePrice, 200), 100);
        } else if (_salePrice < second_step_limit) {
            return SafeMath.div(SafeMath.mul(_salePrice, 135), 100);
        } else if (_salePrice < third_step_limit) {
            return SafeMath.div(SafeMath.mul(_salePrice, 125), 100);
        } else if (_salePrice < fourth_step_limit) {
            return SafeMath.div(SafeMath.mul(_salePrice, 120), 100);
        } else {
            return SafeMath.div(SafeMath.mul(_salePrice, 115), 100);
        }
    }
}