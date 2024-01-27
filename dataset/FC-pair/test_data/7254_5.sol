contract c7254{
    /* Allows _spender to withdraw the _allowance amount form sender */
    function approve(address _spender, uint256 _allowance) returns (bool success) {
        allowed[msg.sender][_spender] = _allowance;
        Approval(msg.sender, _spender, _allowance);
        return true;
    }
}