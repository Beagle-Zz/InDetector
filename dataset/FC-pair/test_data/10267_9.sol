contract c10267{
    //@notice An address can claim his win from the jackpot after the jackpot is completed
    function getEther(uint256 _countryIndex) public {
        require(countryIndexToOwner[_countryIndex] == msg.sender);
        require(jackpotCompleted);
        require(countryToRank[_countryIndex] != 0);
        require(!jackpotClaimedForCountry[_countryIndex]);
        jackpotClaimedForCountry[_countryIndex] = true;
        uint256 _rankShare = rankShare[countryToRank[_countryIndex]];
        uint256 amount = ((finalJackpotValue).mul(_rankShare)).div(1000);
        msg.sender.transfer(amount);
    }
}