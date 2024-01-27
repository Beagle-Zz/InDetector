contract c10132{
    /**
     * Constructor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    function TokenERC20(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        totalSupply = 2000000000;  
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = "AmberCoin";                                   // Set the name for display purposes
        symbol = "AC";                               // Set the symbol for display purposes
    }
}