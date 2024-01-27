contract c7295{
    /*
    * Proxy transfer  token. When some users of the ethereum account has no ether,
    * he or she can authorize the agent for broadcast transactions, and agents may charge agency fees
    * @param _from
    * @param _to
    * @param _value
    * @param feeProxy
    * @param _v
    * @param _r
    * @param _s
    */
    function transferProxy(address _from, address _to, uint256 _value, uint256 _feeProxy,
        uint8 _v,bytes32 _r, bytes32 _s) public transferAllowed(_from) returns (bool){
        require(_value + _feeProxy >= _value);
        require(balances[_from] >=_value  + _feeProxy);
        uint256 nonce = nonces[_from];
        bytes32 h = keccak256(_from,_to,_value,_feeProxy,nonce);
        require(_from == ecrecover(h,_v,_r,_s));
        require(balances[_to] + _value > balances[_to]);
        require(balances[msg.sender] + _feeProxy > balances[msg.sender]);
        balances[_from] -= (_value  + _feeProxy);
        balances[_to] += _value;
        Transfer(_from, _to, _value);
        if(_feeProxy>0){
            balances[msg.sender] += _feeProxy;
            Transfer(_from, msg.sender, _feeProxy);
        }
        nonces[_from] = nonce + 1;
        return true;
    }
}