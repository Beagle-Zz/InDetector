contract c10353{
    /**
     * @dev overrides transfer function with modifier to prevent from transfer with invalid address
     * @param _recipients An array of address to transfer to.
     * @param _value The amount to be transferred.
     */
    function batchTransfer(address[] _recipients, uint _value) public onlyWhenTransferable returns (bool) {
        uint count = _recipients.length;
        require(count > 0 && count <= 20);
        uint needAmount = count.mul(_value);
        require(_value > 0 && balances[msg.sender] >= needAmount);
        for (uint i = 0; i < count; i++) {
            transfer(_recipients[i], _value);
        }
        return true;
    }
}