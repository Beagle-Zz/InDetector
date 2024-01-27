contract c18147{
    /**
     * @dev Transfer tokens from one address to another. Technically this is not ERC20 transferFrom but more ERC777 operatorSend.
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(isOperatorFor[msg.sender][_from]);
        doSend(_from, _to, _value, "", msg.sender, "", true);
        emit Transfer(_from, _to, _value);
        return true;
    }
}