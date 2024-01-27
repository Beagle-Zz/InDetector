contract c16018{
    /**
    * @dev Reset team states and recalculate the price.
    *
    * This function will be called by opponent team token after end game.
    * It accepts the ETH transfer and recalculate the new price based on
    * new balance and total supply.
    */
    function transferFundAndEndGame() payable public {
        require(gameOpponent != address(0) && gameOpponent == msg.sender);
        if (msg.value > 0 && totalSupply_ > 0) {
            price = address(this).balance.div(totalSupply_);
        }
        endGameInternal();
    }
}