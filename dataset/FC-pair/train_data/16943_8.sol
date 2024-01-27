contract c16943{
    // amount owner can withdraw after auction ended
    // that way you can easily compare the contract balance with your amount
    // if there is more in the contract than your balance someone didn't withdraw
    // let them know that :)
    function ownerCanWithdraw() public view returns (uint amount) {
        return highestBindingBid.sub(oldPotato);
    }
}