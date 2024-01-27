contract c18276{
    /*
        @dev update crowdsale if smth incorrect
    */
    function updateCrowd(
        uint256 tokens,
        uint    startDate,
        uint    endDate,
        uint8   bonus
    )
        public
        onlyOwner
    {
        Crowd = Crowdsale(
            tokens,
            startDate,
            endDate,
            bonus
            );
    }
}