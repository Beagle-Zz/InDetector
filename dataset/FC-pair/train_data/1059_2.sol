contract c1059{
    // Public functions
    function transfer(address _to, uint256 _value)
    public {
        _pay_token_commission(_value);
        _transfer(msg.sender, _to, _value);
    }
}