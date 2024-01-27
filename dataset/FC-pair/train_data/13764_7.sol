contract c13764{
    /**
     * @dev called by the owner to set lock state, triggers stop/continue state
     */
    function setLock(bool _value) onlyOwner public {
        locked = _value;
        emit onLock();
    }
}