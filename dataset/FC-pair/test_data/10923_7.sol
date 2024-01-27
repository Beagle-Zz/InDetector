contract c10923{
    /*
     * ERC 223
     * Added support for the ERC 223 "tokenFallback" method in a "transfer" function with a payload.
     */
    function transfer(
        address _to,
        uint _amount,
        bytes _data,
        string _custom_fallback)
        public
        returns (bool success)
    {
        return transferFrom(msg.sender, _to, _amount, _data, _custom_fallback);
    }
}