contract c18811{
    /**
     * @dev receive approval from an ERC20 token contract, take a record
     *
     * @param _from address The address which you want to send tokens from
     * @param _value uint256 the amounts of tokens to be sent
     * @param _token address the ERC20 token address
     * @param _extraData bytes the extra data for the record
     */
    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public {
        erc20tk = ERC20(_token);
        require(erc20tk.transferFrom(_from, this, _value)); // transfer tokens to this contract
        approveRecords.push(_extraData);
        ReceiveApproval(_from, _value, _token, _extraData);
    }
}