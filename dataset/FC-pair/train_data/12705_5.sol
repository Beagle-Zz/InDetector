contract c12705{
    /**
     * @notice Transfer without additional data.
     * @dev An empty `bytes` instance will be created and sent to `tokenFallback()` if receiver is a contract.
     **/
    function transfer(address _to, uint256 _amount) stopOnPause public returns (bool success){
        bytes memory empty;
        if (_transfer(msg.sender, _to, _amount, empty)){
            emit Transfer(msg.sender , _to, _amount);
            return true;
        }
        return false;
    }
}