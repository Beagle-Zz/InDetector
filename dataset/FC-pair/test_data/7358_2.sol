contract c7358{
    /**
    * @dev ringBell is a payable function that allows people to celebrate the couple's marriage, and
    * also send Ether to the marriage contract
    */
    function ringBell() public payable {
        bellCounter = add(1, bellCounter);
        emit weddingBells(msg.sender, bellCounter);
    }
}