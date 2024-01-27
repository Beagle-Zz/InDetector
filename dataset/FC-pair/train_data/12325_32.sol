contract c12325{
    /**
     * @dev Transfer the specified amount of tokens to the NamiExchange address.
     *      Invokes the `tokenFallbackBuyer` function.
     *      The token transfer fails if the recipient is a contract
     *      but does not implement the `tokenFallbackBuyer` function
     *      or the fallback function to receive funds.
     *
     * @param _to    Receiver address.
     * @param _value Amount of tokens that will be transferred.
     * @param _buyer address of seller.
     */
    function transferToBuyer(address _to, uint _value, address _buyer) public {
        uint codeLength;
        assembly {
            codeLength := extcodesize(_to)
        }
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender,_to,_value);
        if (codeLength > 0) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.tokenFallbackBuyer(msg.sender, _value, _buyer);
            emit TransferToBuyer(msg.sender, _to, _value, _buyer);
        }
    }
}