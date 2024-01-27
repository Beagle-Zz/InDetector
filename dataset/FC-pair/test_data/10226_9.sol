contract c10226{
    // Ensure sender is depository
    modifier onlyDepository {
        require( msg.sender == depository() );
        _;
    }
}