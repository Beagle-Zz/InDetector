contract c2736{
    /// @dev Sends initial funds to the wallet.
    function saleSuccessful()
        onlyOwner 
        external 
        atState(State.Active)
    {
        state = State.Success;
        transferToWallet(initialWei);
    }
}