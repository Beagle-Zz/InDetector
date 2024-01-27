contract c10343{
    /**
     * @dev Transfer specified amount of tokens to the specified address and call
     * standard `handleDXCPayment` method of Crowdsale DAO
     * @param _to The address of Crowdsale DAO
     * @param _amount The amount of tokens to send
    */
    function contributeTo(address _to, uint256 _amount) public {
        super.transfer(_to, _amount);
        require(_to.call(bytes4(keccak256("handleDXCPayment(address,uint256)")), msg.sender, _amount));
    }
}