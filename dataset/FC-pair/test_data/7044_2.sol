contract c7044{
    /**
     * Add address to ICO whitelist
     * @param address_ Investor address
     */
    function whitelist(address address_) external onlyOwner {
        whitelist[address_] = true;
        emit ICOWhitelisted(address_);
    }
}