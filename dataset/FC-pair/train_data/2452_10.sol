contract c2452{
// ----------------------------------------------------------------------------
// This method can be used by admin to extract Eth accidentally 
// sent to this smart contract after all previous transfers have been made
// to the correct addresses
// ----------------------------------------------------------------------------
    function ClaimEth() onlyAdmin public {
        require(address(this).balance > 0);
        address(admin).transfer(address(this).balance);
    }
}