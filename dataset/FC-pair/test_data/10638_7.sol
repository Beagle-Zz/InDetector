contract c10638{
    /**
     * @dev Get random number
     */
    function getRN() private returns(uint8) {
        return uint8(rand.getRandomNumber(minNumber, maxNumber + minNumber));
    }
}