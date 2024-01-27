contract c16583{
    // buyer needs to confirm the transfer
    function acceptCreatureOwnership() public {
        require(msg.sender == creature_newOwner);
        emit CreatureOwnershipTransferred(creatureOwner, creature_newOwner);
        creatureOwner = creature_newOwner;
        creature_newOwner = address(0);
    }
}