contract c18303{
    // ERC20 standard function
    function transfer(address _to, uint256 _value) external transferable returns (bool) {
        require(_to != address(0));
        require(_value > 0);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}