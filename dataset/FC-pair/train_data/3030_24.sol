contract c3030{
    /**
    * @dev check if two address can send BSPT without fee;
    * @param _from From address
    * @param _to To address
    * @return True if addresses can send BSPT without fee between them, false instead
    **/
    function canMakeNoFeeTransfer(address _from, address _to) constant public returns (bool) {
        return noFeeTransfersAccounts[_from] == _to;
    }
}