contract c12911{
    /**
     * Transfer remains to owner in case if impossible to do min invest
     */
    function getMainRemainCoins() onlyOwner public {
        uint mainRemains = MAIN_MAX_CAP - mainCoinSentToEther;
        Backer storage backer = mainBackers[owner];
        coin.transfer(owner, mainRemains); 
        backer.coinSent = backer.coinSent.add(mainRemains);
        mainCoinSentToEther = mainCoinSentToEther.add(mainRemains);
        LogCoinsEmited(this ,mainRemains);
        LogReceivedETH(owner, mainEtherReceived); 
    }
}