contract c3105{
     /**
     * @dev Transfer the specified amount of tokens to the specified address.
     *      Invokes the `tokenFallback` function if the recipient is a contract.
     *      The token transfer fails if the recipient is a contract
     *      but does not implement the `tokenFallback` function
     *      or the fallback function to receive funds.
     *
     * @param _to Receiver address.
     * @param _value Amount of tokens that will be transferred.
     * @param _data Transaction metadata.
     * @return Success.
     */
    function transfer(address _to, uint _value, bytes _data) public returns (bool success) {
        require(_to != address(0));
        return isContract(_to) ?
            transferToContract(_to, _value, _data) :
            transferToAddress(_to, _value, _data)
        ;
    }
}