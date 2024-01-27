contract c12426{
    /** @dev Function which set the money manager.
      * Only owner can call the function.
      * Called when contract is deploying.
      */
    function setMoneyManager(address _moneyManager) public onlyOwner {
        emit LogNew(moneyManager, _moneyManager);
        moneyManager = _moneyManager;
    }
}