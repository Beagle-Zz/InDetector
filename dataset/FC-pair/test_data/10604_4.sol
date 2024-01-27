contract c10604{
    /*
        @notice Sets the total max amount in ETH for the accounts to hold,
            any exceeding funds will be sent to the coldWallet.
        @param limit Max amount in wei
    */
    function setLimitEth(uint256 limit) public onlyOwner returns (bool) {
        limitEth = limit;
        return true;
    }
}