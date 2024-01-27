contract c10638{
    /**
     * @dev Check the winner
     */
    function isWinner(uint8 required, uint8[5] numbers, uint8[5] randoms) private pure returns(bool) {
        uint8 count = 0;
        for (uint8 i = 0; i < numbers.length; i++) {
            if (numbers[i] == 0) continue;
            for (uint8 j = 0; j < randoms.length; j++) {
                if (randoms[j] == 0) continue;
                if (randoms[j] == numbers[i]) {
                    count++;
                    delete randoms[j];
                    break;
                }
            }
        }
        return count == required;
    }
}