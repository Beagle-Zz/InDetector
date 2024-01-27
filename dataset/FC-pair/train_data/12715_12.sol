contract c12715{
    /**
    * @dev Defines the operation by checking if flat fee has been paid or not.
    */
    function payFee(bytes32 _serviceName, uint256 _multiplier, address _client) public returns(bool paid) {
        require(isValidService(_serviceName));
        require(_multiplier != 0);
        require(_client != 0);
        require(block.timestamp < nextPaymentTime);
        return true;
    }
}