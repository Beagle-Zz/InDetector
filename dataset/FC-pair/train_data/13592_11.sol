contract c13592{
    /**
    * @dev Frozen account handler
    * @param _target The address to being frozen.
    * @param _flag The status of the frozen
    * @param _timeInDays The amount of time the account becomes locked
    */
    function setFrozen(address _target,bool _flag,uint256 _timeInDays) public {
        if(_flag == true){
            require(msg.sender == admin); //Only admin
            require(frozen[_target] == false); //Not already frozen
            frozen[_target] = _flag;
            unfreezeDate[_target] = now.add(_timeInDays * 1 days);
            emit FrozenStatus(_target,_flag,unfreezeDate[_target]);
        } else {
            require(now >= unfreezeDate[_target]);
            frozen[_target] = _flag;
            emit FrozenStatus(_target,_flag,unfreezeDate[_target]);
        }
    }
}