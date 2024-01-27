contract c12386{
    // get the token balance for an individual address
    function userHeldTill(address _owner) public constant returns (uint) {
        return heldTimeline[_owner];
    }
}