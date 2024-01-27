contract c13161{
//@dev approve all an owner's pixels to be managed by an address
    function setApprovalForAll(address _to,bool _approved) public{
        require(_to != msg.sender);
        operatorApprovals[msg.sender][_to] = _approved;
        emit ApprovalForAll(msg.sender, _to, _approved);
    }
}