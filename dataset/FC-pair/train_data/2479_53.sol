contract c2479{
    /**
     * @notice End token minting period permanently for STOs
     */
    function finishMintingSTO() public onlyOwner {
        finishedSTOMinting = true;
        emit LogFinishMintingSTO(now);
    }
}