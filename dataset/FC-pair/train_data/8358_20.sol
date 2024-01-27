contract c8358{
    // Transfer amount of tokens from a specified address to a recipient.
    // Transfer amount of tokens from sender account to recipient.
    function transferFrom(address _from, address _to, uint _value) public returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}