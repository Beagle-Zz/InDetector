contract c18476{
    /// @dev Withdraw ETH dividends and put it to this contract.
    function withdrawDividend() onlyOwner public {
        RamenContract.withdraw();
    }
}