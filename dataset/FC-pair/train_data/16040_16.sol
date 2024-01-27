contract c16040{
    /**
    * @dev End the game with game final result.
    *
    * The function only allow to be called with the lose team or the draw team with large balance.
    * We have this rule because the lose team or draw team will large balance need transfer balance to opposite side.
    * This function will also change status of opposite team by calling transferFundAndEndGame function.
    * So the function only need to be called one time for the home and away team.
    * The new price will be recalculated based on the new balance and total supply.
    *
    * Balance transfer rule:
    * 1. The rose team will transfer all balance to opposite side.
    * 2. If the game is draw, the balances of two team will go fifty-fifty.
    * 3. If game is canceled, the balance is not touched and the game states will be reset to initial states.
    * 4. The fee will be 5% of each transfer amount.
    * @param _gameOpponent The game opponent contract address
    * @param _gameResult game result. 1=lose, 2=draw, 3=cancel, 4=win (not allow)
    */
    function endGame(address _gameOpponent, uint8 _gameResult) onlyOwner public {
        require(gameOpponent != address(0) && gameOpponent == _gameOpponent);
        uint256 amount = address(this).balance;
        uint256 opAmount = gameOpponent.balance;
        require(_gameResult == 1 || (_gameResult == 2 && amount >= opAmount) || _gameResult == 3);
        TeamToken op = TeamToken(gameOpponent);
        if (_gameResult == 1) {
            // Lose
            if (amount > 0 && totalSupply_ > 0) {
                uint256 lostAmount = amount;
                // If opponent has supply
                if (op.totalSupply() > 0) {
                    // fee is 5%
                    uint256 feeAmount = lostAmount.div(20);
                    lostAmount = lostAmount.sub(feeAmount);
                    feeOwner.transfer(feeAmount);
                    op.transferFundAndEndGame.value(lostAmount)();
                } else {
                    // If opponent has not supply, then send the lose money to fee owner.
                    feeOwner.transfer(lostAmount);
                    op.transferFundAndEndGame();
                }
            } else {
                op.transferFundAndEndGame();
            }
        } else if (_gameResult == 2) {
            // Draw
            if (amount > opAmount) {
                lostAmount = amount.sub(opAmount).div(2);
                if (op.totalSupply() > 0) {
                    // fee is 5%
                    feeAmount = lostAmount.div(20);
                    lostAmount = lostAmount.sub(feeAmount);
                    op = TeamToken(gameOpponent);
                    feeOwner.transfer(feeAmount);
                    op.transferFundAndEndGame.value(lostAmount)();
                } else {
                    feeOwner.transfer(lostAmount);
                    op.transferFundAndEndGame();
                }
            } else if (amount == opAmount) {
                op.transferFundAndEndGame();
            } else {
                // should not happen
                revert();
            }
        } else if (_gameResult == 3) {
            //canceled
            op.transferFundAndEndGame();
        } else {
            // should not happen
            revert();
        }
        endGameInternal();
        if (totalSupply_ > 0) {
            price = address(this).balance.div(totalSupply_);
        }
        emit EndGame(address(this), _gameOpponent, _gameResult);
    }
}