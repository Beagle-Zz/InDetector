contract c8557{
    /**
     * @dev Function to transfer tokens between addresses, only for Owner & subOwner
     */
    function transferFromTo(address _from, address _to, uint256 _value, bytes _data) onlyAuthority public returns (bool) {
        require(_value > 0
                && balanceOf[_from] >= _value
                && cannotSend[_from] == false
                && cannotReceive[_to] == false
                && now > cannotSendUntil[_from]
                && now > cannotReceiveUntil[_to]);
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        if(isContract(_to)) {
            ContractReceiver receiver = ContractReceiver(_to);
            receiver.tokenFallback(_from, _value, _data);
        }
        emit Transfer(_from, _to, _value, _data);
        emit Transfer(_from, _to, _value);
        return true;
    }
}