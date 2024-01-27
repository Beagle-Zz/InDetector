contract c4968{
    // can recommit
    // this gives you more chances
    // if no-one else sends the callback (should never happen)
    // still only get a random extra chance
    function recommit(uint id) public {
        Purchase storage p = purchases[id];
        require(p.randomness == 0);
        require(block.number >= p.commit + 256);
        p.commit = uint64(block.number);
        emit Recommit(id);
    }
}