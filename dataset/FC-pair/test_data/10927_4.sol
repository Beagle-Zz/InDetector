contract c10927{
    /**
    * @dev This is used to send tokens and execute code on other smart contract, this method is disabled if emergencyLock is activated
    *
    * @param _spender Contract that is receiving tokens
    * @param _value The amount that msg.sender is sending
    * @param _extraData Additional params that can be used on reciving smart contract
    * @return if successful returns true
    */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) lockAffected public returns (bool success) {
        tokenRecipientInterface spender = tokenRecipientInterface(_spender);
        approve(_spender, _value);
        spender.receiveApproval(msg.sender, _value, this, _extraData);
        return true;
    }
}