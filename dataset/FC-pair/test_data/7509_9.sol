contract c7509{
    /**
     * @dev Send VNET Token
     *
     * @param _to address
     * @param _amount uint256
     */ 
    function sendVNET(address _to, uint256 _amount) external onlyOwner {
        assert(vnetToken.transfer(_to, _amount));
    }
}