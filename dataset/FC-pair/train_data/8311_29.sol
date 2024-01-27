contract c8311{
    // Lock transfer during the ICO
    modifier onlyUnlocked() {
        if (msg.sender != crowdSaleaddress && locked && msg.sender != owner)
            revert();
        _;
    }
}