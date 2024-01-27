contract c13516{
    /**
    * @dev Confirm that airDrop is available.
    * @return A bool to confirm that airDrop is available.
    */
    function isValidAirDropForAll() public view returns (bool) {
        bool validNotStop = !stop;
        bool validAmount = getRemainingToken() >= airDropAmount;
        bool validPeriod = now >= startTime && now <= endTime;
        return validNotStop && validAmount && validPeriod;
    }
}