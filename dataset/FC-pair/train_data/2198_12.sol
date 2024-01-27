contract c2198{
    /**
     * calculate the winner side
     * calculate the award to winner
     **/
    function forceEndGame() public adminOnly {
        require(winnerSide == 0);
        // 10% for operation fee
        finalBalance = address(this).balance;
        uint totalAward = uint(finalBalance * 9 / 10);
        uint option1Count = option1AddressList.length;
        uint option2Count = option2AddressList.length;
        if (option1Count > option2Count || (option1Count == option2Count && gameId % 2 == 1)) { // option1 win
            award = option1Count == 0 ? 0 : uint(totalAward / option1Count);
            winnerSide = 1;
            winnerList = option1AddressList;
        } else if (option2Count > option1Count || (option1Count == option2Count && gameId % 2 == 0)) { // option2 win
            award = option2Count == 0 ? 0 : uint(totalAward / option2Count);
            winnerSide = 2;
            winnerList = option2AddressList;
        }
    }
}