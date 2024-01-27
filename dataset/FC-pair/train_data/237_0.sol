contract c237{
/*********************************/
/*********** MODIFIER ************/
/*********************************/
    /// @dev Access modifier for CEO-only functionality
    modifier onlyCreator() {
        require(msg.sender == ownerAddress);
        _;
    }
}