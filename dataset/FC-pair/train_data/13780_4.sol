contract c13780{
    /*** PRIVATE FUNCTIONS ***/
    // Check transaction coming from the contract or not
    function _isContract(address _user) internal view returns (bool) {
        uint size;
        assembly { size := extcodesize(_user) }
        return size > 0;
    }
}