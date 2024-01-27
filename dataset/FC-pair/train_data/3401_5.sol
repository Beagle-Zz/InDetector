contract c3401{
    // Approve the passed address to spend the specified amount of tokens
    // on behalf of msg.sender.
    function approve(address _spender, uint _value) returns (bool) {
        //https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}