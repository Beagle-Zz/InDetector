contract c8911{
    /// @return true if sale is due when the last phase is finished.
    function saleDue() constant returns (bool) {
        return block.number >= firstblock + BLOCKS_PER_PHASE * NUM_OF_PHASE;
    }
}