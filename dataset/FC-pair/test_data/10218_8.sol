contract c10218{
    //change fee
    function changeDrawFee(uint _money)public onlyOwner{ 
        drawFee = _money;
    }
}