contract c2529{
    //random function for tiebreaker
    function _random() private view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp, block.difficulty))%2);
    }
}