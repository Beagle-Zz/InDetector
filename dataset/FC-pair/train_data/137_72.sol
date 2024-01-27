contract c137{
    /// @dev requires the voter to not have voted already
    modifier onlyVoters() {
        bool found = false;
        uint256 length = voters.length;
        for(uint i = 0; i < length; i++) {
            if(voters[i] == msg.sender) {
                found = true;
                break;
            }
        }
        if(!found) {
            revert("not a voter");
        }
        _;
    }
}