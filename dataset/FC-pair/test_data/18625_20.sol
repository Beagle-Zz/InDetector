contract c18625{
    /**
     * set fee
     */
    function setFee(uint256 _fee) public onlyOwner returns (bool) {
        fee = _fee;
        SetFee(_fee);
        return true;
    }
}