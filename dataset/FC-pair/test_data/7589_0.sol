contract c7589{
    /**
     * Constructor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    function TokenERC20() public {
        totalSupply = 194000000 * 10 ** uint256(decimals);  // Update total supply with the decimal amount
        balanceOf[msg.sender] = 194000000;                // Give the creator all initial tokens
        name = "MilMobi Token";                                   // Set the name for display purposes
        symbol = "MMT";                               // Set the symbol for display purposes
    }
}