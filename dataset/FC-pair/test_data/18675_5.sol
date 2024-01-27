contract c18675{
    /**
     * @dev     ERC223 tokenFallback function allows to receive ERC223 tokens 
     *          properly.
     *
     * @param _from  Address of the sender.
     * @param _value Amount of deposited tokens.
     * @param _data  Token transaction data.
     */
    function tokenFallback(address _from, uint256 _value, bytes _data) external {
        if (_value > 0) emit LogTokenDeposit(_from, _value, _data);
    }
}