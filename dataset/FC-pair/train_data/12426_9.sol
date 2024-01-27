contract c12426{
    /** @dev Function which set the owner of the wallet.
      * Only owner can call the function.
      * Called when the contract is deploying.
      */
    function setOwnerWallet(address _newOwnerWallet) public onlyOwner {
        emit LogNew(ownerWallet, _newOwnerWallet);
        ownerWallet = _newOwnerWallet;
    }
}