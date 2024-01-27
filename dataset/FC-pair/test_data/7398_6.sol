contract c7398{
    // This is a constructor function
    // which means the following function name has to match the contract name declared above
    function CoinLLeague() {
        balances[msg.sender] = 500000000000000000000000000;               // Give the creator all initial tokens. This is set to 1000 for example. If you want your initial tokens to be X and your decimal is 5, set this value to X * 100000. (CHANGE THIS)
        totalSupply = 500000000000000000000000000;                        // Update total supply (1000 for example) (CHANGE THIS)
        name = "CoinLeague";                                   // Set the name for display purposes (CHANGE THIS)
        decimals = 18;                                               // Amount of decimals for display purposes (CHANGE THIS)
        symbol = "CLG";                                             // Set the symbol for display purposes (CHANGE THIS)
        unitsOneEthCanBuy = 1500000;                                      // Set the price of your token for the ICO (CHANGE THIS)
        fundsWallet = msg.sender;                                    // The owner of the contract gets ETH
    }
}