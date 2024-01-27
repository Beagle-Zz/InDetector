contract c4253{
    // This is a constructor function 
    // which means the following function name has to match the contract name declared above
    function EarthMedz() {
        balances[msg.sender] =  1000000000000000000;               // Give the creator all initial tokens. This is set to 1000 for example. If you want your initial tokens to be X and your decimal is 5, set this value to X * 100000. (CHANGE THIS)
        totalSupply = 1000000000000000000;                        // Update total supply (1000 for example) (ZIGICOIN )
        name = "ZIGICOIN";                                   // Set the name for display purposes (ZIGICOIN  )
        decimals = 8;                                               // Amount of decimals for display purposes (ZIGICOIN )
        symbol = "ZIGI";                                             // Set the symbol for display purposes (ZIGICOIN  )
                                              // Set the price of your token for the ICO (ZIGICOIN  )
        fundsWallet = msg.sender;                                    // The owner of the contract gets ETH
    }
}