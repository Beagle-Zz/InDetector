contract c7044{
    /**
     * Remove address from ICO whitelist
     * @param address_ Investor address
     */
    function blacklist(address address_) external onlyOwner {
        delete whitelist[address_];
        emit ICOBlacklisted(address_);
    }
}