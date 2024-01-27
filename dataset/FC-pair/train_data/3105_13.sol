contract c3105{
    /**
     * @dev Transfer the specified amount of tokens to the specified address.
     *      This function works the same with the previous one
     *      but doesn't contain `_data` param.
     *      Added due to backwards compatibility reasons.
     *
     * @param _to Receiver address.
     * @param _value Amount of tokens that will be transferred.
     * @return Success.
     */
    function transfer(address _to, uint _value) public returns (bool success) {
        bytes memory empty;
        return transfer(_to, _value, empty);
    }
}