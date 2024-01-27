contract c8498{
    // ------------------------------------------------------------------------
    // Retrieve Faucet's balance 
    // ------------------------------------------------------------------------
    function tokenBalance() public view returns (uint)  {
        return ERC20Interface(faucetTokenAddress).balanceOf(this);
    }
}