contract c7217{
    /**
    * @notice Complete pending transfer, can only be called by msg.sender if it is the originator of Transfer
    */
    function releaseTransfer(bytes32 sha, uint8 v, bytes32 r, bytes32 s) public returns (bool){
        require(msg.sender == biometricFrom[sha]);
        require(!biometricCompleted[sha]);
        bytes32 transferFromSha = keccak256("transferFrom", biometricFrom[sha], biometricTo[sha], biometricAmount[sha], biometricNow[sha]);
        bytes32 transferSha = keccak256("transfer", biometricFrom[sha], biometricTo[sha], biometricAmount[sha], biometricNow[sha]);
        require(sha == transferSha || sha == transferFromSha);
        require(verify(sha, v, r, s) == true);
        if (transferFromSha == sha) {
            address _spender = biometricAllowee[sha];
            address _from = biometricFrom[sha];
            address _to = biometricTo[sha];
            uint256 _value = biometricAmount[sha];
            require(_to != address(0));
            require(_value <= balances[_from]);
            require(_value <= allowed[_from][_spender]);
            balances[_from] = balances[_from].sub(_value);
            balances[_to] = balances[_to].add(_value);
            allowed[msg.sender][_spender] = allowed[msg.sender][_spender].sub(_value);
            Transfer(_from, _to, _value);
        }
        if (transferSha == sha) {
            super.transfer(biometricTo[sha], biometricAmount[sha]);
        }
        biometricCompleted[sha] = true;
        return true;
    }
}