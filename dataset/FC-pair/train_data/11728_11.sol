contract c11728{
    /**
     * Funds must be transfered by calling contract before calling this contract. 
     * msg.sender is address of calling contract that must be approved.
     * 
     **/
    function createLock(address _winner, uint _totalParticipationAmount, uint _tokenLockDuration) public {
        require(approvedGames[msg.sender] == true);
        require(isGameLocked[msg.sender] == false);
        //Create gameLock
        GameLock memory gameLock = GameLock(_totalParticipationAmount, block.number + _tokenLockDuration);
        gameLocks[msg.sender] = gameLock;
        isGameLocked[msg.sender] = true;
        amountLocked = safeAdd(amountLocked, _totalParticipationAmount);
        //Transfer game credits to winner
        generateChampionTokens(_winner, _totalParticipationAmount, _tokenLockDuration);
        emit LockParameters(msg.sender, _totalParticipationAmount, block.number + _tokenLockDuration);
    }
}