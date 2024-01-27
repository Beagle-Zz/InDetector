contract c13161{
//@dev internal function to determine if its approved or an owner
    function isApprovedOrOwner(address _spender, uint _pixelId)internal view returns (bool) {
        address owner = ownerOf(_pixelId);
        return(_spender == owner || getApproved(_pixelId) == _spender || isApprovedForAll(owner,_spender));
    }
}