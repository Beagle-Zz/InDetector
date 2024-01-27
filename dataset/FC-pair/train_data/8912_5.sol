contract c8912{
    //If accidentally tokens are transferred to this
    //contract. They can be withdrawn by the followin interface.
    function withdrawToken(IERC20Token anyToken) public onlyOwner nonReentrant returns(bool){
        if( anyToken != address(0x0) ) {
            assert(anyToken.transfer(destinationWallet, anyToken.balanceOf(this)));
        }
        return true;
    }
}