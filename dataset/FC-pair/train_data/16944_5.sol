contract c16944{
    // calculates the next bid amount to you can have a oneclick buy button
    function nextBid() public view returns (uint _nextBid) {
        return highestBindingBid.add(potato);
    }
}