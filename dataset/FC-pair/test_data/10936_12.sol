contract c10936{
    //These methods return information about the exchanger, and the buy / sell rates offered on the Token / ETH pairing.
    //They can be called without gas from any client.
    /**  
     @dev Audit the reserve balances, in the base token and in ether
     */
    function getReserveBalances() public view returns (uint256, uint256) {
        return (tokenContract.balanceOf(this), address(this).balance);
    }
}