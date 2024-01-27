contract c3742{
    /**
     * @notice Transfers `_amount` from `_from` to `_to` without additional data.
     * @dev Only if `approve` has been called before!
     * @param _data will be sent to tokenFallback() if receiver is a contract.
     **/
    function transferFrom(address _from, address _to, uint256 _amount, bytes _data) stopOnPause public returns (bool success){
        require(_from != 0x0);
        require(allowance(_from, msg.sender) >= _amount);
        allowed[_from][msg.sender] = allowance(_from, msg.sender).sub(_amount);
        assert(_transfer(_from, _to, _amount, _data));
        emit Transfer(_from, _to, _amount, _data);
        return true;
    }
}