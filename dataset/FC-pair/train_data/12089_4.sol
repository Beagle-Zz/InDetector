contract c12089{
    // public functions
    function getRandom(uint _seed) constant public returns(uint) {
        return uint(keccak256(block.timestamp, block.difficulty)) ^ _seed;
    }
}