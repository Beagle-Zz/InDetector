contract c415{
    // **************************** //
    // *  Functions interacting   * //
    // *  with Pinakion contract  * //
    // **************************** //
    /** @dev Callback of approveAndCall - transfer pinakions of a juror in the contract. Should be called by the pinakion contract. TRUSTED.
     *  @param _from The address making the transfer.
     *  @param _amount Amount of tokens to transfer to Kleros (in basic units).
     */
    function receiveApproval(address _from, uint _amount, address, bytes) public onlyBy(pinakion) {
        require(pinakion.transferFrom(_from, this, _amount));
        jurors[_from].balance += _amount;
    }
}