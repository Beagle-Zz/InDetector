contract c10638{
    /**
     * @dev Special method for fill contract bank 
     */
    function fillTheBank() public payable {
        require(msg.value >= sponsorDiff);
        if (msg.value >= sponsorValue + sponsorDiff) {
            sponsorValue = msg.value;
            sponsor      = msg.sender;
        }
        bank = Math.add(bank, msg.value);
    }
}