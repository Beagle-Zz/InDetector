contract c1624{
    //Calcute Bouns
    function getBonusByTime(uint256 atTime) public constant returns (uint256) {
        if (atTime < startDate1) {
            return 0;
        } else if (endDate1 > atTime && atTime > startDate1) {
            return 5000;
        } else if (endDate2 > atTime && atTime > startDate2) {
            return 2500;
        } else {
            return 0;
        }
    }
}