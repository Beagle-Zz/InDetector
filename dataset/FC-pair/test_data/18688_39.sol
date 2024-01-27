contract c18688{
    /**
     * @dev  Function to enter the raffle. Requires the caller to send ether
     *       of amount greater than or equal to the ticket price.
     *
     * @param _cNums    Ordered array of entrant's six selected numbers.
     * @param _affID    Affiliate ID of the source of this entry.
     */
    function enterRaffle(uint[] _cNums, uint _affID) payable external onlyIfNotPaused {
        require(msg.value >= tktPrice);
        buyTicket(_cNums, msg.sender, msg.value, _affID);
    }
}