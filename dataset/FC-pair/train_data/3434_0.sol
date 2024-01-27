contract c3434{
    //Get Heart Price
    function getHeartPrice() public view returns(uint256)
    {  
        return ( (RoundHeart[Round].add(1000000000000000000)).ethRec(1000000000000000000) );
    }
}