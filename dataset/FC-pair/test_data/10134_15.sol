contract c10134{
    //market functions
    function setPlayerPrice(uint _id,uint _price) public payable onlyOwnerOf(_id){ 
        require(msg.value == defendFee);
        players[_id].isSell = 1;
        players[_id].sellPrice = _price;
        players[_id].readytime = uint256(now + coolDownTime);
    }
}