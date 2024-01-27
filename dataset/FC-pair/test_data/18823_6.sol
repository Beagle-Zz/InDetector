contract c18823{
    /// @dev Withdraw ETH dividends and put it to this contract.
    function withdrawDividend() onlyOwner public {
        poWtfContract.withdraw();
    }
}