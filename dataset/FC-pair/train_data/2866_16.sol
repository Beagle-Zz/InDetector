contract c2866{
    // @dev Calculates owner's cut of a sale.
    // @param _price - Sale price of cutie.
    function _computeFee(uint128 _price) internal view returns (uint128)
    {
        return _price * ownerFee / 10000;
    }
}