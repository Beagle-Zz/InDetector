contract c12705{
    /**
     * @notice Transfers `_amount` from `_from` to `_to` with additional data.
     * @dev Only if `approve` has been called before!
     * @dev An empty `bytes` instance will be created and sent to `tokenFallback()` if receiver is a contract.
     **/
    function transferFrom(address _from, address _to, uint256 _amount) stopOnPause  public returns (bool success){
        require(_from != 0x0);
        require(allowance(_from, msg.sender) >= _amount);
        bytes memory empty;
        allowed[_from][msg.sender] = allowance(_from, msg.sender).sub(_amount);
        assert(_transfer(_from, _to, _amount, empty));
        emit Transfer(_from, _to, _amount, empty);
        return true;
    }
}