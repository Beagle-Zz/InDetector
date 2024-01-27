contract c18688{
    /**
     * @dev   Takes oraclize random.org api call result string and splits
     *        it at the commas into an array, parses those strings in that
     *        array as integers and pushes them into the winning numbers
     *        array in the raffle's struct. Fires event logging the data,
     *        including the serial number of the random.org callback so
     *        its veracity can be proven.
     *
     * @param _week    The week number of the raffle in question.
     * @param _result   The results string from oraclize callback.
     */
    function setWinningNumbers(uint _week, string _result) internal {
        string[] memory arr = stringToArray(_result);
        for (uint i = 0; i < arr.length; i++){
            raffle[_week].winNums.push(parseInt(arr[i]));
        }
        uint serialNo = parseInt(arr[6]);
        emit LogWinningNumbers(_week, raffle[_week].numEntries, raffle[_week].winNums, prizePool, serialNo, now);
    }
}