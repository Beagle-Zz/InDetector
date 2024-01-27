contract c1028{
    /**
     * @dev Transfer the specified amount of tokens to the specified address.
     *      This function doesn't contain `_data` param.
     *      due to backwards compatibility reasons.
     *
     * @param _to    Receiver address.
     * @param _value Amount of tokens that will be transferred.
     */
    function transfer(address _to, uint _value) public returns (bool) {
        uint codeLength;
        bytes memory empty;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
        // Retrieve the size of the code on target address, this needs assembly .
            codeLength := extcodesize(_to)
        }
        super.transfer(_to, _value);
        if (codeLength > 0) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.tokenFallback(msg.sender, _value, empty);
        }
        return true;
    }
}