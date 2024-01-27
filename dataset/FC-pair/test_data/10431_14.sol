contract c10431{
    /**
    * @dev Finish the game
    *
    * If the time is older than FinishTime (usually one month after game).
    * The owner has permission to transfer the balance to the feeOwner.
    * The user can get back the balance using the website after this time.
    */
    function finish() onlyOwner public {
        require(block.timestamp >= finishTime);
        feeOwner.transfer(address(this).balance);
    }
}