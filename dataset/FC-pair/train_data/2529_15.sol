contract c2529{
    //withdraw the commission
    function withdrawCommission()public onlyOwner returns(bool) {
        require(msg.sender == owner);//again redundant owner check because who trusts modifiers
        bookKeeper = bookKeeper.sub(houseCommission);//update ;the bookKeeper
        uint holding = houseCommission;//get the commission balance
        houseCommission = 0;//empty the balance
        owner.transfer(holding);//transfer to owner
        return true;
    }
}