contract c3031{
    /**
    * @dev send tokens from your address.
    * @param _to Address of recipient.
    * @param _amount Amount to send.
    * @return Whether the transfer was successful or not.
    **/
    function transfer(address _to, uint256 _amount) public returns (bool) {
        require(!tokenFrozen);
        if (data.canMakeNoFeeTransfer(msg.sender, _to) || data.hasPrestige(msg.sender)) {
            noFee(msg.sender, _to, _amount);
        }
        else {
            _transfer(msg.sender, _to, _amount);
        }
        return true;
    }
}