contract c16797{
    // allows execution only for quick convreter
    modifier quickConverterOnly {
        require(msg.sender == address(extensions.quickConverter()));
        _;
    }
}