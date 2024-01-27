contract c13161{
    //@dev purchase multiple pixels at the same time
    function multiPurchase(uint32[] _Id, uint8[] _R,uint8[] _G,uint8[] _B,string _text) public payable {
        require(_Id.length == _R.length && _Id.length == _G.length && _Id.length == _B.length);
        require(bytes(_text).length < 101);
        address newOwner = msg.sender;
        uint totalPrice = 0;
        uint excessValue = msg.value;
        for(uint i = 0; i < _Id.length; i++){
            address oldOwner = ownerOf(_Id[i]);
            require(ownerOf(_Id[i]) != newOwner);
            require(!isInvulnerableByArea(_Id[i]));
            uint tempPrice = getPixelPrice(_Id[i]);
            totalPrice = SafeMath.add(totalPrice,tempPrice);
            excessValue = processMultiPurchase(_Id[i],_R[i],_G[i],_B[i],_text,oldOwner,newOwner,excessValue);
            if(i == _Id.length-1) {
                require(msg.value >= totalPrice);
                msg.sender.transfer(excessValue);
            }   
        }
    } 
}