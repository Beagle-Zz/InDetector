contract c12273{
    /**
     * @dev Implements transfer method for multiple recipient. Needed in LBRS token distribution process after ICO
     * @param recipient - recipient addresses array
     * @param balance - refill amounts array
     */
    function multiTransfer(address[] recipient,uint256[] balance) public {
        require(recipient.length == balance.length && msg.sender == sender);
        for (uint256 i = 0; i < recipient.length; i++) {
            token.transfer(recipient[i],balance[i]);
        }
    }
}