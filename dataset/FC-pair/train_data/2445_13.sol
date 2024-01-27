contract c2445{
    /**
    * @dev transfer tokens for a specified address in ICO mode
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transferICO(address _to, uint256 _value) public onlyOwner returns (bool) {
        require(isICO, "Not ICO phase");
        require(_to != address(0), "Zero address 'To'");
        require(_value <= balances[wallet], "Not enought balance");
        balances[wallet] = balances[wallet].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(wallet, _to, _value);  
        return true;
    }
}