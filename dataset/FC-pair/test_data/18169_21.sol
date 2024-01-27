contract c18169{
    // ------- Minting and burning ----------
    /**
    * @dev Function to mint tokens
    * @param _to The address that will receive the minted tokens.
    * @param _amount The amount of tokens to mint.
    * @param _operatorData Data that will be passed to the recipient as a first transfer.
    */
    function mint(address _to, uint256 _amount, bytes _operatorData) public onlyOwner {
        require (totalSupply.add(_amount) <= maxSupply);
        requireMultiple(_amount);
        totalSupply = totalSupply.add(_amount);
        balanceOf[_to] = balanceOf[_to].add(_amount);
        callRecipient(msg.sender, 0x0, _to, _amount, "", _operatorData, true);
        emit Minted(msg.sender, _to, _amount, _operatorData);
        emit Transfer(0x0, _to, _amount);
    }
}