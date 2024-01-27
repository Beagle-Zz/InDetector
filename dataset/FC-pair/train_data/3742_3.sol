contract c3742{
    /**
     * @notice Underlying transfer function; it is called by public functions later.
     * @dev This architecture saves >30000 gas as compared to having two independent public functions
     *      for transfer with and without `_data`.
     **/
    function _transfer(address _from, address _to, uint256 _amount, bytes _data) internal returns (bool success){
        require(_to != 0x0);
        require(_amount <= balanceOf(_from));
        uint256 initialBalances = balanceOf(_from).add(balanceOf(_to));
        balances[_from] = balanceOf(_from).sub(_amount);
        balances[_to] = balanceOf(_to).add(_amount);
        if(isContract(_to)){
            ReceiverContract receiver = ReceiverContract(_to);
            receiver.tokenFallback(_from, _amount, _data);
        }
        assert(initialBalances == balanceOf(_from).add(balanceOf(_to)));
        return true;
    }
}