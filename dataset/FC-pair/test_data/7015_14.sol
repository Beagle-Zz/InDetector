contract c7015{
    /**
     * The virtual reserve balance set here is added on to the actual ethereum balance of this contract
     * when calculating price for buy/sell. Note that if you have no real ether in the reserve, you will 
     * not have liquidity for sells until you have some buys first.
     */
    function setVirtualReserveBalance(uint256 amountInWei) onlyAdmin public {
        virtualReserveBalance = amountInWei;
    }
}