contract c13780{
    // Get tokens balance of the Halo3D PotPotato
    function getBalance() public view returns(uint256 value){
        return tokenContract.myTokens();
    }
}