contract c3434{
    //Get My Revenue
    function getMyRevenue(uint _round) public view returns(uint256)
    {
        return(  (((RoundPayMask[_round]).mul(RoundMyHeart[_round][msg.sender])) / (1000000000000000000)).sub(RoundMyPayMask[_round][msg.sender])  );
    }
}