contract c10189{
    /**
    * @dev Stop burning new tokens.
    * @return true if the operation was successful.
    */
    function finishBurning() public onlyOwner canBurn returns(bool finished) {
        burningFinished = true;
        emit LogBurnFinished();
        return true;
    }
}