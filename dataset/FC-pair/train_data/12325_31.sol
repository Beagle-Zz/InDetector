contract c12325{
    /**
     * @dev Transfer the specified amount of tokens to the NamiExchange address.
     *      Invokes the `tokenFallbackExchange` function.
     *      The token transfer fails if the recipient is a contract
     *      but does not implement the `tokenFallbackExchange` function
     *      or the fallback function to receive funds.
     *
     * @param _to    Receiver address.
     * @param _value Amount of tokens that will be transferred.
     * @param _price price to sell token.
     */
    function transferToExchange(address _to, uint _value, uint _price) public {
        uint codeLength;
        assembly {
            codeLength := extcodesize(_to)
        }
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender,_to,_value);
        if (codeLength > 0) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.tokenFallbackExchange(msg.sender, _value, _price);
            emit TransferToExchange(msg.sender, _to, _value, _price);
        }
    }
}