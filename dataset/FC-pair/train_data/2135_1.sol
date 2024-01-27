contract c2135{
    /**
     * get round stats by index
     */
    function roundStats(uint index) public view returns (uint round, address winner, uint position, uint block_no) {
        return (index, _winners[index], _positions[index], _blocks[index]);
    }
}