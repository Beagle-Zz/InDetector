contract c18460{
    // This is a constructor function 
    // which means the following function name has to match the contract name declared above
    function WagerGames() {
        balances[msg.sender] = 500000000;               // Give the creator all initial tokens. This is set to 1000 for example. If you want your initial tokens to be X and your decimal is 5, set this value to X * 100000. (CHANGE THIS)
        totalSupply = 500000000;                        // Update total supply (1000 for example) (Alfacoin)
        name = "Alfacoin";                                   // Set the name for display purposes (Alfacoin)
        decimals = 0;                                               // Amount of decimals for display purposes (Alfacoin)
        symbol = "ALFA";                                             // Set the symbol for display purposes (Alfacoin)
                                              // Set the price of your token for the ICO (Alfacoin)
        fundsWallet = msg.sender;                                    // The owner of the contract gets ETH
    }
}