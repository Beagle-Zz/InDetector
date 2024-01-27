contract c3419{
    /**
    @notice Returns an array of fund addresses and an associated array of whether competing and whether disqualified
    @return {
      "fundAddrs": "Array of addresses of Melon Funds",
      "fundRegistrants": "Array of addresses of Melon fund managers, as used in the ipfs-frontend",
    }
    */
    function getCompetitionStatusOfRegistrants()
        view
        returns(
            address[],
            address[],
            bool[]
        )
    {
        address[] memory fundAddrs = new address[](registrants.length);
        address[] memory fundRegistrants = new address[](registrants.length);
        bool[] memory isRewarded = new bool[](registrants.length);
        for (uint i = 0; i < registrants.length; i++) {
            fundAddrs[i] = registrants[i].fund;
            fundRegistrants[i] = registrants[i].registrant;
            isRewarded[i] = registrants[i].isRewarded;
        }
        return (fundAddrs, fundRegistrants, isRewarded);
    }
}