contract c18340{
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
        totalSupply = 100000000000000000;  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = "EthereumPrivate";                                   // Set the name for display purposes
        symbol = "ETHP";                               // Set the symbol for display purposes
    }
}