contract c4876{
    /**
    * @dev Verify that the borrowed tokens are returned to the bank plus a fee by the end of transaction execution.
    * @param token Address of the token to for arbitrage. 0x0 for Ether.
    * @param amount Amount borrowed.
    */
    modifier isArbitrage(address token, uint256 amount) {
        uint256 balance = IBank(bank).totalSupplyOf(token);
        uint256 feeAmount = amount.mul(fee).div(10 ** 18); 
        _;
        require(IBank(bank).totalSupplyOf(token) >= (balance.add(feeAmount)));
    }
}