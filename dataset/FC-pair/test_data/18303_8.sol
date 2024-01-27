contract c18303{
    // ERC20 standard function
    function approve(address _spender, uint256 _value) external transferable returns (bool) {
        require(_spender != address(0));
        require(_value > 0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}