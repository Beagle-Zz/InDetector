contract c16953{
    // also checks that p exists: p.owner == 0 for non-existent products    
    modifier onlyProductOwner(bytes32 productId) {
        Product storage p = products[productId];
        require(p.id != 0x0, "error_notFound");
        require(p.owner == msg.sender || owner == msg.sender, "error_productOwnersOnly");
        _;
    }
}