contract c12027{
    // who owns the creature (not necessarily auction winner)
    function queryCreatureOwner() public view returns (address _creatureOwner) {
        return creatureOwner;
    }
}