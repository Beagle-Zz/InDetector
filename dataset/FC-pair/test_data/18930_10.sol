contract c18930{
    //Called after the sale ends to withdraw remaining unsold tokens
    function withdrawUnsoldTokens() onlyOwner public {    
        uint256 unsold = token.balanceOf(this);
        token.transfer(owner, unsold);
    }
}