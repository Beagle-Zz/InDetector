contract c13345{
    /// @dev Computes owner's cut of a sale.
    /// @param _price - Sale price of NFT.
    function _computeFee(uint128 _price) internal view returns (uint128) {
        // NOTE: We don't use SafeMath (or similar) in this function because
        //  all of our entry functions carefully cap the maximum values for
        //  currency (at 128-bits), and ownerFee <= 10000 (see the require()
        //  statement in the ClockAuction constructor). The result of this
        //  function is always guaranteed to be <= _price.
        return _price * ownerFee / 10000;
    }
}