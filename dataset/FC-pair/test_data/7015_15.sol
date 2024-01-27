contract c7015{
    //These methods return information about the exchanger, and the buy / sell rates offered on the Token / ETH pairing.
    //They can be called without gas from any client.
    /**  
     @dev Audit the reserve balances, in the base token and in ether
     returns: [token balance, ether balance - ledger]
     */
    function getReserveBalances() public view returns (uint256, uint256) {
        return (tokenContract.balanceOf(this), address(this).balance+virtualReserveBalance);
    }
}