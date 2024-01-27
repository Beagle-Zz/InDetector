contract c18476{
    /// @dev Converts ETH dividends to RAMEN tokens.
    function reinvestDividend() onlyOwner public {
       RamenContract.reinvest();
    }
}