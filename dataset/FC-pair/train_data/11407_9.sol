contract c11407{
    /**
     * Get random number
     */
    function getRandom16(uint16 min, uint16 max) private returns(uint16) {
        nonce++;
        return Math.rand16(nonce, min, max);
    }
}