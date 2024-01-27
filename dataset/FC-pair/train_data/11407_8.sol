contract c11407{
    /**
     * Check is valid msg value
     */
    function isValidMsgValue(uint256 price) internal returns(bool) {
        if (msg.value < price) return false;
        if (msg.value > price)
            msg.sender.transfer(msg.value - price);
        return true;
    }
}