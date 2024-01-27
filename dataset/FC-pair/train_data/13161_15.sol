contract c13161{
//@dev returns if an address is approved to manage all another address' pixels
    function isApprovedForAll(address _owner, address _operator) public view returns(bool) {
        return operatorApprovals[_owner][_operator];
    }
}