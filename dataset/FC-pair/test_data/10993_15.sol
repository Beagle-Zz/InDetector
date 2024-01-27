contract c10993{
    /**
     * lock one address
     * one address only be locked at the same time. 
     * because the gas reson, so not support multi lock of one address
     * 
     * @param _lockValue     how many tokens locked
     * @param _releaseTimeS  the lock release unix time 
     */
    function setLock(address _address, uint256 _lockValue, uint256 _releaseTimeS) onlyAdmins public {
        require( uint256(now) > locks[_address].releaseTimeS );
        locks[_address].balance = _lockValue;
        locks[_address].releaseTimeS = _releaseTimeS;
        emit SetLock(_address, _lockValue, _releaseTimeS);
    }
}