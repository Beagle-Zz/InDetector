contract c13455{
    /**
     *
     * Transfer with ERC223 specification
     *
     * http://vessenes.com/the-erc20-short-address-attack-explained/
     */
    function transfer(address _to, uint _value) 
    onlyPayloadSize(2 * 32) 
    public
    returns (bool success)
    {
        require(_to != address(0));
        if (balances[msg.sender] >= _value && _value > 0) {
            uint codeLength;
            bytes memory empty;
            assembly {
            // Retrieve the size of the code on target address, this needs assembly .
            codeLength := extcodesize(_to)
            }
            balances[msg.sender] = safeSub(balances[msg.sender], _value);
            balances[_to] = safeAdd(balances[_to], _value);
            if(codeLength>0) {
                ContractReceiver receiver = ContractReceiver(_to);
                receiver.tokenFallback(msg.sender, _value, empty);
            }
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }
}