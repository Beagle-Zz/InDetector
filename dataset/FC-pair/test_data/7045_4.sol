contract c7045{
    /**
     * @dev Two admnistrator can replace key of third administrator.
     * @param _oldAddress Address of adminisrator needs to be replaced
     * @param _newAddress Address of new administrator
     */
    function updateAdministratorKey(address _oldAddress, address _newAddress) external onlyAdmin {
        // input verifications
        require( isAdministrator(_oldAddress) );
        require( _newAddress != 0x00 );
        require( !isAdministrator(_newAddress) );
        require( msg.sender != _oldAddress );
        // count confirmation
        uint256 remaining;
        // start of updating process, first signer will finalize address to be replaced
        // and new address to be registered, remaining two must confirm
        if (updating.confirmations == 0) {
            updating.signer[updating.confirmations] = msg.sender;
            updating.oldAddress = _oldAddress;
            updating.newAddress = _newAddress;
            updating.confirmations = updating.confirmations.add(1);
            remaining = required.sub(updating.confirmations);
            emit UpdateConfirmed(msg.sender,_newAddress,remaining);
            return;
        }
        // violated consensus
        if (updating.oldAddress != _oldAddress) {
            emit Violated("Old addresses do not match",msg.sender);
            ResetUpdateState();
            return;
        }
        if (updating.newAddress != _newAddress) {
            emit Violated("New addresses do not match", msg.sender);
            ResetUpdateState();
            return;
        }
        // make sure admin is not trying to spam
        if (msg.sender == updating.signer[0]) {
            emit Violated("Signer is spamming", msg.sender);
            ResetUpdateState();
            return;
        }
        updating.signer[updating.confirmations] = msg.sender;
        updating.confirmations = updating.confirmations.add(1);
        remaining = required.sub(updating.confirmations);
        if (remaining == 0) {
            if (msg.sender == updating.signer[0]) {
                emit Violated("One of signers is spamming",msg.sender);
                ResetUpdateState();
                return;
            }
        }
        emit UpdateConfirmed(msg.sender,_newAddress,remaining);
        // if two confirmation are done, register new admin and remove old one
        if (updating.confirmations == 2) {
            emit KeyReplaced(_oldAddress, _newAddress);
            ResetUpdateState();
            delete administrators[_oldAddress];
            administrators[_newAddress] = true;
            return;
        }
    }
}