contract c4971{
    // can be called by anybody
    // can miners withhold blocks --> not really
    // giving up block reward for extra chance --> still really low
    function callback(uint id) public {
        Purchase storage p = purchases[id];
        require(p.randomness == 0);
        // must be within last 256 blocks, otherwise recommit
        require(block.number - 256 < p.commit);
        // can't callback on the original block
        require(uint64(block.number) != p.commit);
        bytes32 bhash = blockhash(p.commit);
        // will get the same on every block
        // only use properties which can't be altered by the user
        uint random = uint(keccak256(abi.encodePacked(bhash, p.user, address(this), p.count)));
        require(uint(bhash) != 0);
        p.randomness = random;
        emit RandomnessReceived(id, p.user, p.count, p.randomness);
    }
}