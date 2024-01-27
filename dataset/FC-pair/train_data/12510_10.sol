contract c12510{
    //market functions
        //market functions
    function setCoachPrice(uint _id,uint _price) public onlyOwnerOf(_id){ 
        coaches[_id].isSell = 1;
        coaches[_id].sellPrice = _price;
    }
}