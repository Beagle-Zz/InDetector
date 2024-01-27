contract c11191{
    /**
     * @dev Get random number
     */
    function getRN() internal returns(uint8) {
        // 7 is max because method sub min from max (7-1 = 6). Look in Math::random implementation
        nonce++;
        return uint8(Math.random(nonce, minNumber, maxNumber + minNumber));
    }
}