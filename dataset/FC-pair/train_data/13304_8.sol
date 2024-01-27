contract c13304{
    // The logic of finalization. Internal
    // @ Do I have to use the function      no
    // @ When it is possible to call        -
    // @ When it is launched automatically  after end of round
    // @ Who can call the function          -
    function finalization() internal {
        bytes32[] memory params = new bytes32[](0);
        // If the goal of the achievement
        if (goalReached()) {
            financialStrategy.setup(1,params);//Для контракта Buz деньги не возвращает.
            // if there is anything to give
            if (tokenReserved > 0) {
                token.mint(rightAndRoles.wallets(3,0),tokenReserved);
                // Reset the counter
                tokenReserved = 0;
            }
            // If the finalization is Round 1
            if (TokenSale == TokenSaleType.round1) {
                // Reset settings
                isInitialized = false;
                isFinalized = false;
                if(financialStrategy.freeCash() == 0){
                    rightAndRoles.setManagerPowerful(true);
                }
                // Switch to the second round (to Round2)
                TokenSale = TokenSaleType.round2;
                // Reset the collection counter
                weiRound1 = weiRaised();
                ethWeiRaised = 0;
                nonEthWeiRaised = 0;
            }
            else // If the second round is finalized
            {
                // Permission to collect tokens to those who can pick them up
                chargeBonuses = true;
                totalSaledToken = token.totalSupply();
                //partners = true;
            }
        }
        else // If they failed round
        {
            financialStrategy.setup(3,params);
        }
    }
}