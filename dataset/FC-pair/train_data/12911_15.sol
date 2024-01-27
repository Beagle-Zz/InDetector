contract c12911{
    /**
    *   Refund to specific address 
    */
    function refund(address _beneficiary) onlyOwner public {
        uint valueToSend = 0;
        Backer storage preBacker = preBackers[_beneficiary];
        if (preBacker.coinReadyToSend > 0){ 
            uint preValueToSend = preBacker.coinReadyToSend.mul(1 ether).div(PRE_COIN_PER_ETHER_ICO);
            preBacker.coinSent = preBacker.coinSent.sub(preBacker.coinReadyToSend);
            preBacker.weiReceived = preBacker.weiReceived.sub(preValueToSend);   
            preEtherReceived = preEtherReceived.sub(preValueToSend); 
            preCoinSentToEther = preCoinSentToEther.sub(preBacker.coinReadyToSend);
            preBacker.coinReadyToSend = 0;
            valueToSend = valueToSend + preValueToSend;
        }
        Backer storage mainBacker = mainBackers[_beneficiary];
        if (mainBacker.coinReadyToSend > 0){ 
            uint mainValueToSend = mainBacker.coinReadyToSend.mul(1 ether).div(MAIN_COIN_PER_ETHER_ICO);
            mainBacker.coinSent = mainBacker.coinSent.sub(mainBacker.coinReadyToSend);
            mainBacker.weiReceived = mainBacker.weiReceived.sub(mainValueToSend);   
            mainEtherReceived = mainEtherReceived.sub(mainValueToSend); 
            mainCoinSentToEther = mainCoinSentToEther.sub(mainBacker.coinReadyToSend);
            mainBacker.coinReadyToSend = 0;
            valueToSend = valueToSend + mainValueToSend;
        }
        if (valueToSend > 0){
            require(_beneficiary.send(valueToSend));
        }
    }
}