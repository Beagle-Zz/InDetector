contract c2405{
    // MODIFIERS
    // simple single-sig function modifier.
    modifier onlyowner {
        if (isOwner(msg.sender))
            _;
    }
}