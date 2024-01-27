contract c18461{
    // This is a constructor function 
    // which means the following function name has to match the contract name declared above
    function InfinitiEstate() {
        balances[msg.sender] = 500000000;               // Give the creator all initial tokens. This is set to 1000 for example. If you want your initial tokens to be X and your decimal is 5, set this value to X * 100000. (CHANGE THIS)
        totalSupply = 500000000;                        // Update total supply (1000 for example) (A L F A C O I N)
        name = "AlfaCoin";                                   // Set the name for display purposes (A L F A C O I N)
        decimals = 0;                                               // Amount of decimals for display purposes (A L F A C O I N)
        symbol = "ALFA";                                             // Set the symbol for display purposes (A L F A C O I N)
                                              // Set the price of your token for the ICO (A L F A C O I N)
        fundsWallet = msg.sender;                                    // The owner of the contract gets ETH
    }
}