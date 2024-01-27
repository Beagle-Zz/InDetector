contract c11162{
    /**
     * @dev Special method for fill contract bank 
     */
    function fillTheBank() external payable {
        require(msg.value >= sponsorDiff);
        if (msg.value >= sponsorValue + sponsorDiff) {
            sponsorValue = msg.value;
            sponsor      = msg.sender;
        }
        bank = Math.add(bank, msg.value);
    }
}