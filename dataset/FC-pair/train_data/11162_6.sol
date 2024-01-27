contract c11162{
    /**
     * @dev Get random number
     */
    function getRN() internal returns(uint8) {
        return uint8(rand.getRandomNumber(minNumber, maxNumber + minNumber));
    }
}