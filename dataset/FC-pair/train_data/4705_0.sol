contract c4705{
    // Perform only after claiming the node, or claim in the same tx.
    function setupAmbi2(Ambi2 _ambi2) returns(bool) {
        if (address(ambi2) != 0x0) {
            return false;
        }
        ambi2 = _ambi2;
        return true;
    }
}