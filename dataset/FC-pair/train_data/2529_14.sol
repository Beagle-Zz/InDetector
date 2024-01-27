contract c2529{
    //set the fee
    function setHouseFee(uint newFee)public onlyOwner returns(bool) {
        require(msg.sender == owner);//redundant require owner
        houseFee = newFee;//set the house fee
        return true;
    }
}