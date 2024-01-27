contract c12070{
    /* Allow _spender to withdraw from your account up to _amount */
    function approve(address _spender, uint256 _amount) public returns (bool) {
        require(_spender != address(0x0));
        // update allowed amount
        allowed[msg.sender][_spender] = _amount;
        // log event
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
}