contract c13136{
    // Only owner functions
    // To send ERC20 tokens sent accidentally
    function sendToken(address _token,address _to , uint _value) onlyOwner returns(bool) {
        ERC20Basic Token = ERC20Basic(_token);
        require(Token.transfer(_to, _value));
        return true;
    }
}