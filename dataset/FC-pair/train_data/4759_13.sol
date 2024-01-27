contract c4759{
    // can be called by anybody
    // can miners withhold blocks --> not really
    // giving up block reward for extra chance --> still really low
    function callback(uint id) public {
        Purchase storage p = purchases[id];
        require(p.randomness == 0);
        bytes32 bhash = blockhash(p.commit);
        // will get the same on every block
        // only use properties which can't be altered by the user
        uint random = uint(keccak256(abi.encodePacked(bhash, p.user, address(this), p.count)));
        // can't callback on the original block
        require(uint64(block.number) != p.commit);
        if (uint(bhash) == 0) {
            // should never happen (must call within next 256 blocks)
            // if it does, just give them 1: will become common and therefore less valuable
            // set to 1 rather than 0 to avoid calling claim before randomness
            p.randomness = 1;
        } else {
            p.randomness = random;
        }
        emit RandomnessReceived(id, p.user, p.count, p.randomness);
    }
}