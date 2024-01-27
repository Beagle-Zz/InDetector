contract c8578{
    /**
     * Anybody can credit ether on behalf of an advertiser
     *
     * @param publisher    The address of the publisher
     * @param cut          How much cut should be taken from this publisher
     */
    function setPublisherCut (address publisher, uint cut) hasNotSuicided onlyOwner public {
        require(cut <= 30, "cut cannot be more than 30%");
        require(cut >= 0, "cut should be greater than 0%");
        bitwordsCutOverride[publisher] = cut;
        emit SetPublisherCut(publisher, cut);
    }
}