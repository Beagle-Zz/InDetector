contract c7014{
    /**
     * @dev Send Token
     * 
     * @param _receiver address
     * @param _amount uint256
     */
    function sendToken(address _receiver, uint256 _amount) external {
        require(msg.sender == wallet);
        require(_amount <= deposit);
        assert(token.transfer(_receiver, _amount));
        deposit = deposit.sub(_amount);
    }
}