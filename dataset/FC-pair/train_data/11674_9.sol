contract c11674{
    /**
    * @notice Function to claim eth on contract
    */
    function claimETH() onlyAdmin(2) public{
        require(creator.send(address(this).balance));
        emit LogBeneficiaryPaid(creator);
    }
}