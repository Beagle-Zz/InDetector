contract c8669{
    /**
     * @dev Prevent targets from sending or receiving tokens
     * @param targets Addresses to be frozen
     * @param _cannotSend Whether to prevent targets from sending tokens or not
     * @param _cannotReceive Whether to prevent targets from receiving tokens or not
     */
    function freezeAccounts(address[] targets, bool _cannotSend, bool _cannotReceive) onlyOwner public {
        require(targets.length > 0);
        for (uint i = 0; i < targets.length; i++) {
            cannotSend[targets[i]] = _cannotSend;
            cannotReceive[targets[i]] = _cannotReceive;
            emit FrozenFunds(targets[i], _cannotSend, _cannotReceive);
        }
    }
}