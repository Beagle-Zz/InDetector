contract c12528{
    /**
    * @dev Frozen account.
    * @param _target The address to being frozen.
    * @param _flag The frozen status to set.
    */
    function setFrozen(address _target,bool _flag) onlyAdmin public {
        frozen[_target]=_flag;
        emit FrozenStatus(_target,_flag);
    }
}