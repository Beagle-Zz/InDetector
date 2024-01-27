contract c4853{
    /*  ---------- Interaction with other contracts  */
    /* User can allow another smart contract to spend some shares in his behalf
    *  (this function should be called by user itself)
    *  @param _spender another contract's address
    *  @param _value number of tokens
    *  @param _extraData Data that can be sent from user to another contract to be processed
    *  bytes - dynamically-sized byte array,
    *  see http://solidity.readthedocs.io/en/v0.4.15/types.html#dynamically-sized-byte-array
    *  see possible attack information in comments to function 'approve'
    *  > this may be used to convert pre-ICO tokens to ICO tokens
    */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) public returns (bool) {
        approve(_spender, _value);
        // 'spender' is another contract that implements code as prescribed in 'allowanceRecipient' above
        allowanceRecipient spender = allowanceRecipient(_spender);
        // our contract calls 'receiveApproval' function of another contract ('allowanceRecipient') to send information about
        // allowance and data sent by user
        // 'this' is this (our) contract address
        if (spender.receiveApproval(msg.sender, _value, this, _extraData)) {
            emit DataSentToAnotherContract(msg.sender, _spender, _extraData);
            return true;
        }
        return false;
    } // end of approveAndCall
}