contract c2003{
    // How many tokens are in the contract overall?
    function balanceOf() public view returns (uint) {
        return contractBalance;
    }
}