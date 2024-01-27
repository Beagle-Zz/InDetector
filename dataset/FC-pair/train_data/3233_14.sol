contract c3233{
    /**
    * @dev Defines the operation by checking if flat fee has been paid or not.
    */
    function payFee(bytes32 _serviceName, uint256 _multiplier, address _client) public returns(bool paid) {
        require(isValidService(_serviceName), "_serviceName in invalid");
        require(_multiplier != 0, "_multiplier is zero");
        require(_client != 0, "_client is zero");
        require(block.timestamp < nextPaymentTime);
        return true;
    }
}