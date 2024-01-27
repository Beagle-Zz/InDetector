contract c10189{
    /**
    * @dev Override #transferFrom for optionally paying fee to Custom token owner.
    */
    function transferFrom(address _from, address _to, uint256 _value) canTransfer(_from, _value) public returns(bool transferred) {
        if (freeTransfer()) {
            return super.transferFrom(_from, _to, _value);
        }
        else {
            uint256 usageFee = transferFee(_value);
            uint256 netValue = _value.sub(usageFee);
            bool feeTransferred = super.transferFrom(_from, owner, usageFee);
            bool netValueTransferred = super.transferFrom(_from, _to, netValue);
            return feeTransferred && netValueTransferred;
        }
    }
}