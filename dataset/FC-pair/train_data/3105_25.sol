contract c3105{
    /**
     * @dev Creates a sealed purchase order.
     * @param _from Account that will purchase tokens.
     * @param _period Period of purchase order.
     * @param _value Purchase funds, in wei.
     * @param _salt Random value to keep purchase secret.
     * @return The sealed purchase order.
     */
    function createPurchaseOrder(address _from, uint _period, uint _value, bytes32 _salt) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_from, _period, _value, _salt));
    }
}