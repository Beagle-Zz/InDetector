contract c8557{
    /**
     * @dev Prevent targets from sending or receiving tokens by setting Unix time
     * @param targets Addresses to be locked funds
     * @param _cannotSendUntil Unix time when locking up sending function will be finished
     * @param _cannotReceiveUntil Unix time when locking up receiving function will be finished
     */
    function lockupAccounts(address[] targets, uint256 _cannotSendUntil, uint256 _cannotReceiveUntil) onlyOwner public {
        require(targets.length > 0);
        for(uint i = 0; i < targets.length; i++){
            require(cannotSendUntil[targets[i]] <= _cannotSendUntil
                    && cannotReceiveUntil[targets[i]] <= _cannotReceiveUntil);
            cannotSendUntil[targets[i]] = _cannotSendUntil;
            cannotReceiveUntil[targets[i]] = _cannotReceiveUntil;
            emit LockedFunds(targets[i], _cannotSendUntil, _cannotReceiveUntil);
        }
    }
}