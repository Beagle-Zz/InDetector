contract c13592{
    /**
    * @dev Function to set burn lock
    * This function will be used after the burn process finish
    */
    function setSupplyLock(bool _flag) onlyAdmin public { //Only the admin can set a lock on supply
        lockSupply = _flag;
        emit SetSupplyLock(lockSupply);
    }
}