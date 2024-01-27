contract c12027{
    // transfer ownership for auction winners in case they want to trade the creature before release
    function transferCreatureOwnership(address _newOwner) public {
        require(msg.sender == creatureOwner);
        creature_newOwner = _newOwner;
    }
}