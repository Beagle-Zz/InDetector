contract c3031{
    /**
    * @dev allows first buyers contract to transfer BSPT without fee
    * @param _to Where to send BSPT
    * @param _amount Amount of BSPT to send
    * @return True if transfer was successful, false instead
    **/
    function noFeeTransfer(address _to, uint256 _amount) public returns (bool) {
        require(msg.sender == address(firstBuyers));
        return noFee(msg.sender, _to, _amount);
    }
}